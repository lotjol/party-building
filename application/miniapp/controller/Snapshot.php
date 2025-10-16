<?php

namespace app\miniapp\controller;

use think\Db;
use think\Validate;

/**
 * 随手拍控制器（打卡拍照功能）
 */
class Snapshot extends Base
{
    protected $noNeedLogin = [];
    protected $noNeedRight = '*';

    /**
     * 添加随手拍
     *
     * @ApiMethod (POST)
     * @ApiParams (name="content", type="string", required=true, description="内容描述")
     * @ApiParams (name="images", type="string", required=true, description="图片地址，多张用逗号分隔")
     * @ApiParams (name="locate", type="string", required=true, description="位置信息")
     * @ApiParams (name="memo", type="string", required=false, description="备注")
     */
    public function add()
    {
        $content = $this->request->post('content');
        $images = $this->request->post('images');
        $locate = $this->request->post('locate');
        $memo = $this->request->post('memo', '');

        // 验证必填参数
        if (!$content || !$images || !$locate) {
            $this->error(__('参数不能为空：content、images、locate为必填项'));
        }

        // 验证内容长度
        if (mb_strlen($content) < 5 || mb_strlen($content) > 500) {
            $this->error(__('内容长度必须在5-500个字符之间'));
        }

        // 验证位置信息长度
        if (mb_strlen($locate) > 255) {
            $this->error(__('位置信息过长'));
        }

        // 验证图片格式（检查是否为URL或路径）
        $imageList = explode(',', $images);
        if (count($imageList) > 9) {
            $this->error(__('图片数量不能超过9张'));
        }

        foreach ($imageList as $image) {
            $image = trim($image);
            if (empty($image)) {
                $this->error(__('图片路径不能为空'));
            }
        }

        Db::startTrans();
        try {
            // 插入数据
            $data = [
                'user_id' => $this->auth->id,
                'content' => $content,
                'images' => $images,
                'locate' => $locate,
                'memo' => $memo,
                'status' => 'normal', // 默认正常
                'createtime' => time(),
                'updatetime' => time()
            ];

            $snapshotId = Db::name('cms_diyform_casual_snapshot')->insertGetId($data);

            Db::commit();

            $response = [
                'code' => 1,
                'msg' => __('提交成功'),
                'time' => time(),
                'data' => [
                    'id' => $snapshotId,
                    'status' => 'normal'
                ],
            ];
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode($response);
            exit;

        } catch (\Exception $e) {
            Db::rollback();
            $response = [
                'code' => 0,
                'msg' => __('提交失败') . '：' . $e->getMessage(),
                'time' => time(),
                'data' => null,
            ];
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode($response);
            exit;
        }
    }

