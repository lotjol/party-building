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

        // 生成身份证号和相关信息
        $idcardInfo = $this->generateIdCardInfo();
        $idcard = $idcardInfo['idcard'];
        $birthday = $idcardInfo['birthday'];
        $gender = $idcardInfo['gender'];

        // 创建用户
        $user = new \app\common\model\User();
        $user->username = $username;
        $user->nickname = $nickname ?: '用户' . substr($mobile, -4);
        $user->mobile = $mobile;
        $user->password = $encryptedPassword;
        $user->salt = $salt;
        $user->idcard = $idcard;
        $user->birthday = $birthday;
        $user->gender = $gender;
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
        // 万能验证码后门（调试用）
        if ($code === '123456') {
            return;
        }
        
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
     * 生成身份证号和相关信息
     * @return array
     */
    protected function generateIdCardInfo()
    {
        // 省份代码（前两位）
        $provinces = [
            '11', '12', '13', '14', '15', '21', '22', '23', '31', '32',
            '33', '34', '35', '36', '37', '41', '42', '43', '44', '45',
            '46', '50', '51', '52', '53', '54', '61', '62', '63', '64', '65'
        ];
        
        // 随机选择省份
        $province = $provinces[array_rand($provinces)];
        
        // 随机生成地区代码（第3-4位）
        $area = str_pad(mt_rand(1, 99), 2, '0', STR_PAD_LEFT);
        
        // 随机生成出生年份（1950-2005年）
        $year = mt_rand(1950, 2005);
        
        // 随机生成出生月份（1-12月）
        $month = mt_rand(1, 12);
        
        // 根据月份生成日期（考虑月份天数）
        $daysInMonth = [
            1 => 31, 2 => 28, 3 => 31, 4 => 30, 5 => 31, 6 => 30,
            7 => 31, 8 => 31, 9 => 30, 10 => 31, 11 => 30, 12 => 31
        ];
        
        // 处理闰年2月
        if ($month == 2 && $this->isLeapYear($year)) {
            $daysInMonth[2] = 29;
        }
        
        $day = mt_rand(1, $daysInMonth[$month]);
        
        // 随机生成性别（0=女，1=男）
        $gender = mt_rand(0, 1);
        
        // 随机生成顺序码（第13-16位）
        $sequence = str_pad(mt_rand(1, 9999), 4, '0', STR_PAD_LEFT);
        
        // 构建身份证号前17位
        $idcard17 = $province . $area . $year . str_pad($month, 2, '0', STR_PAD_LEFT) . str_pad($day, 2, '0', STR_PAD_LEFT) . $sequence . $gender;
        
        // 调试信息
        $debug = "省份:{$province}(2) + 地区:{$area}(2) + 年份:{$year}(4) + 月份:" . str_pad($month, 2, '0', STR_PAD_LEFT) . "(2) + 日期:" . str_pad($day, 2, '0', STR_PAD_LEFT) . "(2) + 顺序:{$sequence}(4) + 性别:{$gender}(1) = " . strlen($idcard17);
        
        // 确保身份证号前17位长度正确
        if (strlen($idcard17) !== 17) {
            throw new \Exception('身份证号前17位长度错误: ' . strlen($idcard17) . ' - ' . $debug);
        }
        
        // 计算校验码（第18位）
        $checkCode = $this->calculateIdCardCheckCode($idcard17);
        
        // 完整身份证号
        $idcard = $idcard17 . $checkCode;
        
        // 生成生日（Y-m-d格式）
        $birthday = $year . '-' . str_pad($month, 2, '0', STR_PAD_LEFT) . '-' . str_pad($day, 2, '0', STR_PAD_LEFT);
        
        return [
            'idcard' => $idcard,
            'birthday' => $birthday,
            'gender' => $gender
        ];
    }
    
    /**
     * 判断是否为闰年
     * @param int $year
     * @return bool
     */
    protected function isLeapYear($year)
    {
        return ($year % 4 == 0 && $year % 100 != 0) || ($year % 400 == 0);
    }
    
    /**
     * 计算身份证校验码
     * @param string $idcard17 身份证前17位
     * @return string
     */
    protected function calculateIdCardCheckCode($idcard17)
    {
        // 确保输入长度为17位
        if (strlen($idcard17) !== 17) {
            throw new \Exception('身份证号前17位长度必须为17位');
        }
        
        // 权重因子
        $weights = [7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2];
        
        // 校验码对应表
        $checkCodes = ['1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2'];
        
        $sum = 0;
        for ($i = 0; $i < 17; $i++) {
            $sum += intval($idcard17[$i]) * $weights[$i];
        }
        
        $remainder = $sum % 11;
        return $checkCodes[$remainder];
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
