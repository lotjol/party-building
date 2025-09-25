<?php

namespace app\miniapp\controller;

use app\common\controller\Api;
use app\common\library\Auth;
use think\Config;
use think\Loader;
use think\Request;
use think\Response;
use think\Route;
use think\Validate;
use think\Lang;
use think\Hook;

/**
 * 小程序API控制器基类
 */
class Base extends Api
{
    /**
     * 小程序配置
     * @var array
     */
    protected $miniappConfig = [];

    /**
     * 初始化操作
     * @access protected
     */
    protected function _initialize()
    {
        // 加载小程序配置
        // $this->loadMiniAppConfig();
        
        // 跨域请求检测
        // check_cors_request();

        // 检测IP是否允许
        // check_ip_allowed();

        //移除HTML标签
        $this->request->filter('trim,strip_tags,htmlspecialchars');

        $this->auth = Auth::instance();

        $modulename = $this->request->module();
        $controllername = Loader::parseName($this->request->controller());
        $actionname = strtolower($this->request->action());

        // token
        $token = $this->request->server('HTTP_TOKEN', $this->request->request('token', \think\Cookie::get('token')));

        $path = str_replace('.', '/', $controllername) . '/' . $actionname;
        // 设置当前请求的URI
        $this->auth->setRequestUri($path);
        
        // 小程序特有的验证逻辑
        $this->validateMiniApp();
        
        // 检测是否需要验证登录
        if (!$this->auth->match($this->noNeedLogin)) {
            //初始化
            $this->auth->init($token);
            //检测是否登录
            if (!$this->auth->isLogin()) {
                $this->error(__('Please login first'), null, 401);
            }
            // 判断是否需要验证权限
            if (!$this->auth->match($this->noNeedRight)) {
                // 判断控制器和方法判断是否有对应权限
                if (!$this->auth->check($path)) {
                    $this->error(__('You have no permission'), null, 403);
                }
            }
        } else {
            // 如果有传递token才验证是否登录状态
            if ($token) {
                $this->auth->init($token);
            }
        }

        $upload = \app\common\model\Config::upload();

        // 上传信息配置后
        Hook::listen("upload_config_init", $upload);

        Config::set('upload', array_merge(Config::get('upload'), $upload));

        // 加载当前控制器语言包
        $this->loadlang($controllername);
    }

    /**
     * 加载小程序配置
     */
    protected function loadMiniAppConfig()
    {
        $config = Config::get('miniapp') ?: [];
        $this->miniappConfig = [
            'app_id' => $config['wechat']['app_id'] ?? '',
            'app_secret' => $config['wechat']['app_secret'] ?? '',
            'session_expire' => $config['session']['expire'] ?? 7200,
            'token_expire' => $config['token']['expire'] ?? 2592000,
        ];
    }

    /**
     * 小程序身份验证
     */
    protected function validateMiniApp()
    {
        // 验证小程序来源
        $userAgent = $this->request->server('HTTP_USER_AGENT', '');
        if (strpos($userAgent, 'miniProgram') === false && strpos($userAgent, 'MicroMessenger') === false) {
            // 如果不是小程序环境，记录日志但不阻止访问
            \think\Log::info('小程序API访问来源异常: ' . $userAgent);
        }
    }

    /**
     * 小程序数据处理
     */
    protected function processMiniAppData($data)
    {
        // 处理小程序特有的数据格式
        if (is_array($data)) {
            // 移除不需要的字段
            $removeFields = ['password', 'salt', 'token', 'url', 'logintime', 'loginip', 'loginfailure', 'loginfailuretime', 'prevtime', 'money', 'score', 'successions', 'maxsuccessions', 'level', 'gender', 'birthday', 'bio', 'verification'];
            foreach ($removeFields as $field) {
                unset($data[$field]);
            }
            
            // 处理头像字段
            if (isset($data['avatar'])) {
                // 检查是否是base64头像（自动生成的首字母头像）
                if (strpos($data['avatar'], 'data:image/svg+xml;base64,') === 0) {
                    // 如果是自动生成的base64头像，设置为空字符串
                    $data['avatar'] = '';
                } else {
                    // 如果是正常路径，保持原值
                    $data['avatar'] = $data['avatar'] ?: '';
                }
            } else {
                // 如果没有头像字段，添加空字符串
                $data['avatar'] = '';
            }
            
            // 格式化时间字段
            if (isset($data['createtime'])) {
                $data['createtime'] = date('Y-m-d H:i:s', $data['createtime']);
            }
            if (isset($data['updatetime'])) {
                $data['updatetime'] = date('Y-m-d H:i:s', $data['updatetime']);
            }
            if (isset($data['jointime'])) {
                $data['jointime'] = date('Y-m-d H:i:s', $data['jointime']);
            }
        }
        
        return $data;
    }

    /**
     * 小程序成功返回
     * @param string $msg    提示信息
     * @param mixed  $data   要返回的数据
     * @param int    $code   错误码，默认为1
     * @param string $type   输出类型
     * @param array  $header 发送的 Header 信息
     */
    protected function success($msg = '', $data = null, $code = 1, $type = null, array $header = [])
    {
        // 处理小程序数据
        if ($data !== null) {
            $data = $this->processMiniAppData($data);
        }
        
        parent::success($msg, $data, $code, $type, $header);
    }

    /**
     * 获取微信小程序session_key
     * @param string $code 微信授权码
     * @return array
     */
    protected function getWechatSession($code)
    {
        $url = 'https://api.weixin.qq.com/sns/jscode2session';
        $params = [
            'appid' => $this->miniappConfig['app_id'],
            'secret' => $this->miniappConfig['app_secret'],
            'js_code' => $code,
            'grant_type' => 'authorization_code'
        ];
        
        $response = \fast\Http::get($url, $params);
        $result = json_decode($response, true);
        
        if (isset($result['errcode'])) {
            $this->error('微信授权失败: ' . $result['errmsg']);
        }
        
        return $result;
    }

    /**
     * 解密微信用户信息
     * @param string $encryptedData 加密数据
     * @param string $iv 初始向量
     * @param string $sessionKey 会话密钥
     * @return array
     */
    protected function decryptUserInfo($encryptedData, $iv, $sessionKey)
    {
        $sessionKey = base64_decode($sessionKey);
        $encryptedData = base64_decode($encryptedData);
        $iv = base64_decode($iv);
        
        $decrypted = openssl_decrypt($encryptedData, 'AES-128-CBC', $sessionKey, OPENSSL_RAW_DATA, $iv);
        
        if ($decrypted === false) {
            $this->error('用户信息解密失败');
        }
        
        $userInfo = json_decode($decrypted, true);
        
        if (!$userInfo) {
            $this->error('用户信息解析失败');
        }
        
        return $userInfo;
    }

    /**
     * 生成小程序专用token
     * @param object $user 用户对象
     * @return string
     */
    protected function generateMiniAppToken($user)
    {
        $token = \fast\Random::uuid();
        \app\common\library\Token::set($token, $user->id, $this->miniappConfig['token_expire']);
        return $token;
    }
}
