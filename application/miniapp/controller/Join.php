<?php

namespace app\miniapp\controller;

use app\miniapp\controller\Base;
use think\Db;
use think\Exception;
use think\Validate;
use app\common\model\Sms as SmsModel;

/**
 * 入党申请控制器
 */
class Join extends Base
{
    protected $noNeedLogin = [];
    protected $noNeedRight = '*';

    /**
     * 提交入党申请
     * @ApiTitle (提交入党申请)
     * @ApiSummary (用户提交入党申请)
     * @ApiMethod (POST)
     * @ApiRoute (/miniapp/join/add)
     * @ApiHeaders (name=token, type=string, required=true, description="用户Token")
     * @ApiParams (name=username, type=string, required=true, description="姓名")
     * @ApiParams (name=mobile, type=string, required=true, description="手机号")
     * @ApiParams (name=code, type=string, required=true, description="短信验证码")
     * @ApiParams (name=images, type=string, required=false, description="申请书图片URL，多张用逗号分隔")
     * @ApiParams (name=memo, type=string, required=false, description="备注")
     * @ApiReturn ({"code":1,"msg":"申请提交成功","time":1760614000,"data":{"id":1,"status":"hidden"}})
     */
    public function add()
    {
        $username = $this->request->post('username', '');
        $mobile = $this->request->post('mobile', '');
        $code = $this->request->post('code', '');
        $images = $this->request->post('images', '');
        $memo = $this->request->post('memo', '');

        // 验证必填字段
        if (empty($username)) {
            $this->error(__('姓名不能为空'));
        }
        if (empty($mobile)) {
            $this->error(__('手机号不能为空'));
        }
        if (empty($code)) {
            $this->error(__('验证码不能为空'));
        }

        // 验证手机号格式
        if (!Validate::regex($mobile, "^1\d{10}$")) {
            $this->error(__('手机号格式错误'));
        }

        // 验证验证码格式
        if (!preg_match("/^\d{6}$/", $code)) {
            $this->error(__('验证码格式错误'));
        }

        // 验证短信验证码
        $sms = SmsModel::where('mobile', $mobile)
            ->where('event', 'joinparty')
            ->where('code', $code)
            ->where('createtime', '>', time() - 300) // 5分钟内有效
            ->order('createtime desc')
            ->find();

        if (!$sms) {
            $this->error(__('验证码错误或已过期'));
        }

        // 验证长度
        if (mb_strlen($username) > 255) {
            $this->error(__('姓名不能超过255个字符'));
        }
        if (mb_strlen($images) > 1500) {
            $this->error(__('申请书图片路径不能超过1500个字符'));
        }
        if (mb_strlen($memo) > 1500) {
            $this->error(__('备注不能超过1500个字符'));
        }

        // 检查是否已经申请过
        $existingApplication = Db::name('cms_diyform_join_party')
            ->where('user_id', $this->auth->id)
            ->where('status', 'in', ['normal', 'hidden'])
            ->find();

        if ($existingApplication) {
            $this->error(__('您已经提交过入党申请，请勿重复提交'));
        }

        try {
            Db::startTrans();
            
            $data = [
                'user_id' => $this->auth->id,
                'username' => $username,
                'mobile' => $mobile,
                'images' => $images,
                'memo' => $memo,
                'status' => 'hidden', // 默认隐藏状态，需要审核
                'createtime' => time(),
                'updatetime' => time()
            ];

            $applicationId = Db::name('cms_diyform_join_party')->insertGetId($data);
            
            Db::commit();

            $this->success(__('申请提交成功'), [
                'id' => $applicationId,
                'status' => 'hidden'
            ]);

        } catch (Exception $e) {
            Db::rollback();
            $this->error(__('申请提交失败：') . $e->getMessage());
        }
    }
}
