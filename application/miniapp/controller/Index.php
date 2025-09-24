<?php

namespace app\miniapp\controller;

/**
 * 小程序首页接口
 */
class Index extends Base
{
    protected $noNeedLogin = ['*'];
    protected $noNeedRight = ['*'];

    /**
     * 首页信息
     *
     * @ApiMethod (GET)
     */
    public function info()
    {
        // 获取系统配置信息
        $site = \think\Config::get('site');
        
        // 获取轮播图（如果有的话）
        $banners = $this->getBanners();
        
        // 获取最新文章
        $latestArticles = $this->getLatestArticles();
        
        // 获取通知公告
        $notices = $this->getNotices();
        
        $data = [
            'site' => [
                'name' => $site['name'] ?? '党建服务中心',
                'logo' => $site['logo'] ?? '',
                'description' => $site['description'] ?? ''
            ],
            'banners' => $banners,
            'latest_articles' => $latestArticles,
            'notices' => $notices,
            'user_logged' => $this->auth->isLogin(),
            'user_info' => $this->auth->isLogin() ? $this->processMiniAppData($this->auth->getUser()->toArray()) : null
        ];
        
        $this->success('', $data);
    }

    /**
     * 获取轮播图
     * @return array
     */
    protected function getBanners()
    {
        // 这里可以从数据库获取轮播图数据
        // 暂时返回示例数据
        return [
            [
                'id' => 1,
                'title' => '党建活动',
                'image' => '/assets/img/banner1.jpg',
                'url' => '/content/list'
            ],
            [
                'id' => 2,
                'title' => '学习资源',
                'image' => '/assets/img/banner2.jpg',
                'url' => '/content/list'
            ]
        ];
    }

    /**
     * 获取最新文章
     * @return array
     */
    protected function getLatestArticles()
    {
        try {
            // 尝试从CMS插件获取文章
            if (class_exists('\addons\cms\model\Archives')) {
                $articles = \addons\cms\model\Archives::where('status', 'normal')
                    ->where('deletetime', null)
                    ->order('publishtime desc')
                    ->limit(5)
                    ->field('id,title,image,description,publishtime')
                    ->select();
                
                $result = [];
                foreach ($articles as $article) {
                    $result[] = [
                        'id' => $article->id,
                        'title' => $article->title,
                        'image' => $article->image,
                        'description' => $article->description,
                        'publishtime' => date('Y-m-d', $article->publishtime),
                        'url' => '/content/detail?id=' . $article->id
                    ];
                }
                return $result;
            }
        } catch (\Exception $e) {
            \think\Log::error('获取文章失败: ' . $e->getMessage());
        }
        
        // 返回示例数据
        return [
            [
                'id' => 1,
                'title' => '学习贯彻党的二十大精神',
                'image' => '/assets/img/article1.jpg',
                'description' => '深入学习党的二十大精神，推进党建工作高质量发展',
                'publishtime' => '2024-01-15',
                'url' => '/content/detail?id=1'
            ],
            [
                'id' => 2,
                'title' => '党建活动通知',
                'image' => '/assets/img/article2.jpg',
                'description' => '关于开展主题党日活动的通知',
                'publishtime' => '2024-01-14',
                'url' => '/content/detail?id=2'
            ]
        ];
    }

    /**
     * 获取通知公告
     * @return array
     */
    protected function getNotices()
    {
        // 返回示例数据
        return [
            [
                'id' => 1,
                'title' => '系统维护通知',
                'content' => '系统将于今晚22:00-24:00进行维护升级',
                'createtime' => '2024-01-15 10:00:00'
            ],
            [
                'id' => 2,
                'title' => '新功能上线',
                'content' => '小程序新版本已上线，新增多项便民功能',
                'createtime' => '2024-01-14 15:30:00'
            ]
        ];
    }
}
