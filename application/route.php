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
    
    // 文章API路由（Article - 通用文章功能）
    'miniapp/article/list' => 'miniapp/article/list',
    'miniapp/article/detail' => 'miniapp/article/detail',
    'miniapp/article/hot' => 'miniapp/article/hot',
    'miniapp/article/search' => 'miniapp/article/search',
    
    // 精品书籍API路由（Book - 精品书籍功能）
    'miniapp/book/list' => 'miniapp/book/list',
    'miniapp/book/detail' => 'miniapp/book/detail',
    
    // 组织活动API路由（Activity - 组织活动功能）
    'miniapp/activity/list' => 'miniapp/activity/list',
    'miniapp/activity/detail' => 'miniapp/activity/detail',
    
    // 党员先锋API路由（Member - 党员先锋功能）
    'miniapp/member/list' => 'miniapp/member/list',
    'miniapp/member/detail' => 'miniapp/member/detail',
    
    // 区块API路由（Block - CMS区块管理）
    'miniapp/block/name' => 'miniapp/block/name',
    
    // 点赞API路由（Like - 文章点赞功能）
    'miniapp/article/like' => ['miniapp/like/archives', 'POST'],
    'miniapp/article/like/status' => 'miniapp/like/status',
    
    // 收藏API路由（Collection - 文章收藏功能）
    'miniapp/article/collection' => ['miniapp/collection/archives', 'POST'],
    'miniapp/user/collections' => 'miniapp/collection/list',
    'miniapp/article/collection/status' => 'miniapp/collection/status',
    
    // 学习记录API路由（Study - 文章学习记录功能）
    'miniapp/article/study' => ['miniapp/archives/study', 'POST'],
    'miniapp/article/study/list' => 'miniapp/archives/study_list',
    'miniapp/article/study/status' => 'miniapp/archives/study_status',
    'miniapp/article/study/delete' => ['miniapp/archives/study_delete', 'POST'],
    'miniapp/article/study/clear' => ['miniapp/archives/study_clear', 'POST'],
    
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
