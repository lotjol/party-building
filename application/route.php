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
    
    // 区块API路由（Block - CMS区块管理）
    'miniapp/block/name' => 'miniapp/block/name',
    
    // 点赞API路由（Like - 文章点赞功能）
    'miniapp/archives/like' => ['miniapp/like/archives', 'POST'],
    'miniapp/archives/like/status' => 'miniapp/like/status',
    
    // 收藏API路由（Collection - 文章收藏功能）
    'miniapp/archives/collection' => ['miniapp/collection/archives', 'POST'],
    'miniapp/user/collections' => 'miniapp/collection/list',
    'miniapp/archives/collection/status' => 'miniapp/collection/status',
    
    // 学习记录API路由（Study - 文章学习记录功能）
    'miniapp/archives/study' => ['miniapp/archives/study', 'POST'],
    'miniapp/archives/study/list' => 'miniapp/archives/study_list',
    'miniapp/archives/study/status' => 'miniapp/archives/study_status',
    'miniapp/archives/study/delete' => ['miniapp/archives/study_delete', 'POST'],
    'miniapp/archives/study/clear' => ['miniapp/archives/study_clear', 'POST'],
    
    // 建言献策API路由（Suggestion - 用户建议功能）
    'miniapp/suggestion/add' => ['miniapp/suggestion/add', 'POST'],
    'miniapp/suggestion/list' => 'miniapp/suggestion/myList',
    'miniapp/suggestion/detail' => 'miniapp/suggestion/detail',
    'miniapp/suggestion/delete' => ['miniapp/suggestion/delete', 'POST'],
    
    // 个人档案API路由（Profile - 个人档案功能）
    'miniapp/profile/info' => 'miniapp/profile/info',
    
    // 活动API路由（Activity - 活动报名功能）
    'miniapp/activity/signup' => ['miniapp/activity/signup', 'POST'],
    'miniapp/activity/cancel' => ['miniapp/activity/cancel', 'POST'],
    
//        域名绑定到模块
//        '__domain__'  => [
//            'admin' => 'admin',
//            'api'   => 'api',
//            'miniapp' => 'miniapp',
//        ],
];
