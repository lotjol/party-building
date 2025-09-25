<?php

// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

return [
    //别名配置,别名只能是映射到控制器且访问时必须加上请求的方法
    '__alias__'   => [
    ],
    //变量规则
    '__pattern__' => [
    ],
    
    // 小程序API路由
    'miniapp/user/login/sms' => ['miniapp/user/loginSms', 'POST'],
    'miniapp/user/login/password' => ['miniapp/user/loginPassword', 'POST'],
    'miniapp/user/logout' => ['miniapp/user/logout', 'POST'],
    'miniapp/user/profile' => 'miniapp/user/profile',
    'miniapp/user/update' => ['miniapp/user/update', 'POST'],
    'miniapp/user/register' => ['miniapp/user/register', 'POST'],
    'miniapp/user/password/reset' => ['miniapp/user/resetPassword', 'POST'],
    'miniapp/sms/send' => ['miniapp/sms/send', 'POST'],
    'miniapp/sms/verify' => ['miniapp/sms/verify', 'POST'],
    'miniapp/index/info' => 'miniapp/index/info',
    'miniapp/content/list' => 'miniapp/content/list',
    'miniapp/content/detail' => 'miniapp/content/detail',
    'miniapp/upload/image' => ['miniapp/upload/image', 'POST'],
    
    // 单页API路由
    'miniapp/page/list' => 'miniapp/page/list',
    'miniapp/page/detail' => 'miniapp/page/detail',
    'miniapp/page/types' => 'miniapp/page/types',
    
    // 栏目API路由
    'miniapp/channel/list' => 'miniapp/channel/list',
    'miniapp/channel/detail' => 'miniapp/channel/detail',
    
    // 文章API路由（Archives - CMS标准术语）
    'miniapp/archives/list' => 'miniapp/archives/list',
    'miniapp/archives/detail' => 'miniapp/archives/detail',
    'miniapp/archives/hot' => 'miniapp/archives/hot',
    'miniapp/archives/search' => 'miniapp/archives/search',
    
//        域名绑定到模块
//        '__domain__'  => [
//            'admin' => 'admin',
//            'api'   => 'api',
//            'miniapp' => 'miniapp',
//        ],
];
