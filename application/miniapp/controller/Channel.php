<?php

namespace app\miniapp\controller;

use addons\cms\model\Channel as CmsChannel;

/**
 * 栏目控制器
 */
class Channel extends Base
{
    protected $noNeedLogin = ['list', 'detail'];
    protected $noNeedRight = ['*'];
    /**
     * 获取栏目列表（Channel List）
     *
     * @ApiMethod (GET)
     * @ApiParams (name="parent_id", type="int", required=false, description="父栏目ID，0表示顶级栏目")
     * @ApiParams (name="type", type="string", required=false, description="栏目类型：channel(频道封面),list(列表栏目),link(跳转链接)")
     */
    public function list()
    {
        $parentId = $this->request->get('parent_id', 0);
        $type = $this->request->get('type');
        
        try {
            // 检查CMS插件是否安装
            if (!class_exists('\addons\cms\model\Channel')) {
                throw new \Exception('CMS插件未安装或Channel模型不存在');
            }
            
            // 检查数据库表是否存在
            $tableExists = \think\Db::query("SHOW TABLES LIKE 'party_cms_channel'");
            if (empty($tableExists)) {
                throw new \Exception('数据库表 party_cms_channel 不存在');
            }
            
            // 构建查询条件
            $where = ['status' => 'normal'];
            if ($parentId !== '') {
                $where['parent_id'] = intval($parentId);
            }
            if ($type) {
                $where['type'] = $type;
            }
            
            // 查询栏目数据
            $channels = CmsChannel::where($where)
                ->order('weigh desc, id asc')
                ->field('id,type,parent_id,name,image,description,items,weigh,createtime,updatetime')
                ->select();
            
            $result = [];
            foreach ($channels as $channel) {
                $result[] = [
                    'id' => $channel->id,
                    'type' => $channel->type,
                    'parent_id' => $channel->parent_id,
                    'name' => $channel->name,
                    'image' => $channel->image ?: '',
                    'description' => $channel->description ?: '',
                    'items' => $channel->items,
                    'weigh' => $channel->weigh,
                    'createtime' => date('Y-m-d H:i:s', $channel->createtime),
                    'updatetime' => date('Y-m-d H:i:s', $channel->updatetime)
                ];
            }
            
            $response = [
                'code' => 1,
                'msg'  => '获取成功',
                'time' => time(),
                'data' => [
                    'list' => $result,
                    'total' => count($result)
                ],
            ];
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode($response);
            exit;
            
        } catch (\Exception $e) {
            $response = [
                'code' => 0,
                'msg'  => '获取失败：' . $e->getMessage(),
                'time' => time(),
                'data' => null,
            ];
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode($response);
            exit;
        }
    }

    /**
     * 获取栏目详情（Channel Detail）
     *
     * @ApiMethod (GET)
     * @ApiParams (name="id", type="int", required=true, description="栏目ID（Channel ID）")
     */
    public function detail()
    {
        $id = $this->request->get('id');
        
        if (!$id) {
            $response = [
                'code' => 0,
                'msg'  => '参数错误',
                'time' => time(),
                'data' => null,
            ];
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode($response);
            exit;
        }
        
        try {
            // 查询栏目详情
            $channel = CmsChannel::where('id', $id)
                ->where('status', 'normal')
                ->field('id,type,parent_id,name,image,description,items,weigh,createtime,updatetime')
                ->find();
            
            if (!$channel) {
                throw new \Exception('栏目不存在');
            }
            
            $result = [
                'id' => $channel->id,
                'type' => $channel->type,
                'parent_id' => $channel->parent_id,
                'name' => $channel->name,
                'image' => $channel->image ?: '',
                'description' => $channel->description ?: '',
                'items' => $channel->items,
                'weigh' => $channel->weigh,
                'createtime' => date('Y-m-d H:i:s', $channel->createtime),
                'updatetime' => date('Y-m-d H:i:s', $channel->updatetime)
            ];
            
            $response = [
                'code' => 1,
                'msg'  => '获取成功',
                'time' => time(),
                'data' => $result,
            ];
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode($response);
            exit;
            
        } catch (\Exception $e) {
            $response = [
                'code' => 0,
                'msg'  => '获取失败：' . $e->getMessage(),
                'time' => time(),
                'data' => null,
            ];
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode($response);
            exit;
        }
    }
}
