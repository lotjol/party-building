<?php

namespace app\miniapp\controller;

use think\Db;
use think\Exception;

/**
 * 党费缴纳（小程序端）
 */
class Payment extends Base
{
    protected $noNeedLogin = [];
    protected $noNeedRight = '*';

    /**
     * 待缴费查询（按月明细返回）
     *
     * 返回字段（每条记录）：
     * organization, period, payable, paid, payment_status, payment_method, account
     *
     * @ApiMethod (GET)
     * @ApiRoute (/miniapp/payment/pending)
     */
    public function pending()
    {
        try {
            // 只取当前用户、待缴费状态（payment_status = '0'）
            $rows = Db::name('cms_diyform_payment')
                ->where('user_id', $this->auth->id)
                ->where('payment_status', '0')
                ->order('period asc')
                ->field('id,organization,period,payable,payment_status,payment_method,account,nickname')
                ->select();

            // 计算聚合结果
            $totalPayable = 0;
            $organization = '';
            $account = '';
            $paymentMethod = '';
            $paymentStatus = '';
            $nickname = '';
            $startPeriod = '';
            $endPeriod = '';

            if (!empty($rows)) {
                $organization = (string)($rows[0]['organization'] ?? '');
                $account = (string)($rows[0]['account'] ?? '');
                $paymentMethod = (string)($rows[0]['payment_method'] ?? '');
                $paymentStatus = '待缴费';
                $nickname = (string)($rows[0]['nickname'] ?? '');

                // 统计金额与时间范围
                foreach ($rows as $row) {
                    $totalPayable += (int)($row['payable'] ?? 0);
                    $p = (string)($row['period'] ?? '');
                    if ($p) {
                        if ($startPeriod === '') $startPeriod = $p;
                        $endPeriod = $p; // 行已按 period 升序
                    }
                }
            }

            // 生成区间字符串
            $formatCn = function ($period) {
                $ts = strtotime($period);
                return $ts ? (date('Y', $ts) . '年' . (int)date('n', $ts) . '月') : '';
            };
            $monthCount = '';
            if ($startPeriod && $endPeriod) {
                // 只有一个月份时直接显示，否则显示区间
                $monthCount = ($startPeriod === $endPeriod) 
                    ? $formatCn($startPeriod)
                    : ($formatCn($startPeriod) . '-' . $formatCn($endPeriod));
            }

            $response = [
                'code' => 1,
                'msg'  => __('获取成功'),
                'time' => time(),
                'data' => [
                    'organization' => $organization,
                    'total_payable' => (int)$totalPayable,
                    'month_count' => $monthCount,
                    'account' => $account,
                    'payment_method' => $paymentMethod ?: '模拟支付',
                    'payment_status' => $paymentStatus,
                    'nickname' => $nickname,
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
     * 合并缴清所有未缴月份
     * 规则：
     * - 更新当前用户所有 payment_status='0'（待缴费）的记录
     * - 将 paid = payable，payment_status='1'（已缴费），保持 payment_method 不变
     * - 不生成额外凭证单
     *
     * @ApiMethod (POST)
     * @ApiRoute (/miniapp/payment/pay)
     */
    public function pay()
    {
        try {
            Db::startTrans();

            // 查出所有待缴的月度记录（payment_status = '0'）
            $pendingList = Db::name('cms_diyform_payment')
                ->where('user_id', $this->auth->id)
                ->where('payment_status', '0')
                ->lock(true)
                ->field('id,payable,payment_method')
                ->select();

            if (empty($pendingList)) {
                Db::commit();
                $this->success(__('无待缴费用'), [
                    'updated' => 0,
                    'total_payable' => 0,
                ]);
            }

            // 一致性：payment_method 在后台已保证一致，这里不再变更
            $totalPayable = 0;
            $ids = [];
            foreach ($pendingList as $it) {
                $totalPayable += (int)$it['payable'];
                $ids[] = (int)$it['id'];
            }

            // 批量更新：paid=payable，payment_status='1'（已缴费），updatetime=now
            $now = time();
            $updated = Db::name('cms_diyform_payment')
                ->where('id', 'in', $ids)
                ->update([
                    'paid' => Db::raw('payable'),
                    'payment_status' => '1',
                    'updatetime' => $now,
                ]);

            Db::commit();

            $this->success(__('缴费成功'), [
                'updated' => (int)$updated,
                'total_payable' => (int)$totalPayable,
            ]);
        } catch (Exception $e) {
            Db::rollback();
            $this->error(__('缴费失败') . '：' . $e->getMessage());
        }
    }
}


