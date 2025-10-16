<?php

namespace app\miniapp\controller;

use app\common\exception\UploadException;
use app\common\library\Upload as UploadLib;
use think\Config;

/**
 * 文件上传控制器（小程序专用）
 * 应用场景：随手拍图片、用户头像、入党证明材料等
 */
class Upload extends Base
{
    protected $noNeedLogin = [];
    protected $noNeedRight = '*';

    /**
     * 单文件上传
     *
     * @ApiMethod (POST)
     * @ApiParams (name="file", type="file", required=true, description="文件流")
     * @ApiParams (name="type", type="string", required=false, description="文件分类：snapshot(随手拍),avatar(头像),certificate(证明材料)")
     */
    public function upload()
    {
        Config::set('default_return_type', 'json');
        // 必须设定cdnurl为空，否则cdnurl函数计算错误
        Config::set('upload.cdnurl', '');

        $type = $this->request->post('type', 'all');
        $file = $this->request->file('file');

        if (!$file) {
            $response = [
                'code' => 0,
                'msg' => __('请选择要上传的文件'),
                'time' => time(),
                'data' => null,
            ];
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode($response);
            exit;
        }

        try {
            $upload = new UploadLib($file);
            $attachment = $upload->upload();

            // 获取完整的URL
            $url = $attachment->url;
            $fullurl = cdnurl($url, true);

            $response = [
                'code' => 1,
                'msg' => __('上传成功'),
                'time' => time(),
                'data' => [
                    'id' => $attachment->id,
                    'url' => $url,
                    'fullurl' => $fullurl,
                    'filename' => $attachment->filename,
                    'filesize' => $attachment->filesize,
                    'mimetype' => $attachment->mimetype,
                    'type' => $type,
                    'imagewidth' => $attachment->imagewidth ?? 0,
                    'imageheight' => $attachment->imageheight ?? 0,
                    'uploadtime' => date('Y-m-d H:i:s', $attachment->uploadtime)
                ],
            ];
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode($response);
            exit;

        } catch (UploadException $e) {
            $response = [
                'code' => 0,
                'msg' => __('上传失败') . '：' . $e->getMessage(),
                'time' => time(),
                'data' => null,
            ];
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode($response);
            exit;
        } catch (\Exception $e) {
            $response = [
                'code' => 0,
                'msg' => __('上传失败') . '：' . $e->getMessage(),
                'time' => time(),
                'data' => null,
            ];
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode($response);
            exit;
        }
    }

    /**
     * 多文件上传
     *
     * @ApiMethod (POST)
     * @ApiParams (name="files", type="file[]", required=true, description="文件流数组")
     * @ApiParams (name="type", type="string", required=false, description="文件分类：snapshot(随手拍),avatar(头像),certificate(证明材料)")
     */
    public function multiple()
    {
        Config::set('default_return_type', 'json');
        Config::set('upload.cdnurl', '');

        $type = $this->request->post('type', 'all');
        $files = $this->request->file('files');

        if (!$files || !is_array($files)) {
            $response = [
                'code' => 0,
                'msg' => __('请选择要上传的文件'),
                'time' => time(),
                'data' => null,
            ];
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode($response);
            exit;
        }

        // 限制一次最多上传9张
        if (count($files) > 9) {
            $response = [
                'code' => 0,
                'msg' => __('一次最多上传9个文件'),
                'time' => time(),
                'data' => null,
            ];
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode($response);
            exit;
        }

        $successList = [];
        $failList = [];

        foreach ($files as $index => $file) {
            try {
                $upload = new UploadLib($file);
                $attachment = $upload->upload();

                $url = $attachment->url;
                $fullurl = cdnurl($url, true);

                $successList[] = [
                    'id' => $attachment->id,
                    'url' => $url,
                    'fullurl' => $fullurl,
                    'filename' => $attachment->filename,
                    'filesize' => $attachment->filesize,
                    'mimetype' => $attachment->mimetype,
                    'type' => $type,
                    'imagewidth' => $attachment->imagewidth ?? 0,
                    'imageheight' => $attachment->imageheight ?? 0,
                    'uploadtime' => date('Y-m-d H:i:s', $attachment->uploadtime)
                ];

            } catch (\Exception $e) {
                $failList[] = [
                    'index' => $index,
                    'filename' => $file->getInfo()['name'] ?? 'unknown',
                    'error' => $e->getMessage()
                ];
            }
        }

        // 如果全部失败
        if (empty($successList)) {
            $response = [
                'code' => 0,
                'msg' => __('上传失败'),
                'time' => time(),
                'data' => [
                    'success_count' => 0,
                    'fail_count' => count($failList),
                    'fail_list' => $failList
                ],
            ];
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode($response);
            exit;
        }

        // 部分成功或全部成功
        $response = [
            'code' => 1,
            'msg' => count($failList) > 0 ? __('部分文件上传成功') : __('上传成功'),
            'time' => time(),
            'data' => [
                'success_count' => count($successList),
                'fail_count' => count($failList),
                'success_list' => $successList,
                'fail_list' => $failList
            ],
        ];
        header('Content-Type: application/json; charset=utf-8');
        echo json_encode($response);
        exit;
    }

