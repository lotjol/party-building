<?php

namespace app\miniapp\controller;

use app\common\library\Ems;
use app\common\library\Sms;
use fast\Random;
use think\Config;
use think\Validate;

/**
 * 小程序用户接口
 */
class User extends Base
{
    protected $noNeedLogin = ['loginSms', 'loginPassword', 'register', 'resetPassword'];
    protected $noNeedRight = '*';

    public function _initialize()
    {
        parent::_initialize();

        if (!Config::get('fastadmin.usercenter')) {
            $this->error(__('User center already closed'));
        }
    }

    /**
     * 手机号+验证码登录
     *
     * @ApiMethod (POST)
     * @ApiParams (name="mobile", type="string", required=true, description="手机号")
     * @ApiParams (name="code", type="string", required=true, description="短信验证码")
     */
    public function loginSms()
    {
        $mobile = $this->request->post('mobile');
        $code = $this->request->post('code');

        if (!$mobile || !$code) {
            $this->error(__('参数不能为空'));
        }

        if (!Validate::regex($mobile, "^1\d{10}$")) {
            $this->error(__('手机号格式错误'));
        }

        // 验证验证码
        $this->verifySmsCode($mobile, $code, 'login');

        // 查找用户
        $user = \app\common\model\User::getByMobile($mobile);
        if (!$user) {
            $this->error(__('该手机号未注册'));
        }

        if ($user->status != 'normal') {
            $this->error(__('账户已被禁用'));
        }

        // 更新登录信息
        $user->logintime = time();
        $user->loginip = $this->request->ip();
        $user->prevtime = $user->logintime;
        $user->save();

        // 生成Token
        $token = $this->generateMiniAppToken($user);
        
        // 清除验证码记录
        $this->clearSmsCode($mobile, 'login');

        $responseData = [
            'token' => $token,
            'userinfo' => $this->processMiniAppData($user->toArray())
        ];
        
        
        $this->success(__('登录成功'), $responseData);
    }

    /**
     * 手机号+密码登录
     *
     * @ApiMethod (POST)
     * @ApiParams (name="mobile", type="string", required=true, description="手机号")
     * @ApiParams (name="password", type="string", required=true, description="密码")
     */
    public function loginPassword()
    {
        $mobile = $this->request->post('mobile');
        $password = $this->request->post('password');

        if (!$mobile || !$password) {
            $this->error(__('参数不能为空'));
        }

        if (!Validate::regex($mobile, "^1\d{10}$")) {
            $this->error(__('手机号格式错误'));
        }

        // 查找用户
        $user = \app\common\model\User::getByMobile($mobile);
        if (!$user) {
            $this->error(__('该手机号未注册'));
        }

        if ($user->status != 'normal') {
            $this->error(__('账户已被禁用'));
        }

        // 验证密码
        $encryptedPassword = md5($password . $user->salt);
        if ($encryptedPassword !== $user->password) {
            $this->error(__('密码错误'));
        }

        // 更新登录信息
        $user->logintime = time();
        $user->loginip = $this->request->ip();
        $user->prevtime = $user->logintime;
        $user->save();

        // 生成Token
        $token = $this->generateMiniAppToken($user);

        $this->success(__('登录成功'), [
            'token' => $token,
            'userinfo' => $this->processMiniAppData($user->toArray())
        ]);
    }

    /**
     * 退出登录
     * @ApiMethod (POST)
     */
    public function logout()
    {
        if (!$this->request->isPost()) {
            $this->error(__('Invalid parameters'));
        }
        
        // 删除小程序token
        $token = $this->auth->getToken();
        \app\common\library\Token::delete($token);
        
        $this->success(__('Logout successful'));
    }

    /**
     * 获取用户信息
     */
    public function profile()
    {
        $user = $this->auth->getUser();
        $userInfo = $this->processMiniAppData($user->toArray());
        
        $this->success('', $userInfo);
    }

    /**
     * 更新用户信息
     *
     * @ApiMethod (POST)
     * @ApiParams (name="nickname", type="string", required=false, description="昵称")
     * @ApiParams (name="avatar", type="string", required=false, description="头像")
     * @ApiParams (name="mobile", type="string", required=false, description="手机号")
     * @ApiParams (name="email", type="string", required=false, description="邮箱")
     */
    public function update()
    {
        $user = $this->auth->getUser();
        $nickname = $this->request->post('nickname');
        $avatar = $this->request->post('avatar');
        $mobile = $this->request->post('mobile');
        $email = $this->request->post('email');

        if ($nickname) {
            $exists = \app\common\model\User::where('nickname', $nickname)->where('id', '<>', $this->auth->id)->find();
            if ($exists) {
                $this->error(__('Nickname already exists'));
            }
            $user->nickname = $nickname;
        }

        if ($avatar) {
            $user->avatar = $avatar;
        }

        if ($mobile) {
            if (!Validate::regex($mobile, "^1\d{10}$")) {
                $this->error(__('Mobile is incorrect'));
            }
            $exists = \app\common\model\User::where('mobile', $mobile)->where('id', '<>', $this->auth->id)->find();
            if ($exists) {
                $this->error(__('Mobile already exists'));
            }
            $user->mobile = $mobile;
        }

        if ($email) {
            if (!Validate::is($email, "email")) {
                $this->error(__('Email is incorrect'));
            }
            $exists = \app\common\model\User::where('email', $email)->where('id', '<>', $this->auth->id)->find();
            if ($exists) {
                $this->error(__('Email already exists'));
            }
            $user->email = $email;
        }

        $user->save();
        
        $this->success(__('Update successful'), $this->processMiniAppData($user->toArray()));
    }


