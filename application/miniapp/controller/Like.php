<?php

namespace app\miniapp\controller;

use addons\cms\model\Archives as CmsArchives;
use think\Db;

/**
 * 点赞控制器（Like - 文章点赞功能）
 */
class Like extends Base
{
    protected $noNeedLogin = ['status'];
    protected $noNeedRight = ['*'];

    /**
     * 文章点赞/取消点赞
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
            // 检查文章是否存在 - 只查询通用文章模型(model_id = 1)
            $archives = CmsArchives::where('id', $id)
                ->where('status', 'normal')
                ->where('model_id', 1)  // 通用文章模型ID
                ->find();
            if (!$archives) {
                throw new \Exception(__('文章不存在'));
            }

            // 检查CMS插件是否安装
            if (!class_exists('\addons\cms\model\Archives')) {
                throw new \Exception('CMS插件未安装或Archives模型不存在');
            }

            // 检查数据库表是否存在
            $tableExists = Db::query("SHOW TABLES LIKE 'party_cms_archives'");
            if (empty($tableExists)) {
                throw new \Exception('数据库表 party_cms_archives 不存在');
            }

            Db::startTrans();
            try {
                // 查询用户是否已经点赞过该文章
                $existingLike = Db::name('cms_user_like')
                    ->where([
                        'user_id' => $this->auth->id,
                        'type' => 'archives',
                        'aid' => $id
                    ])
                    ->find();

                if ($existingLike) {
                    // 用户已经点赞过，取消点赞
                    Db::name('cms_user_like')->where('id', $existingLike['id'])->delete();
                    
                    // 减少文章点赞数
                    CmsArchives::where('id', $id)->setDec('likes', 1);
                    
                    $message = __('取消点赞成功');
                    $isLiked = false;
                } else {
                    // 用户未点赞过，新增点赞记录
                    Db::name('cms_user_like')->insert([
                        'user_id' => $this->auth->id,
                        'type' => 'archives',
                        'aid' => $id,
                        'createtime' => time(),
                        'updatetime' => time()
                    ]);
                    
                    // 增加文章点赞数
                    CmsArchives::where('id', $id)->setInc('likes', 1);
                    
                    $message = __('点赞成功');
                    $isLiked = true;
                }

                Db::commit();

                // 重新获取文章信息
                $updatedArchives = CmsArchives::get($id);

                $response = [
                    'code' => 1,
                    'msg'  => $message,
                    'time' => time(),
                    'data' => [
                        'id' => $updatedArchives->id,
                        'likes' => $updatedArchives->likes,
                        'is_liked' => $isLiked
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
     * 获取文章点赞状态（包含用户个人状态）
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
            // 检查文章是否存在 - 只查询通用文章模型(model_id = 1)
            $archives = CmsArchives::where('id', $id)
                ->where('status', 'normal')
                ->where('model_id', 1)  // 通用文章模型ID
                ->find();
            if (!$archives) {
                throw new \Exception(__('文章不存在'));
            }

            // 检查用户是否已登录
            $isLiked = false;
            $isLoggedIn = $this->auth->isLogin();
            
            if ($isLoggedIn) {
                // 查询用户对该文章的点赞状态
                $userLike = Db::name('cms_user_like')
                    ->where([
                        'user_id' => $this->auth->id,
                        'type' => 'archives',
                        'aid' => $id
                    ])
                    ->find();
                
                $isLiked = $userLike ? true : false;
            }

            $response = [
                'code' => 1,
                'msg'  => __('获取成功'),
                'time' => time(),
                'data' => [
                    'id' => $archives->id,
                    'title' => $archives->title,
                    'likes' => $archives->likes,
                    'is_liked' => $isLiked, // true=已点赞, false=未点赞
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
