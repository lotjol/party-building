<?php

namespace app\miniapp\controller;

use app\miniapp\controller\Base;
use addons\cms\model\Archives as CmsArchives;
use think\Db;
use think\Exception;

/**
 * 活动控制器（Activity - 活动报名功能）
 */
class Activity extends Base
{
    protected $noNeedLogin = [];
    protected $noNeedRight = ['*'];

    /**
     * 报名参加活动
     *
     * @ApiMethod (POST)
     * @ApiRoute (/miniapp/activity/signup)
     * @ApiParams (name="archives_id", type="int", required=true, description="活动ID（文章ID）")
     */
    public function signup()
    {
        $archivesId = $this->request->post('archives_id');

        // 验证必填参数
        if (!$archivesId) {
            $response = [
                'code' => 0,
                'msg' => __('活动ID不能为空'),
                'time' => time(),
                'data' => null,
            ];
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode($response);
            exit;
        }

        try {
            // 检查活动是否存在且为组织活动类型
            $archives = CmsArchives::where('id', $archivesId)
                ->where('status', 'normal')
                ->find();

            if (!$archives) {
                throw new \Exception(__('活动不存在'));
            }

            // 检查是否为组织活动类型 (model_id = 2)
            if ($archives->model_id != 2) {
                throw new \Exception(__('该文章不是组织活动，无法报名'));
            }

            // 检查是否已经报名过
            $existingSignup = Db::name('cms_diyform_activity_signup')
                ->where('user_id', $this->auth->id)
                ->where('archives_id', $archivesId)
                ->find();

            if ($existingSignup) {
                // 如果之前取消过报名（status='hidden'），则恢复状态
                if ($existingSignup['status'] == 'hidden') {
                    Db::name('cms_diyform_activity_signup')
                        ->where('id', $existingSignup['id'])
                        ->update([
                            'status' => 'normal',
                            'updatetime' => time()
                        ]);
                    
                    $response = [
                        'code' => 1,
                        'msg' => __('报名成功'),
                        'time' => time(),
                        'data' => [
                            'id' => $existingSignup['id'],
                            'username' => $existingSignup['username'] ?: $this->auth->username,
                            'is_new' => false,
                            'signup_time' => date('Y-m-d H:i:s', $existingSignup['createtime'])
                        ],
                    ];
                } else {
                    // 已报名（状态为normal）
                    $response = [
                        'code' => 1,
                        'msg' => __('您已报名该活动'),
                        'time' => time(),
                        'data' => [
                            'id' => $existingSignup['id'],
                            'username' => $existingSignup['username'] ?: $this->auth->username,
                            'is_new' => false,
                            'signup_time' => date('Y-m-d H:i:s', $existingSignup['createtime'])
                        ],
                    ];
                }
            } else {
                // 首次报名，插入新记录
                $data = [
                    'user_id' => $this->auth->id,
                    'username' => $this->auth->username,
                    'archives_id' => $archivesId,
                    'createtime' => time(),
                    'updatetime' => time(),
                    'status' => 'normal'
                ];

                $signupId = Db::name('cms_diyform_activity_signup')->insertGetId($data);

                $response = [
                    'code' => 1,
                    'msg' => __('报名成功'),
                    'time' => time(),
                    'data' => [
                        'id' => $signupId,
                        'username' => $this->auth->username,
                        'is_new' => true,
                        'signup_time' => date('Y-m-d H:i:s', time())
                    ],
                ];
            }

            header('Content-Type: application/json; charset=utf-8');
            echo json_encode($response);
            exit;

        } catch (\Exception $e) {
            $response = [
                'code' => 0,
                'msg' => __('报名失败') . '：' . $e->getMessage(),
                'time' => time(),
                'data' => null,
            ];
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode($response);
            exit;
        }
    }

    /**
     * 取消报名
     *
     * @ApiMethod (POST)
     * @ApiRoute (/miniapp/activity/cancel)
     * @ApiParams (name="archives_id", type="int", required=true, description="活动ID（文章ID）")
     */
    public function cancel()
    {
        $archivesId = $this->request->post('archives_id');

        // 验证必填参数
        if (!$archivesId) {
            $response = [
                'code' => 0,
                'msg' => __('活动ID不能为空'),
                'time' => time(),
                'data' => null,
            ];
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode($response);
            exit;
        }

        try {
            // 检查是否已报名
            $signup = Db::name('cms_diyform_activity_signup')
                ->where('user_id', $this->auth->id)
                ->where('archives_id', $archivesId)
                ->where('status', 'normal')
                ->find();

            if (!$signup) {
                throw new \Exception(__('未找到报名记录或已取消'));
            }

            // 取消报名（软删除，将状态改为hidden）
            $result = Db::name('cms_diyform_activity_signup')
                ->where('id', $signup['id'])
                ->update([
                    'status' => 'hidden',
                    'updatetime' => time()
                ]);

            if ($result === false) {
                throw new \Exception(__('取消报名失败'));
            }

            $response = [
                'code' => 1,
                'msg' => __('取消报名成功'),
                'time' => time(),
                'data' => [
                    'id' => $signup['id'],
                    'archives_id' => $archivesId
                ],
            ];
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode($response);
            exit;

        } catch (\Exception $e) {
            $response = [
                'code' => 0,
                'msg' => __('取消报名失败') . '：' . $e->getMessage(),
                'time' => time(),
                'data' => null,
            ];
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode($response);
            exit;
        }
    }
}
