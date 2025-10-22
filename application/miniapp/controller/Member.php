<?php

namespace app\miniapp\controller;

use addons\cms\model\Archives as CmsArchives;
use addons\cms\model\Channel as CmsChannel;

/**
 * 党员先锋控制器
 */
class Member extends Base
{
    protected $noNeedLogin = ['list', 'detail'];
    protected $noNeedRight = ['*'];

    /**
     * 获取党员先锋列表（Member List）
     *
     * @ApiMethod (GET)
     * @ApiParams (name="channel_id", type="int", required=false, description="栏目ID")
     * @ApiParams (name="flag", type="string", required=false, description="标志筛选，多个用逗号分隔")
     * @ApiParams (name="page", type="int", required=false, description="页码，默认1")
     * @ApiParams (name="limit", type="int", required=false, description="每页数量，默认10")
     * @ApiParams (name="order", type="string", required=false, description="排序方式：latest(最新),hot(最热),weigh(权重)")
     */
    public function list()
    {
        $channelId = $this->request->get('channel_id');
        $flag = $this->request->get('flag');
        $page = $this->request->get('page', 1);
        $limit = $this->request->get('limit', 10);
        $order = $this->request->get('order', 'latest');
        
        // 参数验证
        $page = max(1, intval($page));
        $limit = min(50, max(1, intval($limit))); // 限制最大50条
        
        try {
            // 检查CMS插件是否安装
            if (!class_exists('\addons\cms\model\Archives')) {
                throw new \Exception('CMS插件未安装或Archives模型不存在');
            }
            
            // 检查数据库表是否存在
            $tableExists = \think\Db::query("SHOW TABLES LIKE 'party_cms_archives'");
            if (empty($tableExists)) {
                throw new \Exception('数据库表 party_cms_archives 不存在');
            }
            
            // 构建查询条件 - 只查询党员先锋模型(model_id = 4)
            $where = [
                'status' => 'normal',
                'model_id' => 4  // 党员先锋模型ID
            ];
            
            if ($channelId) {
                $where['channel_id'] = intval($channelId);
            }
            
            // 标志筛选
            if ($flag) {
                $flags = array_filter(explode(',', $flag));
                if (!empty($flags)) {
                    $where['flag'] = ['in', $flags];
                }
            }
            
            // 构建排序条件
            $orderBy = $this->buildOrderBy($order);
            
            // 查询党员先锋数据
            $members = CmsArchives::where($where)
                ->order($orderBy)
                ->field('id,channel_id,model_id,title,image,description,views,comments,likes,weigh,createtime,updatetime,publishtime')
                ->page($page, $limit)
                ->select();
            
            // 获取总数
            $total = CmsArchives::where($where)->count();
            
            $result = [];
            foreach ($members as $member) {
                // 获取栏目名称
                $channelName = '';
                if ($member->channel_id) {
                    $channel = CmsChannel::where('id', $member->channel_id)->field('name')->find();
                    $channelName = $channel ? $channel->name : '';
                }
                
                $item = [
                    'id' => $member->id,
                    'channel_id' => $member->channel_id,
                    'channel_name' => $channelName,
                    'title' => $member->title,
                    'image' => $member->image ?: '',
                    'description' => $member->description ?: '',
                    'views' => $member->views,
                    'createtime' => date('Y-m-d H:i:s', $member->createtime),
                    'updatetime' => date('Y-m-d H:i:s', $member->updatetime),
                    'publishtime' => $member->publishtime ? date('Y-m-d H:i:s', $member->publishtime) : ''
                ];
                
                $result[] = $item;
            }
            
            $response = [
                'code' => 1,
                'msg'  => '获取成功',
                'time' => time(),
                'data' => [
                    'list' => $result,
                    'total' => $total,
                    'page' => $page,
                    'limit' => $limit,
                    'pages' => ceil($total / $limit)
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
     * 获取党员先锋详情（Member Detail）
     *
     * @ApiMethod (GET)
     * @ApiParams (name="id", type="int", required=true, description="党员先锋ID")
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
            // 查询党员先锋详情 - 只查询党员先锋模型(model_id = 4)
            $member = CmsArchives::where('id', $id)
                ->where('status', 'normal')
                ->where('model_id', 4)  // 党员先锋模型ID
                ->field('id,channel_id,model_id,title,image,description,views,comments,likes,weigh,createtime,updatetime,publishtime')
                ->find();
            
            if (!$member) {
                throw new \Exception('党员先锋不存在');
            }
            
            // 获取党员先锋内容
            $content = '';
            $memberData = \think\Db::name('cms_addon_member')->where('id', $id)->find();
            if ($memberData) {
                $content = $memberData['content'] ?: '';
            }
            
            // 获取栏目名称
            $channelName = '';
            if ($member->channel_id) {
                $channel = CmsChannel::where('id', $member->channel_id)->field('name')->find();
                $channelName = $channel ? $channel->name : '';
            }
            
            // 增加浏览量
            CmsArchives::where('id', $id)->setInc('views');
            
            $result = [
                'id' => $member->id,
                'channel_id' => $member->channel_id,
                'channel_name' => $channelName,
                'title' => $member->title,
                'image' => $member->image ?: '',
                'description' => $member->description ?: '',
                'content' => $content,
                'views' => $member->views + 1, // 显示增加后的浏览量
                'createtime' => date('Y-m-d H:i:s', $member->createtime),
                'updatetime' => date('Y-m-d H:i:s', $member->updatetime),
                'publishtime' => $member->publishtime ? date('Y-m-d H:i:s', $member->publishtime) : ''
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

    /**
     * 构建排序条件
     * @param string $order
     * @return string
     */
    private function buildOrderBy($order)
    {
        switch ($order) {
            case 'hot':
                return 'views desc, weigh desc, id desc';
            case 'weigh':
                return 'weigh desc, id desc';
            case 'latest':
            default:
                return 'publishtime desc, createtime desc, id desc';
        }
    }
}
