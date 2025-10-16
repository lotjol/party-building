<?php

namespace app\miniapp\controller;

use addons\cms\model\Block as CmsBlock;

/**
 * 区块控制器（Block - CMS区块管理）
 */
class Block extends Base
{
    protected $noNeedLogin = ['name'];
    protected $noNeedRight = ['*'];

    /**
     * 获取区块内容（Block Content by Name）
     *
     * @ApiMethod (GET)
     * @ApiParams (name="name", type="string", required=true, description="区块名称")
     */
    public function name()
    {
        $name = $this->request->get('name');
        
        // 必须提供name参数
        if (!$name) {
            $response = [
                'code' => 0,
                'msg'  => '参数错误：必须提供name参数',
                'time' => time(),
                'data' => null,
            ];
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode($response);
            exit;
        }
        
        try {
            // 检查CMS插件是否安装
            if (!class_exists('\addons\cms\model\Block')) {
                throw new \Exception('CMS插件未安装或Block模型不存在');
            }
            
            // 检查数据库表是否存在
            $tableExists = \think\Db::query("SHOW TABLES LIKE 'party_cms_block'");
            if (empty($tableExists)) {
                throw new \Exception('数据库表 party_cms_block 不存在');
            }
            
            // 构建查询条件
            $where = [
                'status' => 'normal',
                'name' => $name
            ];
            
            // 查询所有相同name的区块数据
            $blocks = CmsBlock::where($where)
                ->order('weigh desc, id asc')
                ->select();
            
            if (empty($blocks)) {
                throw new \Exception('区块不存在');
            }
            
            $currentTime = time();
            $result = [];
            
            // 处理每个区块
            foreach ($blocks as $block) {
                // 检查区块是否在有效时间内
                if (($block->begintime && $currentTime < $block->begintime) || 
                    ($block->endtime && $currentTime > $block->endtime)) {
                    continue; // 跳过不在有效时间内的区块
                }
                
                // 处理区块内容
                $blockData = $this->processBlockContent($block);
                $result[] = $blockData;
            }
            
            if (empty($result)) {
                throw new \Exception('没有在有效时间内的区块');
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
     * 处理区块内容
     * @param object $block
     * @return array
     */
    private function processBlockContent($block)
    {
        // 处理图片路径
        $image = '';
        if ($block->image) {
            $image = cdnurl($block->image, true);
        }
        
        // 处理链接
        $url = '';
        if ($block->url) {
            // 如果是外部链接，直接使用；如果是内部链接，转换为完整URL
            if (preg_match("/^https?:\/\/(.*)/i", $block->url)) {
                $url = $block->url;
            } else {
                $url = url($block->url);
            }
        }
        
        // 处理内容
        $content = '';
        if ($block->content) {
            $content = $block->content;
        }
        
        return [
            'id' => $block->id,
            'type' => $block->type,
            'name' => $block->name,
            'title' => $block->title,
            'image' => $image,
            'url' => $url,
            'content' => $content,
            'weigh' => $block->weigh
        ];
    }
}
