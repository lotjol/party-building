<?php

namespace app\miniapp\controller;

use app\miniapp\controller\Base;
use think\Db;
use think\Exception;
use think\Validate;
use fast\Random;

/**
 * 组织关系转移控制器
 */
class Organization extends Base
{
    protected $noNeedLogin = [];
    protected $noNeedRight = '*';

    /**
     * 提交组织关系转移申请
     * @ApiTitle (提交组织关系转移申请)
     * @ApiSummary (用户提交组织关系转移申请)
     * @ApiMethod (POST)
     * @ApiRoute (/miniapp/organization/add)
     * @ApiHeaders (name=token, type=string, required=true, description="用户Token")
     * @ApiParams (name=title, type=string, required=true, description="目标党组织名称")
     * @ApiParams (name=reason, type=string, required=true, description="调转原因")
     * @ApiParams (name=images, type=string, required=false, description="资料证明图片URL，多张用逗号分隔")
     * @ApiParams (name=memo, type=string, required=false, description="备注")
     * @ApiReturn ({"code":1,"msg":"申请提交成功","time":1760614000,"data":{"id":1,"member_id":"123456","role":"普通党员","status":"normal"}})
     */
    public function add()
    {
        $title = $this->request->post('title', '');
        $reason = $this->request->post('reason', '');
        $images = $this->request->post('images', '');
        $memo = $this->request->post('memo', '');

        // 验证必填字段
        if (empty($title)) {
            $this->error(__('目标党组织名称不能为空'));
        }
        if (empty($reason)) {
            $this->error(__('调转原因不能为空'));
        }

        // 验证长度
        if (mb_strlen($title) > 255) {
            $this->error(__('目标党组织名称不能超过255个字符'));
        }
        if (mb_strlen($reason) > 255) {
            $this->error(__('调转原因不能超过255个字符'));
        }
        if (mb_strlen($images) > 1500) {
            $this->error(__('资料证明图片路径不能超过1500个字符'));
        }
        if (mb_strlen($memo) > 1500) {
            $this->error(__('备注不能超过1500个字符'));
        }

        // 检查是否已经申请过
        $existingApplication = Db::name('cms_diyform_organization')
            ->where('user_id', $this->auth->id)
            ->where('status', 'in', ['normal', 'hidden'])
            ->find();

        if ($existingApplication) {
            $this->error(__('您已经提交过组织关系转移申请，请勿重复提交'));
        }

        try {
            Db::startTrans();
            
            // 生成6位随机党员编号
            $memberId = str_pad(mt_rand(0, 999999), 6, '0', STR_PAD_LEFT);
            
            // 检查党员编号是否已存在
            $existingMember = Db::name('cms_diyform_organization')
                ->where('member_id', $memberId)
                ->find();
            
            // 如果党员编号已存在，重新生成
            while ($existingMember) {
                $memberId = str_pad(mt_rand(0, 999999), 6, '0', STR_PAD_LEFT);
                $existingMember = Db::name('cms_diyform_organization')
                    ->where('member_id', $memberId)
                    ->find();
            }
            
            $data = [
                'user_id' => $this->auth->id,
                'member_id' => $memberId,
                'role' => '普通党员',
                'title' => $title,
                'reason' => $reason,
                'images' => $images,
                'memo' => $memo,
                'status' => 'normal', // 默认正常状态
                'createtime' => time(),
                'updatetime' => time()
            ];

            $applicationId = Db::name('cms_diyform_organization')->insertGetId($data);
            
            Db::commit();

            $this->success(__('申请提交成功'), [
                'id' => $applicationId,
                'member_id' => $memberId,
                'role' => '普通党员',
                'status' => 'normal'
            ]);

        } catch (Exception $e) {
            Db::rollback();
            $this->error(__('申请提交失败：') . $e->getMessage());
        }
    }
}