    /**
     * 用户注册
     *
     * @ApiMethod (POST)
     * @ApiParams (name="mobile", type="string", required=true, description="手机号")
     * @ApiParams (name="password", type="string", required=true, description="密码")
     * @ApiParams (name="code", type="string", required=true, description="短信验证码")
     * @ApiParams (name="nickname", type="string", required=false, description="昵称（可选）")
     */
    public function register()
    {
        $mobile = $this->request->post('mobile');
        $password = $this->request->post('password');
        $code = $this->request->post('code');
        $nickname = $this->request->post('nickname');

        // 验证必填参数
        if (!$mobile || !$password || !$code) {
            $this->error(__('参数不能为空'));
        }

        // 验证手机号格式
        if (!Validate::regex($mobile, "^1\d{10}$")) {
            $this->error(__('手机号格式错误'));
        }

        // 验证密码长度（最小6位）
        if (strlen($password) < 6) {
            $this->error(__('密码长度不能少于6位'));
        }

        // 验证密码强度（至少包含数字和字母）
        if (!preg_match('/^(?=.*[0-9])(?=.*[a-zA-Z]).{6,}$/', $password)) {
            $this->error(__('密码必须包含数字和字母'));
        }

        // 验证验证码
        $this->verifySmsCode($mobile, $code, 'register');

        // 检查手机号是否已注册
        $existingUser = \app\common\model\User::getByMobile($mobile);
        if ($existingUser) {
            $this->error(__('该手机号已注册'));
        }

        // 生成用户名（手机号+随机后缀）
        $username = 'user_' . $mobile . '_' . Random::alnum(4);

        // 生成密码盐和加密密码
        $salt = Random::alnum(6);
        $encryptedPassword = md5($password . $salt);

        // 创建用户
        $user = new \app\common\model\User();
        $user->username = $username;
        $user->nickname = $nickname ?: '用户' . substr($mobile, -4);
        $user->mobile = $mobile;
        $user->password = $encryptedPassword;
        $user->salt = $salt;
        $user->status = 'normal';
        $user->group_id = 1; // 默认用户组
        $user->createtime = time();
        $user->updatetime = time();
        $user->jointime = time();
        $user->joinip = $this->request->ip();

        if ($user->save()) {
            // 生成Token
            $token = $this->generateMiniAppToken($user);
            
            // 清除验证码记录
            $this->clearSmsCode($mobile, 'register');
            
            $this->success(__('注册成功'), [
                'token' => $token,
                'userinfo' => $this->processMiniAppData($user->toArray())
            ]);
        } else {
            $this->error(__('注册失败，请重试'));
        }
    }

    /**
     * 重置密码
     *
     * @ApiMethod (POST)
     * @ApiParams (name="mobile", type="string", required=true, description="手机号")
     * @ApiParams (name="code", type="string", required=true, description="短信验证码")
     * @ApiParams (name="password", type="string", required=true, description="新密码")
     */
    public function resetPassword()
    {
        $mobile = $this->request->post('mobile');
        $code = $this->request->post('code');
        $newPassword = $this->request->post('password');

        // 验证必填参数
        if (!$mobile || !$code || !$newPassword) {
            $this->error(__('参数不能为空'));
        }

        // 验证手机号格式
        if (!Validate::regex($mobile, "^1\d{10}$")) {
            $this->error(__('手机号格式错误'));
        }

        // 验证密码长度（最小6位）
        if (strlen($newPassword) < 6) {
            $this->error(__('密码长度不能少于6位'));
        }

        // 验证密码强度（至少包含数字和字母）
        if (!preg_match('/^(?=.*[0-9])(?=.*[a-zA-Z]).{6,}$/', $newPassword)) {
            $this->error(__('密码必须包含数字和字母'));
        }

        // 验证验证码
        $this->verifySmsCode($mobile, $code, 'resetpwd');

        // 查找用户
        $user = \app\common\model\User::getByMobile($mobile);
        if (!$user) {
            $this->error(__('该手机号未注册'));
        }

        if ($user->status != 'normal') {
            $this->error(__('账户已被禁用'));
        }

        // 生成新的密码盐和加密密码
        $salt = \fast\Random::alnum(6);
        $encryptedPassword = md5($newPassword . $salt);

        // 更新密码
        $user->password = $encryptedPassword;
        $user->salt = $salt;
        $user->updatetime = time();
        
        if ($user->save()) {
            // 清除验证码记录
            $this->clearSmsCode($mobile, 'resetpwd');
            
            $this->success(__('密码重置成功'));
        } else {
            $this->error(__('密码重置失败，请重试'));
        }
    }

    /**
     * 验证短信验证码
     * @param string $mobile 手机号
     * @param string $code 验证码
     * @param string $event 事件类型
     */
    protected function verifySmsCode($mobile, $code, $event)
    {
        $sms = \app\common\model\Sms::where('mobile', $mobile)
            ->where('event', $event)
            ->where('code', $code)
            ->where('createtime', '>', time() - 300) // 5分钟内有效
            ->order('createtime desc')
            ->find();

        if (!$sms) {
            $this->error(__('验证码错误或已过期'));
        }

        // 验证次数限制已取消
    }

    /**
     * 清除短信验证码记录
     * @param string $mobile 手机号
     * @param string $event 事件类型
     */
    protected function clearSmsCode($mobile, $event)
    {
        \app\common\model\Sms::where('mobile', $mobile)
            ->where('event', $event)
            ->delete();
    }
}
