<?php

namespace app\miniapp\controller;

use app\miniapp\controller\Base;
use think\Db;
use think\Exception;

/**
 * 建言献策控制器
 */
class Suggestion extends Base
{
    protected $noNeedLogin = [];
    protected $noNeedRight = '*';

    /**
     * 提交建议
     * @ApiTitle (提交建议)
     * @ApiSummary (用户提交新的建议)
     * @ApiMethod (POST)
     * @ApiRoute (/miniapp/suggestion/add)
     * @ApiHeaders (name=token, type=string, required=true, description="用户Token")
     * @ApiParams (name=title, type=string, required=true, description="建议标题")
     * @ApiParams (name=content, type=string, required=true, description="建议详细内容")
     * @ApiParams (name=label, type=string, required=false, description="标签/分类")
     * @ApiParams (name=memo, type=string, required=false, description="备注")
     * @ApiReturn ({"code":1,"msg":"提交成功","time":1760614000,"data":{"id":1,"status":"hidden"}})
     */
    public function add()
    {
        $title = $this->request->post('title', '');
        $content = $this->request->post('content', '');
        $label = $this->request->post('label', '');
        $memo = $this->request->post('memo', '');

        // 验证必填字段
        if (empty($title)) {
            $this->error(__('建议标题不能为空'));
        }
        if (empty($content)) {
            $this->error(__('建议内容不能为空'));
        }

        // 验证长度
        if (mb_strlen($title) > 255) {
            $this->error(__('建议标题不能超过255个字符'));
        }
        if (mb_strlen($label) > 255) {
            $this->error(__('标签不能超过255个字符'));
        }
        if (mb_strlen($memo) > 1500) {
            $this->error(__('备注不能超过1500个字符'));
        }

        try {
            Db::startTrans();
            
            $data = [
                'user_id' => $this->auth->id,
                'username' => $this->auth->username,
                'title' => $title,
                'content' => $content,
                'label' => $label,
                'memo' => $memo,
                'status' => 'normal', // 默认正常状态
                'createtime' => time(),
                'updatetime' => time()
            ];

            $suggestionId = Db::name('cms_diyform_suggestion')->insertGetId($data);
            
            Db::commit();

            $this->success(__('提交成功'), [
                'id' => $suggestionId,
                'status' => 'normal'
            ]);

        } catch (Exception $e) {
            Db::rollback();
            $this->error(__('提交失败：') . $e->getMessage());
        }
    }

    /**
     * 我的建议列表
     * @ApiTitle (我的建议列表)
     * @ApiSummary (获取当前用户提交的建议列表)
     * @ApiMethod (GET)
     * @ApiRoute (/miniapp/suggestion/myList)
     * @ApiHeaders (name=token, type=string, required=true, description="用户Token")
     * @ApiParams (name=page, type=int, required=false, description="页码，默认1")
     * @ApiParams (name=limit, type=int, required=false, description="每页数量，默认10")
     * @ApiParams (name=status, type=string, required=false, description="状态筛选：normal,hidden,rejected")
     * @ApiReturn ({"code":1,"msg":"获取成功","time":1760614000,"data":{"list":[],"total":0,"page":1,"limit":10}})
     */
    public function myList()
    {
        $page = $this->request->get('page', 1);
        $limit = $this->request->get('limit', 10);
        $status = $this->request->get('status', '');

        $where = [
            'user_id' => $this->auth->id
        ];

        // 状态筛选
        if (!empty($status) && in_array($status, ['normal', 'hidden', 'rejected'])) {
            $where['status'] = $status;
        }

        $list = Db::name('cms_diyform_suggestion')
            ->where($where)
            ->field('id,title,content,label,status,createtime,updatetime')
            ->order('createtime desc')
            ->page($page, $limit)
            ->select();

        $total = Db::name('cms_diyform_suggestion')
            ->where($where)
            ->count();

        // 处理内容摘要
        foreach ($list as &$item) {
            $item['content'] = mb_substr(strip_tags($item['content']), 0, 100) . '...';
            $item['createtime_text'] = date('Y-m-d H:i:s', $item['createtime']);
            $item['updatetime_text'] = $item['updatetime'] ? date('Y-m-d H:i:s', $item['updatetime']) : '';
        }

        $this->success(__('获取成功'), [
            'list' => $list,
            'total' => $total,
            'page' => $page,
            'limit' => $limit
        ]);
    }

    /**
     * 建议详情
     * @ApiTitle (建议详情)
     * @ApiSummary (获取建议的详细信息)
     * @ApiMethod (GET)
     * @ApiRoute (/miniapp/suggestion/detail)
     * @ApiHeaders (name=token, type=string, required=true, description="用户Token")
     * @ApiParams (name=id, type=int, required=true, description="建议ID")
     * @ApiReturn ({"code":1,"msg":"获取成功","time":1760614000,"data":{"id":1,"title":"","content":"","label":"","status":"","createtime":1760614000}})
     */
    public function detail()
    {
        $id = $this->request->get('id', 0);

        if (empty($id) || !is_numeric($id)) {
            $this->error(__('参数错误'));
        }

        $suggestion = Db::name('cms_diyform_suggestion')
            ->where('id', $id)
            ->where('user_id', $this->auth->id) // 只能查看自己的建议
            ->find();

        if (!$suggestion) {
            $this->error(__('建议不存在或无权限查看'));
        }

        $suggestion['createtime_text'] = date('Y-m-d H:i:s', $suggestion['createtime']);
        $suggestion['updatetime_text'] = $suggestion['updatetime'] ? date('Y-m-d H:i:s', $suggestion['updatetime']) : '';

        $this->success(__('获取成功'), $suggestion);
    }

    /**
     * 删除建议
     * @ApiTitle (删除建议)
     * @ApiSummary (删除用户自己提交的建议)
     * @ApiMethod (POST)
     * @ApiRoute (/miniapp/suggestion/delete)
     * @ApiHeaders (name=token, type=string, required=true, description="用户Token")
     * @ApiParams (name=id, type=int, required=true, description="建议ID")
     * @ApiReturn ({"code":1,"msg":"删除成功","time":1760614000,"data":null})
     */
    public function delete()
    {
        $id = $this->request->post('id', 0);

        if (empty($id) || !is_numeric($id)) {
            $this->error(__('参数错误'));
        }

        // 检查建议是否存在且属于当前用户
        $suggestion = Db::name('cms_diyform_suggestion')
            ->where('id', $id)
            ->where('user_id', $this->auth->id)
            ->find();

        if (!$suggestion) {
            $this->error(__('建议不存在或无权限删除'));
        }

        // 检查状态是否允许删除（只有hidden和rejected状态可以删除）
        if (!in_array($suggestion['status'], ['hidden', 'rejected'])) {
            $this->error(__('该建议状态不允许删除'));
        }

        try {
            Db::startTrans();
            
            // 软删除：将状态改为hidden
            Db::name('cms_diyform_suggestion')
                ->where('id', $id)
                ->update([
                    'status' => 'hidden',
                    'updatetime' => time()
                ]);
            
            Db::commit();

            $this->success(__('删除成功'));

        } catch (Exception $e) {
            Db::rollback();
            $this->error(__('删除失败：') . $e->getMessage());
        }
    }
}
