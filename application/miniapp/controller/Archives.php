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
                ->field('id,channel_id,model_id,title,image,description,views,comments,likes,weigh,createtime,updatetime,publishtime')
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
                
                // 获取模型信息
                $modelName = '';
                if ($article->model_id) {
                    $model = \think\Db::name('cms_model')->where('id', $article->model_id)->field('name')->find();
                    $modelName = $model ? $model['name'] : '';
                }
                
                $item = [
                    'id' => $article->id,
                    'channel_id' => $article->channel_id,
                    'channel_name' => $channelName,
                    'model_id' => $article->model_id,
                    'model_name' => $modelName,
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
                
                // 如果是组织活动类型（model_id = 2），添加活动相关字段
                if ($article->model_id == 2) {
                    // 获取活动附加表数据
                    $activityData = \think\Db::name('cms_addon_activity')->where('id', $article->id)->find();
                    if ($activityData && !empty($activityData['start_date']) && !empty($activityData['end_date'])) {
                        // 添加活动日期字段
                        $item['start_date'] = $activityData['start_date'];
                        $item['end_date'] = $activityData['end_date'];
                        
                        // 检查当前用户是否已报名（需要登录）
                        $isSignedUp = false;
                        if ($this->auth && $this->auth->id) {
                            $signup = \think\Db::name('cms_diyform_activity_signup')
                                ->where('user_id', $this->auth->id)
                                ->where('archives_id', $article->id)
                                ->where('status', 'normal')
                                ->find();
                            $isSignedUp = $signup ? true : false;
                        }
                        
                        // 计算活动状态
                        $now = time();
                        $start = strtotime($activityData['start_date']);
                        $end = strtotime($activityData['end_date'] . ' 23:59:59'); // 结束日期包含当天全天
                        
                        if ($isSignedUp) {
                            $activityStatus = '已报名';
                        } elseif ($now < $start) {
                            $activityStatus = '未开始';
                        } elseif ($now >= $start && $now <= $end) {
                            $activityStatus = '进行中';
                        } else {
                            $activityStatus = '已结束';
                        }
                        
                        // 统计报名人数
                        $signupCount = \think\Db::name('cms_diyform_activity_signup')
                            ->where('archives_id', $article->id)
                            ->where('status', 'normal')
                            ->count();
                        
                        // 添加活动相关字段
                        $item['activity_status'] = $activityStatus;
                        $item['is_signed_up'] = $isSignedUp;
                        $item['signup_count'] = $signupCount;
                    }
                }
                
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
                ->field('id,channel_id,model_id,title,image,description,views,comments,likes,weigh,createtime,updatetime,publishtime')
                ->find();
            
            if (!$article) {
                throw new \Exception('文章不存在');
            }
            
            // 获取文章内容和模型特定字段
            $content = '';
            $extraFields = [];
            
            if ($article->model_id) {
                // 获取模型信息
                $model = \think\Db::name('cms_model')->where('id', $article->model_id)->find();
                if ($model && $model['table']) {
                    // $model['table'] 已经包含完整表名，如 'cms_addon_article'
                    $addonTable = $model['table'];
                    
                    // 查询附加表数据
                    $addonData = \think\Db::name($addonTable)->where('id', $id)->find();
                    if ($addonData) {
                        // 获取内容
                        if (isset($addonData['content'])) {
                            $content = $addonData['content'] ?: '';
                        }
                        
                        // 动态获取附加字段（排除 id 和 content）
                        foreach ($addonData as $key => $value) {
                            // 跳过 id 和 content 字段
                            if ($key !== 'id' && $key !== 'content') {
                                // 只返回存在且有值的字段
                                if (isset($addonData[$key])) {
                                    $extraFields[$key] = $value !== null ? $value : '';
                                }
                            }
                        }
                    }
                }
            }
            
            // 获取栏目名称
            $channelName = '';
            if ($article->channel_id) {
                $channel = CmsChannel::where('id', $article->channel_id)->field('name')->find();
                $channelName = $channel ? $channel->name : '';
            }
            
            // 获取模型名称
            $modelName = '';
            if ($article->model_id) {
                $model = \think\Db::name('cms_model')->where('id', $article->model_id)->field('name')->find();
                $modelName = $model ? $model['name'] : '';
            }
            
            // 增加浏览量
            CmsArchives::where('id', $id)->setInc('views');
            
            $result = [
                'id' => $article->id,
                'channel_id' => $article->channel_id,
                'channel_name' => $channelName,
                'model_id' => $article->model_id,
                'model_name' => $modelName,
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
            
            // 合并模型特定字段
            $result = array_merge($result, $extraFields);
            
            // 如果是组织活动类型（model_id = 2），添加活动状态和报名信息
            if ($article->model_id == 2 && !empty($extraFields['start_date']) && !empty($extraFields['end_date'])) {
                // 检查当前用户是否已报名（需要登录）
                $isSignedUp = false;
                if ($this->auth && $this->auth->id) {
                    $signup = \think\Db::name('cms_diyform_activity_signup')
                        ->where('user_id', $this->auth->id)
                        ->where('archives_id', $id)
                        ->where('status', 'normal')
                        ->find();
                    $isSignedUp = $signup ? true : false;
                }
                
                // 计算活动状态
                $now = time();
                $start = strtotime($extraFields['start_date']);
                $end = strtotime($extraFields['end_date'] . ' 23:59:59'); // 结束日期包含当天全天
                
                if ($isSignedUp) {
                    $activityStatus = '已报名';
                } elseif ($now < $start) {
                    $activityStatus = '未开始';
                } elseif ($now >= $start && $now <= $end) {
                    $activityStatus = '进行中';
                } else {
                    $activityStatus = '已结束';
                }
                
                // 统计报名人数
                $signupCount = \think\Db::name('cms_diyform_activity_signup')
                    ->where('archives_id', $id)
                    ->where('status', 'normal')
                    ->count();
                
                // 添加活动相关字段
                $result['activity_status'] = $activityStatus;
                $result['is_signed_up'] = $isSignedUp;
                $result['signup_count'] = $signupCount;
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
                ->field('id,channel_id,model_id,title,image,description,views,comments,likes,weigh,createtime,updatetime,publishtime')
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
                
                // 获取模型信息
                $modelName = '';
                if ($article->model_id) {
                    $model = \think\Db::name('cms_model')->where('id', $article->model_id)->field('name')->find();
                    $modelName = $model ? $model['name'] : '';
                }
                
                $item = [
                    'id' => $article->id,
                    'channel_id' => $article->channel_id,
                    'channel_name' => $channelName,
                    'model_id' => $article->model_id,
                    'model_name' => $modelName,
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
                
                // 如果是组织活动类型（model_id = 2），添加活动相关字段
                if ($article->model_id == 2) {
                    // 获取活动附加表数据
                    $activityData = \think\Db::name('cms_addon_activity')->where('id', $article->id)->find();
                    if ($activityData && !empty($activityData['start_date']) && !empty($activityData['end_date'])) {
                        // 添加活动日期字段
                        $item['start_date'] = $activityData['start_date'];
                        $item['end_date'] = $activityData['end_date'];
                        
                        // 检查当前用户是否已报名（需要登录）
                        $isSignedUp = false;
                        if ($this->auth && $this->auth->id) {
                            $signup = \think\Db::name('cms_diyform_activity_signup')
                                ->where('user_id', $this->auth->id)
                                ->where('archives_id', $article->id)
                                ->where('status', 'normal')
                                ->find();
                            $isSignedUp = $signup ? true : false;
                        }
                        
                        // 计算活动状态
                        $now = time();
                        $start = strtotime($activityData['start_date']);
                        $end = strtotime($activityData['end_date'] . ' 23:59:59'); // 结束日期包含当天全天
                        
                        if ($isSignedUp) {
                            $activityStatus = '已报名';
                        } elseif ($now < $start) {
                            $activityStatus = '未开始';
                        } elseif ($now >= $start && $now <= $end) {
                            $activityStatus = '进行中';
                        } else {
                            $activityStatus = '已结束';
                        }
                        
                        // 统计报名人数
                        $signupCount = \think\Db::name('cms_diyform_activity_signup')
                            ->where('archives_id', $article->id)
                            ->where('status', 'normal')
                            ->count();
                        
                        // 添加活动相关字段
                        $item['activity_status'] = $activityStatus;
                        $item['is_signed_up'] = $isSignedUp;
                        $item['signup_count'] = $signupCount;
                    }
                }
                
                $result[] = $item;
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
                ->field('id,channel_id,model_id,title,image,description,views,comments,likes,weigh,createtime,updatetime,publishtime')
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
                
                // 获取模型信息
                $modelName = '';
                if ($article->model_id) {
                    $model = \think\Db::name('cms_model')->where('id', $article->model_id)->field('name')->find();
                    $modelName = $model ? $model['name'] : '';
                }
                
                $item = [
                    'id' => $article->id,
                    'channel_id' => $article->channel_id,
                    'channel_name' => $channelName,
                    'model_id' => $article->model_id,
                    'model_name' => $modelName,
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
                
                // 如果是组织活动类型（model_id = 2），添加活动相关字段
                if ($article->model_id == 2) {
                    // 获取活动附加表数据
                    $activityData = \think\Db::name('cms_addon_activity')->where('id', $article->id)->find();
                    if ($activityData && !empty($activityData['start_date']) && !empty($activityData['end_date'])) {
                        // 添加活动日期字段
                        $item['start_date'] = $activityData['start_date'];
                        $item['end_date'] = $activityData['end_date'];
                        
                        // 检查当前用户是否已报名（需要登录）
                        $isSignedUp = false;
                        if ($this->auth && $this->auth->id) {
                            $signup = \think\Db::name('cms_diyform_activity_signup')
                                ->where('user_id', $this->auth->id)
                                ->where('archives_id', $article->id)
                                ->where('status', 'normal')
                                ->find();
                            $isSignedUp = $signup ? true : false;
                        }
                        
                        // 计算活动状态
                        $now = time();
                        $start = strtotime($activityData['start_date']);
                        $end = strtotime($activityData['end_date'] . ' 23:59:59'); // 结束日期包含当天全天
                        
                        if ($isSignedUp) {
                            $activityStatus = '已报名';
                        } elseif ($now < $start) {
                            $activityStatus = '未开始';
                        } elseif ($now >= $start && $now <= $end) {
                            $activityStatus = '进行中';
                        } else {
                            $activityStatus = '已结束';
                        }
                        
                        // 统计报名人数
                        $signupCount = \think\Db::name('cms_diyform_activity_signup')
                            ->where('archives_id', $article->id)
                            ->where('status', 'normal')
                            ->count();
                        
                        // 添加活动相关字段
                        $item['activity_status'] = $activityStatus;
                        $item['is_signed_up'] = $isSignedUp;
                        $item['signup_count'] = $signupCount;
                    }
                }
                
                $result[] = $item;
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

    /**
     * 记录学习
     *
     * @ApiMethod (POST)
     * @ApiRoute (/miniapp/archives/study)
     * @ApiParams (name="archives_id", type="int", required=true, description="文章ID")
     */
    public function study()
    {
        $archivesId = $this->request->post('archives_id');

        // 验证必填参数
        if (!$archivesId) {
            $response = [
                'code' => 0,
                'msg' => __('参数不能为空'),
                'time' => time(),
                'data' => null,
            ];
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode($response);
            exit;
        }

        try {
            // 检查文章是否存在 - 只查询通用文章模型(model_id = 1)
            $archives = CmsArchives::where('id', $archivesId)
                ->where('status', 'normal')
                ->where('model_id', 1)  // 通用文章模型ID
                ->find();

            if (!$archives) {
                throw new \Exception(__('文章不存在'));
            }

            // 检查是否已经学习过（包括已删除的记录）
            $existingRecord = \think\Db::name('cms_study_record')
                ->where('user_id', $this->auth->id)
                ->where('archives_id', $archivesId)
                ->find();

            if ($existingRecord) {
                // 已经学习过，更新最后访问时间
                // 如果之前删除了(status='hidden')，现在恢复为normal
                $updateData = [
                    'updatetime' => time(),
                    'status' => 'normal'  // 确保状态为正常
                ];
                
                \think\Db::name('cms_study_record')
                    ->where('id', $existingRecord['id'])
                    ->update($updateData);

                $response = [
                    'code' => 1,
                    'msg' => __('学习记录已更新'),
                    'time' => time(),
                    'data' => [
                        'id' => $existingRecord['id'],
                        'is_new' => false,
                        'restored' => $existingRecord['status'] != 'normal'  // 是否恢复了已删除的记录
                    ],
                ];
            } else {
                // 首次学习，插入新记录
                $data = [
                    'user_id' => $this->auth->id,
                    'archives_id' => $archivesId,
                    'createtime' => time(),
                    'updatetime' => time(),
                    'status' => 'normal'
                ];

                $recordId = \think\Db::name('cms_study_record')->insertGetId($data);

                $response = [
                    'code' => 1,
                    'msg' => __('学习记录成功'),
                    'time' => time(),
                    'data' => [
                        'id' => $recordId,
                        'is_new' => true
                    ],
                ];
            }

            header('Content-Type: application/json; charset=utf-8');
            echo json_encode($response);
            exit;

        } catch (\Exception $e) {
            $response = [
                'code' => 0,
                'msg' => __('记录失败') . '：' . $e->getMessage(),
                'time' => time(),
                'data' => null,
            ];
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode($response);
            exit;
        }
    }

    /**
     * 获取学习记录列表
     *
     * @ApiMethod (GET)
     * @ApiRoute (/miniapp/archives/study/list)
     * @ApiParams (name="page", type="int", required=false, description="页码，默认1")
     * @ApiParams (name="limit", type="int", required=false, description="每页数量，默认10")
     */
    public function study_list()
    {
        $page = $this->request->get('page', 1);
        $limit = $this->request->get('limit', 10);

        // 参数验证
        $page = max(1, intval($page));
        $limit = min(50, max(1, intval($limit))); // 限制最大50条

        try {
            // 查询学习记录，关联文章表获取标题和封面 - 只查询通用文章模型(model_id = 1)
            $records = \think\Db::name('cms_study_record')
                ->alias('sr')
                ->join('cms_archives a', 'sr.archives_id = a.id')
                ->where('sr.user_id', $this->auth->id)
                ->where('sr.status', 'normal')
                ->where('a.status', 'normal')
                ->where('a.model_id', 1)  // 通用文章模型ID
                ->field('sr.id, sr.archives_id, sr.createtime, sr.updatetime, a.title, a.image, a.description, a.views, a.likes')
                ->order('sr.updatetime desc, sr.createtime desc')
                ->page($page, $limit)
                ->select();

            // 获取总数
            $total = \think\Db::name('cms_study_record')
                ->alias('sr')
                ->join('cms_archives a', 'sr.archives_id = a.id')
                ->where('sr.user_id', $this->auth->id)
                ->where('sr.status', 'normal')
                ->where('a.status', 'normal')
                ->where('a.model_id', 1)  // 通用文章模型ID
                ->count();

            $result = [];
            foreach ($records as $record) {
                // 处理图片完整路径
                $image = '';
                if ($record['image']) {
                    $image = cdnurl($record['image'], true);
                }

                $result[] = [
                    'id' => $record['id'],
                    'archives_id' => $record['archives_id'],
                    'title' => $record['title'],
                    'image' => $image,
                    'description' => $record['description'] ?: '',
                    'views' => $record['views'],
                    'likes' => $record['likes'],
                    'study_time' => date('Y-m-d H:i:s', $record['createtime']),
                    'last_view_time' => date('Y-m-d H:i:s', $record['updatetime'])
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
     * 检查是否已学习
     *
     * @ApiMethod (GET)
     * @ApiRoute (/miniapp/archives/study/status)
     * @ApiParams (name="archives_id", type="int", required=true, description="文章ID")
     */
    public function study_status()
    {
        $archivesId = $this->request->get('archives_id');

        if (!$archivesId) {
            $response = [
                'code' => 0,
                'msg' => __('参数不能为空'),
                'time' => time(),
                'data' => null,
            ];
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode($response);
            exit;
        }

        try {
            // 查询是否有学习记录
            $record = \think\Db::name('cms_study_record')
                ->where('user_id', $this->auth->id)
                ->where('archives_id', $archivesId)
                ->where('status', 'normal')
                ->find();

            $isStudied = $record ? true : false;

            $response = [
                'code' => 1,
                'msg' => __('获取成功'),
                'time' => time(),
                'data' => [
                    'archives_id' => intval($archivesId),
                    'is_studied' => $isStudied,
                    'study_time' => $record ? date('Y-m-d H:i:s', $record['createtime']) : null,
                    'last_view_time' => $record ? date('Y-m-d H:i:s', $record['updatetime']) : null
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
     * 删除学习记录
     *
     * @ApiMethod (POST)
     * @ApiRoute (/miniapp/archives/study/delete)
     * @ApiParams (name="id", type="int", required=false, description="学习记录ID")
     * @ApiParams (name="archives_id", type="int", required=false, description="文章ID（二选一）")
     */
    public function study_delete()
    {
        $id = $this->request->post('id');
        $archivesId = $this->request->post('archives_id');

        if (!$id && !$archivesId) {
            $response = [
                'code' => 0,
                'msg' => __('参数错误：id或archives_id至少提供一个'),
                'time' => time(),
                'data' => null,
            ];
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode($response);
            exit;
        }

        try {
            // 构建查询条件
            $where = ['user_id' => $this->auth->id];
            if ($id) {
                $where['id'] = $id;
            } else {
                $where['archives_id'] = $archivesId;
            }

            // 检查记录是否存在
            $record = \think\Db::name('cms_study_record')->where($where)->find();

            if (!$record) {
                throw new \Exception(__('学习记录不存在或无权删除'));
            }

            // 软删除（修改状态为hidden）
            \think\Db::name('cms_study_record')
                ->where('id', $record['id'])
                ->update(['status' => 'hidden']);

            $response = [
                'code' => 1,
                'msg' => __('删除成功'),
                'time' => time(),
                'data' => [
                    'id' => $record['id']
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
     * 清空学习记录
     *
     * @ApiMethod (POST)
     * @ApiRoute (/miniapp/archives/study/clear)
     */
    public function study_clear()
    {
        try {
            // 清空当前用户的所有学习记录（软删除为hidden）
            $affected = \think\Db::name('cms_study_record')
                ->where('user_id', $this->auth->id)
                ->where('status', 'normal')
                ->update(['status' => 'hidden']);

            $response = [
                'code' => 1,
                'msg' => __('清空成功'),
                'time' => time(),
                'data' => [
                    'affected' => $affected
                ],
            ];
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode($response);
            exit;

        } catch (\Exception $e) {
            $response = [
                'code' => 0,
                'msg' => __('清空失败') . '：' . $e->getMessage(),
                'time' => time(),
                'data' => null,
            ];
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode($response);
            exit;
        }
    }
}
