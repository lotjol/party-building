<?php

namespace app\miniapp\controller;

use addons\cms\model\Archives as CmsArchives;
use addons\cms\model\Collection as CmsCollection;
use think\Db;

/**
 * 收藏控制器（Collection - 文章收藏功能）
 */
class Collection extends Base
{
    protected $noNeedLogin = ['status'];
    protected $noNeedRight = ['*'];

    /**
     * 文章收藏/取消收藏
     *
     * @ApiMethod (POST)
     * @ApiParams (name="id", type="int", required=true, description="文章ID")
     */
    public function archives()
    {
        $id = $this->request->post('id');

        // 验证必填参数
        if (!$id) {
            $response = [
                'code' => 0,
                'msg'  => __('参数不能为空'),
                'time' => time(),
                'data' => null,
            ];
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode($response);
            exit;
        }

        try {
            // 检查文章是否存在
            $archives = CmsArchives::where('id', $id)->where('status', 'normal')->find();
            if (!$archives) {
                throw new \Exception(__('文章不存在'));
            }

            // 检查CMS插件是否安装
            if (!class_exists('\addons\cms\model\Collection')) {
                throw new \Exception('CMS插件未安装或Collection模型不存在');
            }

            // 检查数据库表是否存在
            $tableExists = Db::query("SHOW TABLES LIKE 'party_cms_collection'");
            if (empty($tableExists)) {
                throw new \Exception('数据库表 party_cms_collection 不存在');
            }

            Db::startTrans();
            try {
                // 查询用户是否已经收藏过该文章
                $existingCollection = CmsCollection::where([
                    'type' => 'archives',
                    'aid' => $id,
                    'user_id' => $this->auth->id
                ])->find();

                if ($existingCollection) {
                    // 用户已经收藏过，取消收藏
                    $existingCollection->delete();
                    
                    $message = __('取消收藏成功');
                    $isCollected = false;
                } else {
                    // 用户未收藏过，新增收藏记录
                    $data = [
                        'user_id' => $this->auth->id,
                        'type' => 'archives',
                        'aid' => $id,
                        'title' => $archives->title,
                        'url' => $archives->fullurl ?? '',
                        'image' => $archives->image ?: '',
                        'createtime' => time()
                    ];

                    CmsCollection::create($data);
                    
                    $message = __('收藏成功');
                    $isCollected = true;
                }

                Db::commit();

                $response = [
                    'code' => 1,
                    'msg'  => $message,
                    'time' => time(),
                    'data' => [
                        'id' => $id,
                        'is_collected' => $isCollected
                    ],
                ];
                header('Content-Type: application/json; charset=utf-8');
                echo json_encode($response);
                exit;

            } catch (\Exception $e) {
                Db::rollback();
                throw $e;
            }

        } catch (\Exception $e) {
            $response = [
                'code' => 0,
                'msg'  => __('操作失败') . '：' . $e->getMessage(),
                'time' => time(),
                'data' => null,
            ];
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode($response);
            exit;
        }
    }

    /**
     * 获取用户收藏列表
     *
     * @ApiMethod (GET)
     * @ApiParams (name="page", type="int", required=false, description="页码，默认1")
     * @ApiParams (name="limit", type="int", required=false, description="每页数量，默认10")
     * @ApiParams (name="type", type="string", required=false, description="类型：archives/page/special，默认archives")
     */
    public function list()
    {
        $page = $this->request->get('page', 1);
        $limit = $this->request->get('limit', 10);
        $type = $this->request->get('type', 'archives');

        // 参数验证
        $page = max(1, intval($page));
        $limit = min(50, max(1, intval($limit))); // 限制最大50条

        // 验证类型
        if (!in_array($type, ['archives', 'page', 'special', 'diyform'])) {
            $response = [
                'code' => 0,
                'msg'  => __('类型参数错误'),
                'time' => time(),
                'data' => null,
            ];
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode($response);
            exit;
        }

        try {
            // 检查CMS插件是否安装
            if (!class_exists('\addons\cms\model\Collection')) {
                throw new \Exception('CMS插件未安装或Collection模型不存在');
            }

            // 检查数据库表是否存在
            $tableExists = Db::query("SHOW TABLES LIKE 'party_cms_collection'");
            if (empty($tableExists)) {
                throw new \Exception('数据库表 party_cms_collection 不存在');
            }

            // 查询收藏数据
            $collections = CmsCollection::where([
                'user_id' => $this->auth->id,
                'type' => $type
            ])
            ->order('createtime desc')
            ->field('id,type,aid,title,image,url,createtime')
            ->page($page, $limit)
            ->select();

            // 获取总数
            $total = CmsCollection::where([
                'user_id' => $this->auth->id,
                'type' => $type
            ])->count();

            $result = [];
            foreach ($collections as $collection) {
                $result[] = [
                    'id' => $collection->id,
                    'type' => $collection->type,
                    'aid' => $collection->aid,
                    'title' => $collection->title,
                    'image' => $collection->image ? cdnurl($collection->image) : '',
                    'createtime' => date('Y-m-d H:i:s', $collection->createtime)
                ];
            }

            $response = [
                'code' => 1,
                'msg'  => __('获取成功'),
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
                'msg'  => __('获取失败') . '：' . $e->getMessage(),
                'time' => time(),
                'data' => null,
            ];
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode($response);
            exit;
        }
    }

    /**
     * 检查文章收藏状态（用户个人状态）
     *
     * @ApiMethod (GET)
     * @ApiParams (name="id", type="int", required=true, description="文章ID")
     */
    public function status()
    {
        $id = $this->request->get('id');

        // 验证必填参数
        if (!$id) {
            $response = [
                'code' => 0,
                'msg'  => __('参数不能为空'),
                'time' => time(),
                'data' => null,
            ];
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode($response);
            exit;
        }

        try {
            // 检查文章是否存在
            $archives = CmsArchives::where('id', $id)->where('status', 'normal')->find();
            if (!$archives) {
                throw new \Exception(__('文章不存在'));
            }

            // 检查用户是否已登录
            $isCollected = false;
            $isLoggedIn = $this->auth->isLogin();
            
            if ($isLoggedIn) {
                // 查询用户对该文章的收藏状态
                $collection = CmsCollection::where([
                    'type' => 'archives',
                    'aid' => $id,
                    'user_id' => $this->auth->id
                ])->find();
                $isCollected = $collection ? true : false;
            }

            $response = [
                'code' => 1,
                'msg'  => __('获取成功'),
                'time' => time(),
                'data' => [
                    'id' => $archives->id,
                    'title' => $archives->title,
                    'is_collected' => $isCollected, // true=已收藏, false=未收藏
                    'is_logged_in' => $isLoggedIn
                ],
            ];
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode($response);
            exit;

        } catch (\Exception $e) {
            $response = [
                'code' => 0,
                'msg'  => __('获取失败') . '：' . $e->getMessage(),
                'time' => time(),
                'data' => null,
            ];
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode($response);
            exit;
        }
    }
}
