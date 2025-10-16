<?php

namespace app\miniapp\controller;

use app\common\model\Sms as SmsModel;
use app\common\model\User;
use fast\Random;
use think\Validate;

/**
 * 小程序短信接口
 */
class Sms extends Base
{
    protected $noNeedLogin = '*';
    protected $noNeedRight = '*';

    /**
     * 发送验证码
     *
     * @ApiMethod (POST)
     * @ApiParams (name="mobile", type="string", required=true, description="手机号")
     * @ApiParams (name="event", type="string", required=false, description="事件名称：register(注册), login(登录), resetpwd(重置密码), changemobile(更换手机), joinparty(入党申请)，默认为register")
     */
    public function send()
    {
        $mobile = $this->request->post("mobile");
        $event = $this->request->post("event", "register");

        // 验证手机号格式
        if (!$mobile || !Validate::regex($mobile, "^1\d{10}$")) {
            $this->error(__('手机号格式错误'));
        }

        // 检查发送频率限制（60秒内不能重复发送）
        $lastSms = SmsModel::where('mobile', $mobile)
            ->where('event', $event)
            ->where('createtime', '>', time() - 60)
            ->find();
        
        if ($lastSms) {
            $this->error(__('发送过于频繁，请60秒后再试'));
        }

        // IP发送频率限制已取消

        // 检查业务逻辑
        $this->checkBusinessLogic($mobile, $event);

        // 生成6位随机验证码
        $code = str_pad(mt_rand(0, 999999), 6, '0', STR_PAD_LEFT);

        // 存储验证码到数据库
        $smsData = [
            'event' => $event,
            'mobile' => $mobile,
            'code' => $code,
            'times' => 0,
            'ip' => $this->request->ip(),
            'createtime' => time()
        ];

        $sms = new SmsModel();
        $sms->save($smsData);

        // 返回验证码（开发阶段，生产环境应该通过短信服务发送）
        $this->success(__('验证码发送成功'), [
            'code' => $code,
            'expire_time' => 300, // 5分钟有效期
            'message' => '验证码已发送，5分钟内有效'
        ]);
    }

    /**
     * 验证验证码
     *
     * @ApiMethod (POST)
     * @ApiParams (name="mobile", type="string", required=true, description="手机号")
     * @ApiParams (name="code", type="string", required=true, description="验证码")
     * @ApiParams (name="event", type="string", required=false, description="事件名称：register(注册), login(登录), resetpwd(重置密码), changemobile(更换手机), joinparty(入党申请)，默认为register")
     */
    public function verify()
    {
        $mobile = $this->request->post("mobile");
        $code = $this->request->post("code");
        $event = $this->request->post("event", "register");

        // 验证参数
        if (!$mobile || !$code) {
            $this->error(__('参数不能为空'));
        }

        if (!Validate::regex($mobile, "^1\d{10}$")) {
            $this->error(__('手机号格式错误'));
        }

        if (!preg_match("/^\d{6}$/", $code)) {
            $this->error(__('验证码格式错误'));
        }

        // 查找验证码记录
        $sms = SmsModel::where('mobile', $mobile)
            ->where('event', $event)
            ->where('code', $code)
            ->where('createtime', '>', time() - 300) // 5分钟内有效
            ->order('createtime desc')
            ->find();

        if (!$sms) {
            $this->error(__('验证码错误或已过期'));
        }

        // 验证次数限制已取消

        $this->success(__('验证码验证成功'), [
            'verified' => true,
            'mobile' => $mobile,
            'event' => $event
        ]);
    }

    /**
     * 检查业务逻辑
     * @param string $mobile 手机号
     * @param string $event 事件类型
     */
    protected function checkBusinessLogic($mobile, $event)
    {
        $user = User::getByMobile($mobile);
        
        switch ($event) {
            case 'register':
                if ($user) {
                    $this->error(__('该手机号已注册'));
                }
                break;
            case 'login':
            case 'resetpwd':
                if (!$user) {
                    $this->error(__('该手机号未注册'));
                }
                break;
            case 'changemobile':
                if ($user) {
                    $this->error(__('该手机号已被使用'));
                }
                break;
            case 'joinparty':
                // 入党申请验证码：不检查用户是否存在，允许任何手机号申请
                // 这里可以添加其他业务逻辑，比如检查是否已经申请过等
                break;
        }
    }
}
