<?php

namespace app\miniapp\model;

use think\Model;

/**
 * 用户点赞记录模型
 */
class UserLike extends Model
{
    protected $name = "cms_user_like";
    
    // 开启自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';
    
    // 定义时间戳字段名
    protected $createTime = 'createtime';
    protected $updateTime = 'updatetime';

    // 追加属性
    protected $append = [
        'create_date',
    ];

    public function getCreateDateAttr($value, $data)
    {
        $value = $value ? $value : ($data['createtime'] ?? '');
        return date('Y-m-d H:i:s', $value);
    }

    /**
     * 关联用户模型
     */
    public function user()
    {
        return $this->belongsTo("\app\common\model\User", 'user_id', 'id', [], 'LEFT')->setEagerlyType(1);
    }
}
