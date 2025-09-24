<?php

// 小程序配置文件
return [
    // 微信小程序配置
    'wechat' => [
        'app_id' => '', // 小程序AppID
        'app_secret' => '', // 小程序AppSecret
    ],
    
    // Token配置
    'token' => [
        'expire' => 2592000, // Token过期时间（秒）30天
        'refresh_expire' => 7200, // 刷新Token过期时间（秒）2小时
    ],
    
    // 会话配置
    'session' => [
        'expire' => 7200, // Session过期时间（秒）2小时
    ],
    
    // 小程序特有配置
    'miniapp' => [
        'version' => '1.0.0', // 小程序版本
        'debug' => false, // 调试模式
        'cache_time' => 300, // 缓存时间（秒）
    ],
    
    // 上传配置
    'upload' => [
        'max_size' => 5242880, // 最大上传大小（5MB）
        'allowed_types' => ['jpg', 'jpeg', 'png', 'gif'], // 允许的文件类型
        'path' => 'miniapp/', // 上传路径
    ],
    
    // 分页配置
    'page' => [
        'default_size' => 10, // 默认每页数量
        'max_size' => 50, // 最大每页数量
    ],
];
