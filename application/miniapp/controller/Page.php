<?php

namespace app\miniapp\controller;

use addons\cms\model\Page as CmsPage;

/**
 * 小程序单页接口
 */
class Page extends Base
{
    protected $noNeedLogin = ['*'];
    protected $noNeedRight = ['*'];

    /**
     * 获取所有单页列表
     *
     * @ApiMethod (GET)
     * @ApiParams (name="type", type="string", required=false, description="单页类型")
     * @ApiParams (name="page", type="int", required=false, description="页码，默认1")
     * @ApiParams (name="limit", type="int", required=false, description="每页数量，默认10")
     */
    public function list()
    {
        $type = $this->request->get('type');
        $page = $this->request->get('page', 1);
        $limit = $this->request->get('limit', 10);
        
        // 参数验证
        $page = max(1, intval($page));
        $limit = min(50, max(1, intval($limit))); // 限制最大50条
        
        try {
            // 检查CMS插件是否安装
            if (!class_exists('\addons\cms\model\Page')) {
                throw new \Exception('CMS插件未安装或Page模型不存在');
            }
            
            // 检查数据库表是否存在
            $tableExists = \think\Db::query("SHOW TABLES LIKE 'party_cms_page'");
            if (empty($tableExists)) {
                throw new \Exception('数据库表 party_cms_page 不存在');
            }
            
            // 构建查询条件
            $where = ['status' => 'normal'];
            if ($type) {
                $where['type'] = $type;
            }
            
            // 查询数据
            $pages = CmsPage::where($where)
                ->order('weigh desc, id desc')
                ->field('id,type,title,description,image,views,createtime,updatetime')
                ->page($page, $limit)
                ->select();
            
            // 获取总数
            $total = CmsPage::where($where)->count();
            
            $result = [];
            foreach ($pages as $pageItem) {
                $result[] = [
                    'id' => $pageItem->id,
                    'type' => $pageItem->type,
                    'title' => $pageItem->title,
                    'description' => $pageItem->description ?: '',
                    'image' => $pageItem->image ?: '',
                    'views' => $pageItem->views,
                    'createtime' => date('Y-m-d H:i:s', $pageItem->createtime),
                    'updatetime' => date('Y-m-d H:i:s', $pageItem->updatetime)
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
     * 获取单页详情
     *
     * @ApiMethod (GET)
     * @ApiParams (name="id", type="int", required=true, description="单页ID")
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
            // 查询单页详情
            $page = CmsPage::where('id', $id)
                ->where('status', 'normal')
                ->find();
            
            if (!$page) {
                $response = [
                    'code' => 0,
                    'msg'  => '单页不存在',
                    'time' => time(),
                    'data' => null,
                ];
                echo json_encode($response);
                exit;
            }
            
            // 增加浏览量
            $page->setInc('views');
            
            $result = [
                'id' => $page->id,
                'type' => $page->type,
                'title' => $page->title,
                'description' => $page->description ?: '',
                'content' => $page->content ?: '',
                'image' => $page->image ?: '',
                'views' => $page->views + 1, // 显示更新后的浏览量
                'createtime' => date('Y-m-d H:i:s', $page->createtime),
                'updatetime' => date('Y-m-d H:i:s', $page->updatetime)
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
     * 获取所有单页类型
     *
     * @ApiMethod (GET)
     */
    public function types()
    {
        try {
            // 获取所有已发布的单页类型
            $types = CmsPage::where('status', 'normal')
                ->distinct(true)
                ->column('type');
            
            $result = [];
            foreach ($types as $type) {
                if ($type) { // 过滤空类型
                    $result[] = [
                        'type' => $type,
                        'name' => $type // 可以根据需要添加类型名称映射
                    ];
                }
            }
            
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