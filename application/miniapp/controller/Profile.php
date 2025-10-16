<?php

namespace app\miniapp\controller;

use app\miniapp\controller\Base;
use think\Db;
use think\Exception;

/**
 * 个人档案控制器
 */
class Profile extends Base
{
    protected $noNeedLogin = [];
    protected $noNeedRight = '*';

    /**
     * 获取个人档案信息
     * @ApiTitle (获取个人档案)
     * @ApiSummary (获取当前登录用户的完整档案信息)
     * @ApiMethod (GET)
     * @ApiRoute (/miniapp/profile/info)
     * @ApiHeaders (name=token, type=string, required=true, description="用户Token")
     * @ApiReturn ({"code":1,"msg":"获取成功","time":1760614000,"data":{"basic_info":{"avatar":"","name":"","gender":"","idcard":"","birthday":""},"party_info":{"organization":"","member_id":"","role":"","join_date":"","activist_date":""}}})
     */
    public function info()
    {
        try {
            $userId = $this->auth->id;
            
            // 获取用户基础信息
            $user = Db::name('user')
                ->where('id', $userId)
                ->find();
            
            if (!$user) {
                $this->error(__('用户信息不存在'));
            }
            
            // 获取最新的入党申请信息
            $joinParty = Db::name('cms_diyform_join_party')
                ->where('user_id', $userId)
                ->where('status', 'normal')
                ->order('createtime desc')
                ->find();
            
            // 获取最新的组织关系转移信息
            $organization = Db::name('cms_diyform_organization')
                ->where('user_id', $userId)
                ->where('status', 'normal')
                ->order('createtime desc')
                ->find();
            
            // 处理性别显示
            $genderMap = [
                0 => '女',
                1 => '男'
            ];
            $gender = $genderMap[$user['gender']] ?? '未知';
            
            // 处理出生日期格式
            $birthday = $user['birthday'] ? date('Y.m.d', strtotime($user['birthday'])) : '';
            
            // 处理申请入党时间
            $joinDate = '';
            if ($joinParty && $joinParty['createtime']) {
                $joinDate = date('Y.m.d', $joinParty['createtime']);
            }
            
            // 处理确定为积极分子时间（暂时返回空，需要额外字段）
            $activistDate = '--';
            
            // 构建基础信息
            $basicInfo = [
                'avatar' => $user['avatar'] ?: '',
                'name' => $user['nickname'] ?: $user['username'] ?: '',
                'gender' => $gender,
                'idcard' => $user['idcard'] ?: '',
                'birthday' => $birthday
            ];
            
            // 构建党籍信息
            $partyInfo = [
                'organization' => $organization['title'] ?? '',
                'member_id' => $organization['member_id'] ?? '',
                'role' => $organization['role'] ?? '',
                'join_date' => $joinDate,
                'activist_date' => $activistDate
            ];
            
            $profileData = [
                'basic_info' => $basicInfo,
                'party_info' => $partyInfo
            ];
            
            $this->success(__('获取成功'), $profileData);
            
        } catch (Exception $e) {
            $this->error(__('获取档案信息失败：') . $e->getMessage());
        }
    }
}