    /**
     * 获取我的随手拍列表
     *
     * @ApiMethod (GET)
     * @ApiParams (name="page", type="int", required=false, description="页码，默认1")
     * @ApiParams (name="limit", type="int", required=false, description="每页数量，默认10")
     * @ApiParams (name="status", type="string", required=false, description="状态筛选：normal正常,hidden待审核,rejected已拒绝")
     */
    public function list()
    {
        $page = $this->request->get('page', 1);
        $limit = $this->request->get('limit', 10);
        $status = $this->request->get('status');

        // 参数验证
        $page = max(1, intval($page));
        $limit = min(50, max(1, intval($limit))); // 限制最大50条

        try {
            // 构建查询条件
            $where = ['user_id' => $this->auth->id];
            if ($status && in_array($status, ['normal', 'hidden', 'rejected'])) {
                $where['status'] = $status;
            }

            // 查询数据
            $snapshots = Db::name('cms_diyform_casual_snapshot')
                ->where($where)
                ->order('createtime desc, id desc')
                ->page($page, $limit)
                ->select();

            // 获取总数
            $total = Db::name('cms_diyform_casual_snapshot')
                ->where($where)
                ->count();

            $result = [];
            foreach ($snapshots as $snapshot) {
                // 处理图片列表
                $imageList = [];
                if ($snapshot['images']) {
                    $images = explode(',', $snapshot['images']);
                    foreach ($images as $image) {
                        $image = trim($image);
                        if ($image) {
                            // 如果不是完整URL，添加CDN前缀
                            if (strpos($image, 'http://') !== 0 && strpos($image, 'https://') !== 0) {
                                $imageList[] = cdnurl($image, true);
                            } else {
                                $imageList[] = $image;
                            }
                        }
                    }
                }

                $result[] = [
                    'id' => $snapshot['id'],
                    'content' => $snapshot['content'],
                    'images' => $imageList,
                    'locate' => $snapshot['locate'],
                    'memo' => $snapshot['memo'] ?: '',
                    'status' => $snapshot['status'],
                    'status_text' => $this->getStatusText($snapshot['status']),
                    'createtime' => date('Y-m-d H:i:s', $snapshot['createtime']),
                    'updatetime' => date('Y-m-d H:i:s', $snapshot['updatetime'])
                ];
            }

            $response = [
                'code' => 1,
                'msg' => __('获取成功'),
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
                'msg' => __('获取失败') . '：' . $e->getMessage(),
                'time' => time(),
                'data' => null,
            ];
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode($response);
            exit;
        }
    }

    /**
     * 获取随手拍详情
     *
     * @ApiMethod (GET)
     * @ApiParams (name="id", type="int", required=true, description="随手拍ID")
     */
    public function detail()
    {
        $id = $this->request->get('id');

        if (!$id) {
            $response = [
                'code' => 0,
                'msg' => __('参数错误'),
                'time' => time(),
                'data' => null,
            ];
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode($response);
            exit;
        }

        try {
            // 查询详情（只能查看自己的）
            $snapshot = Db::name('cms_diyform_casual_snapshot')
                ->where('id', $id)
                ->where('user_id', $this->auth->id)
                ->find();

            if (!$snapshot) {
                throw new \Exception(__('随手拍不存在或无权访问'));
            }

            // 处理图片列表
            $imageList = [];
            if ($snapshot['images']) {
                $images = explode(',', $snapshot['images']);
                foreach ($images as $image) {
                    $image = trim($image);
                    if ($image) {
                        // 如果不是完整URL，添加CDN前缀
                        if (strpos($image, 'http://') !== 0 && strpos($image, 'https://') !== 0) {
                            $imageList[] = cdnurl($image, true);
                        } else {
                            $imageList[] = $image;
                        }
                    }
                }
            }

            $result = [
                'id' => $snapshot['id'],
                'content' => $snapshot['content'],
                'images' => $imageList,
                'locate' => $snapshot['locate'],
                'memo' => $snapshot['memo'] ?: '',
                'status' => $snapshot['status'],
                'status_text' => $this->getStatusText($snapshot['status']),
                'createtime' => date('Y-m-d H:i:s', $snapshot['createtime']),
                'updatetime' => date('Y-m-d H:i:s', $snapshot['updatetime'])
            ];

            $response = [
                'code' => 1,
                'msg' => __('获取成功'),
                'time' => time(),
                'data' => $result,
            ];
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode($response);
            exit;

        } catch (\Exception $e) {
            $response = [
                'code' => 0,
                'msg' => __('获取失败') . '：' . $e->getMessage(),
                'time' => time(),
                'data' => null,
            ];
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode($response);
            exit;
        }
    }