    /**
     * 图片上传（专用于图片场景）
     *
     * @ApiMethod (POST)
     * @ApiParams (name="file", type="file", required=true, description="图片文件")
     * @ApiParams (name="type", type="string", required=false, description="图片分类：snapshot(随手拍),avatar(头像)")
     */
    public function image()
    {
        Config::set('default_return_type', 'json');
        Config::set('upload.cdnurl', '');

        $type = $this->request->post('type', 'snapshot');
        $file = $this->request->file('file');

        if (!$file) {
            $response = [
                'code' => 0,
                'msg' => __('请选择要上传的图片'),
                'time' => time(),
                'data' => null,
            ];
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode($response);
            exit;
        }

        try {
            // 验证是否为图片
            $mimeType = $file->getMime();
            if (strpos($mimeType, 'image/') !== 0) {
                throw new \Exception(__('只能上传图片文件'));
            }

            $upload = new UploadLib($file);
            $attachment = $upload->upload();

            $url = $attachment->url;
            $fullurl = cdnurl($url, true);

            $response = [
                'code' => 1,
                'msg' => __('上传成功'),
                'time' => time(),
                'data' => [
                    'id' => $attachment->id,
                    'url' => $url,
                    'fullurl' => $fullurl,
                    'filename' => $attachment->filename,
                    'filesize' => $attachment->filesize,
                    'mimetype' => $attachment->mimetype,
                    'type' => $type,
                    'imagewidth' => $attachment->imagewidth,
                    'imageheight' => $attachment->imageheight,
                    'uploadtime' => date('Y-m-d H:i:s', $attachment->uploadtime)
                ],
            ];
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode($response);
            exit;

        } catch (UploadException $e) {
            $response = [
                'code' => 0,
                'msg' => __('上传失败') . '：' . $e->getMessage(),
                'time' => time(),
                'data' => null,
            ];
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode($response);
            exit;
        } catch (\Exception $e) {
            $response = [
                'code' => 0,
                'msg' => __('上传失败') . '：' . $e->getMessage(),
                'time' => time(),
                'data' => null,
            ];
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode($response);
            exit;
        }
    }

    /**
     * Base64图片上传（适用于小程序临时图片）
     *
     * @ApiMethod (POST)
     * @ApiParams (name="image", type="string", required=true, description="Base64编码的图片数据")
     * @ApiParams (name="type", type="string", required=false, description="图片分类")
     */
    public function base64()
    {
        $imageData = $this->request->post('image');
        $type = $this->request->post('type', 'snapshot');

        if (!$imageData) {
            $response = [
                'code' => 0,
                'msg' => __('图片数据不能为空'),
                'time' => time(),
                'data' => null,
            ];
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode($response);
            exit;
        }

        try {
            // 解析base64数据
            if (preg_match('/^(data:\s*image\/(\w+);base64,)/', $imageData, $matches)) {
                $imageType = $matches[2];
                $imageData = str_replace($matches[1], '', $imageData);
            } else {
                $imageType = 'png';
            }

            $imageData = base64_decode($imageData);
            if ($imageData === false) {
                throw new \Exception(__('Base64数据解码失败'));
            }

            // 生成临时文件
            $tempFile = tempnam(sys_get_temp_dir(), 'upload_');
            file_put_contents($tempFile, $imageData);

            // 创建文件信息数组
            $fileInfo = [
                'name' => 'image_' . date('YmdHis') . '_' . uniqid() . '.' . $imageType,
                'type' => 'image/' . $imageType,
                'tmp_name' => $tempFile,
                'error' => 0,
                'size' => filesize($tempFile)
            ];

            // 创建File对象
            $file = new \think\File($tempFile);
            $file->setUploadInfo($fileInfo);
            $file->setSaveName($fileInfo['name']);

            $upload = new UploadLib($file);
            $attachment = $upload->upload();

            // 删除临时文件
            @unlink($tempFile);

            $url = $attachment->url;
            $fullurl = cdnurl($url, true);

            $response = [
                'code' => 1,
                'msg' => __('上传成功'),
                'time' => time(),
                'data' => [
                    'id' => $attachment->id,
                    'url' => $url,
                    'fullurl' => $fullurl,
                    'filename' => $attachment->filename,
                    'filesize' => $attachment->filesize,
                    'mimetype' => $attachment->mimetype,
                    'type' => $type,
                    'imagewidth' => $attachment->imagewidth,
                    'imageheight' => $attachment->imageheight,
                    'uploadtime' => date('Y-m-d H:i:s', $attachment->uploadtime)
                ],
            ];
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode($response);
            exit;

        } catch (\Exception $e) {
            $response = [
                'code' => 0,
                'msg' => __('上传失败') . '：' . $e->getMessage(),
                'time' => time(),
                'data' => null,
            ];
            header('Content-Type: application/json; charset=utf-8');
            echo json_encode($response);
            exit;
        }
    }
}

