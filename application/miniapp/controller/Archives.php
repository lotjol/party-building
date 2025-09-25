<?php

namespace app\miniapp\controller;

use addons\cms\model\Archives as CmsArchives;
use addons\cms\model\Channel as CmsChannel;

/**
 * 文章控制器（Archives - CMS标准术语）
 */
class Archives extends Base
{
    protected $noNeedLogin = ['list', 'detail', 'hot', 'search'];
    protected $noNeedRight = ['*'];
    /**
     * 获取文章列表（Archives List）
     *
     * @ApiMethod (GET)
     * @ApiParams (name="channel_id", type="int", required=false, description="栏目ID（channel/list/link类型）")
     * @ApiParams (name="page", type="int", required=false, description="页码，默认1")
     * @ApiParams (name="limit", type="int", required=false, description="每页数量，默认10")
     * @ApiParams (name="order", type="string", required=false, description="排序方式：latest(最新),hot(最热),weigh(权重)")
     */
    public function list()
    {
        $channelId = $this->request->get('channel_id');
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
            
            // 构建查询条件
            $where = ['status' => 'normal'];
            if ($channelId) {
                $where['channel_id'] = intval($channelId);
            }
            
            // 构建排序条件
            $orderBy = $this->buildOrderBy($order);
            
            // 查询文章数据
            $articles = CmsArchives::where($where)
                ->order($orderBy)
                ->field('id,channel_id,title,image,description,views,comments,likes,weigh,createtime,updatetime,publishtime')
                ->page($page, $limit)
                ->select();
            
            // 获取总数
            $total = CmsArchives::where($where)->count();
            
            $result = [];
            foreach ($articles as $article) {
                // 获取栏目名称
                $channelName = '';
                if ($article->channel_id) {
                    $channel = CmsChannel::where('id', $article->channel_id)->field('name')->find();
                    $channelName = $channel ? $channel->name : '';
                }
                
                $result[] = [
                    'id' => $article->id,
                    'channel_id' => $article->channel_id,
                    'channel_name' => $channelName,
                    'title' => $article->title,
                    'image' => $article->image ?: '',
                    'description' => $article->description ?: '',
                    'views' => $article->views,
                    'comments' => $article->comments,
                    'likes' => $article->likes,
                    'weigh' => $article->weigh,
                    'createtime' => date('Y-m-d H:i:s', $article->createtime),
                    'updatetime' => date('Y-m-d H:i:s', $article->updatetime),
                    'publishtime' => $article->publishtime ? date('Y-m-d H:i:s', $article->publishtime) : ''
                ];
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
     * 获取文章详情（Archives Detail）
     *
     * @ApiMethod (GET)
     * @ApiParams (name="id", type="int", required=true, description="文章ID（Archives ID）")
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
            // 查询文章详情
            $article = CmsArchives::where('id', $id)
                ->where('status', 'normal')
                ->field('id,channel_id,title,image,description,views,comments,likes,weigh,createtime,updatetime,publishtime')
                ->find();
            
            if (!$article) {
                throw new \Exception('文章不存在');
            }
            
            // 获取文章内容
            $content = '';
            $addonArticle = \think\Db::name('cms_addon_article')->where('id', $id)->find();
            if ($addonArticle) {
                $content = $addonArticle['content'] ?: '';
            }
            
            // 获取栏目名称
            $channelName = '';
            if ($article->channel_id) {
                $channel = CmsChannel::where('id', $article->channel_id)->field('name')->find();
                $channelName = $channel ? $channel->name : '';
            }
            
            // 增加浏览量
            CmsArchives::where('id', $id)->setInc('views');
            
            $result = [
                'id' => $article->id,
                'channel_id' => $article->channel_id,
                'channel_name' => $channelName,
                'title' => $article->title,
                'image' => $article->image ?: '',
                'description' => $article->description ?: '',
                'content' => $content,
                'views' => $article->views + 1, // 显示增加后的浏览量
                'comments' => $article->comments,
                'likes' => $article->likes,
                'weigh' => $article->weigh,
                'createtime' => date('Y-m-d H:i:s', $article->createtime),
                'updatetime' => date('Y-m-d H:i:s', $article->updatetime),
                'publishtime' => $article->publishtime ? date('Y-m-d H:i:s', $article->publishtime) : ''
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
     * 获取热门文章（Hot Archives）
     *
     * @ApiMethod (GET)
     * @ApiParams (name="limit", type="int", required=false, description="数量，默认10")
     * @ApiParams (name="channel_id", type="int", required=false, description="栏目ID（channel/list/link类型）")
     */
    public function hot()
    {
        $limit = $this->request->get('limit', 10);
        $channelId = $this->request->get('channel_id');
        
        // 参数验证
        $limit = min(50, max(1, intval($limit))); // 限制最大50条
        
        try {
            // 构建查询条件
            $where = ['status' => 'normal'];
            if ($channelId) {
                $where['channel_id'] = intval($channelId);
            }
            
            // 查询热门文章（按浏览量排序）
            $articles = CmsArchives::where($where)
                ->order('views desc, weigh desc, id desc')
                ->field('id,channel_id,title,image,description,views,comments,likes,weigh,createtime,updatetime,publishtime')
                ->limit($limit)
                ->select();
            
            $result = [];
            foreach ($articles as $article) {
                // 获取栏目名称
                $channelName = '';
                if ($article->channel_id) {
                    $channel = CmsChannel::where('id', $article->channel_id)->field('name')->find();
                    $channelName = $channel ? $channel->name : '';
                }
                
                $result[] = [
                    'id' => $article->id,
                    'channel_id' => $article->channel_id,
                    'channel_name' => $channelName,
                    'title' => $article->title,
                    'image' => $article->image ?: '',
                    'description' => $article->description ?: '',
                    'views' => $article->views,
                    'comments' => $article->comments,
                    'likes' => $article->likes,
                    'weigh' => $article->weigh,
                    'createtime' => date('Y-m-d H:i:s', $article->createtime),
                    'updatetime' => date('Y-m-d H:i:s', $article->updatetime),
                    'publishtime' => $article->publishtime ? date('Y-m-d H:i:s', $article->publishtime) : ''
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
     * 搜索文章（Search Archives）
     *
     * @ApiMethod (GET)
     * @ApiParams (name="keyword", type="string", required=true, description="搜索关键词")
     * @ApiParams (name="page", type="int", required=false, description="页码，默认1")
     * @ApiParams (name="limit", type="int", required=false, description="每页数量，默认10")
     * @ApiParams (name="channel_id", type="int", required=false, description="栏目ID（channel/list/link类型）")
     */
    public function search()
    {
        $keyword = $this->request->get('keyword');
        $page = $this->request->get('page', 1);
        $limit = $this->request->get('limit', 10);
        $channelId = $this->request->get('channel_id');
        
        if (!$keyword) {
            $response = [
                'code' => 0,
                'msg'  => '搜索关键词不能为空',
                'time' => time(),
                'data' => null,
            ];
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode($response);
            exit;
        }
        
        // 参数验证
        $page = max(1, intval($page));
        $limit = min(50, max(1, intval($limit))); // 限制最大50条
        
        try {
            // 构建查询条件
            $query = CmsArchives::where('status', 'normal')
                ->where('title', 'like', '%' . $keyword . '%');
            
            if ($channelId) {
                $query->where('channel_id', intval($channelId));
            }
            
            // 查询文章数据
            $articles = $query->order('weigh desc, id desc')
                ->field('id,channel_id,title,image,description,views,comments,likes,weigh,createtime,updatetime,publishtime')
                ->page($page, $limit)
                ->select();
            
            // 获取总数
            $total = CmsArchives::where('status', 'normal')
                ->where('title', 'like', '%' . $keyword . '%');
            if ($channelId) {
                $total->where('channel_id', intval($channelId));
            }
            $total = $total->count();
            
            $result = [];
            foreach ($articles as $article) {
                // 获取栏目名称
                $channelName = '';
                if ($article->channel_id) {
                    $channel = CmsChannel::where('id', $article->channel_id)->field('name')->find();
                    $channelName = $channel ? $channel->name : '';
                }
                
                $result[] = [
                    'id' => $article->id,
                    'channel_id' => $article->channel_id,
                    'channel_name' => $channelName,
                    'title' => $article->title,
                    'image' => $article->image ?: '',
                    'description' => $article->description ?: '',
                    'views' => $article->views,
                    'comments' => $article->comments,
                    'likes' => $article->likes,
                    'weigh' => $article->weigh,
                    'createtime' => date('Y-m-d H:i:s', $article->createtime),
                    'updatetime' => date('Y-m-d H:i:s', $article->updatetime),
                    'publishtime' => $article->publishtime ? date('Y-m-d H:i:s', $article->publishtime) : ''
                ];
            }
            
            $response = [
                'code' => 1,
                'msg'  => '搜索成功',
                'time' => time(),
                'data' => [
                    'list' => $result,
                    'total' => $total,
                    'page' => $page,
                    'limit' => $limit,
                    'pages' => ceil($total / $limit),
                    'keyword' => $keyword
                ],
            ];
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode($response);
            exit;
            
        } catch (\Exception $e) {
            $response = [
                'code' => 0,
                'msg'  => '搜索失败：' . $e->getMessage(),
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