    /**
     * 删除随手拍
     *
     * @ApiMethod (POST)
     * @ApiParams (name="id", type="int", required=true, description="随手拍ID")
     */
    public function delete()
    {
        $id = $this->request->post('id');

        if (!$id) {
            $response = [
                'code' => 0,
                'msg' => __('参数错误'),
                'time' => time(),
                'data' => null,
            ];
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode($response);
            exit;
        }

        try {
            // 检查是否存在且属于当前用户
            $snapshot = Db::name('cms_diyform_casual_snapshot')
                ->where('id', $id)
                ->where('user_id', $this->auth->id)
                ->find();

            if (!$snapshot) {
                throw new \Exception(__('随手拍不存在或无权删除'));
            }

            // 删除记录
            Db::name('cms_diyform_casual_snapshot')
                ->where('id', $id)
                ->delete();

            $response = [
                'code' => 1,
                'msg' => __('删除成功'),
                'time' => time(),
                'data' => [
                    'id' => $id
                ],
            ];
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode($response);
            exit;

        } catch (\Exception $e) {
            $response = [
                'code' => 0,
                'msg' => __('删除失败') . '：' . $e->getMessage(),
                'time' => time(),
                'data' => null,
            ];
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode($response);
            exit;
        }
    }

    /**
     * 更新随手拍
     *
     * @ApiMethod (POST)
     * @ApiParams (name="id", type="int", required=true, description="随手拍ID")
     * @ApiParams (name="content", type="string", required=false, description="内容描述")
     * @ApiParams (name="images", type="string", required=false, description="图片地址，多张用逗号分隔")
     * @ApiParams (name="locate", type="string", required=false, description="位置信息")
     * @ApiParams (name="memo", type="string", required=false, description="备注")
     */
    public function update()
    {
        $id = $this->request->post('id');
        $content = $this->request->post('content');
        $images = $this->request->post('images');
        $locate = $this->request->post('locate');
        $memo = $this->request->post('memo');

        if (!$id) {
            $response = [
                'code' => 0,
                'msg' => __('参数错误'),
                'time' => time(),
                'data' => null,
            ];
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode($response);
            exit;
        }

        try {
            // 检查是否存在且属于当前用户
            $snapshot = Db::name('cms_diyform_casual_snapshot')
                ->where('id', $id)
                ->where('user_id', $this->auth->id)
                ->find();

            if (!$snapshot) {
                throw new \Exception(__('随手拍不存在或无权修改'));
            }

            // 只能修改待审核或已拒绝的记录
            if ($snapshot['status'] == 'normal') {
                throw new \Exception(__('已审核通过的记录不能修改'));
            }

            // 构建更新数据
            $updateData = ['updatetime' => time()];

            if ($content !== null) {
                if (mb_strlen($content) < 5 || mb_strlen($content) > 500) {
                    throw new \Exception(__('内容长度必须在5-500个字符之间'));
                }
                $updateData['content'] = $content;
            }

            if ($images !== null) {
                $imageList = explode(',', $images);
                if (count($imageList) > 9) {
                    throw new \Exception(__('图片数量不能超过9张'));
                }
                $updateData['images'] = $images;
            }

            if ($locate !== null) {
                if (mb_strlen($locate) > 255) {
                    throw new \Exception(__('位置信息过长'));
                }
                $updateData['locate'] = $locate;
            }

            if ($memo !== null) {
                $updateData['memo'] = $memo;
            }

            // 如果修改了内容，重新设置为待审核
            if ($content !== null || $images !== null) {
                $updateData['status'] = 'hidden';
            }

            // 更新数据
            Db::name('cms_diyform_casual_snapshot')
                ->where('id', $id)
                ->update($updateData);

            $response = [
                'code' => 1,
                'msg' => __('更新成功'),
                'time' => time(),
                'data' => [
                    'id' => $id
                ],
            ];
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode($response);
            exit;

        } catch (\Exception $e) {
            $response = [
                'code' => 0,
                'msg' => __('更新失败') . '：' . $e->getMessage(),
                'time' => time(),
                'data' => null,
            ];
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode($response);
            exit;
        }
    }

    /**
     * 获取状态文本
     * @param string $status
     * @return string
     */
    private function getStatusText($status)
    {
        $statusMap = [
            'normal' => '已通过',
            'hidden' => '待审核',
            'rejected' => '已拒绝'
        ];
        return $statusMap[$status] ?? '未知';
    }
}

