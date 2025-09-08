<?php

namespace app\process;

use app\admin\model\Report;
use app\admin\model\User;
use Carbon\Carbon;
use Workerman\Crontab\Crontab;

class Task
{
    public function onWorkerStart()
    {
        // 每天的7点50执行，注意这里省略了秒位
        new Crontab('50 3 * * *', function () {
            $today = Carbon::today();

// 一次性聚合所有用户的订单
            $totals = User::query()
                ->select('wa_users.id as user_id')
                ->selectRaw('
        COALESCE(SUM(wa_orders.service_amount), 0) as service_amount,
        COALESCE(SUM(wa_orders.trade_amount), 0) as trade_amount,
        COALESCE(SUM(wa_orders.kehu_amount), 0) as kehu_amount
    ')
                ->leftJoin('wa_orders', function ($join) use ($today) {
                    $join->on('wa_orders.user_id', '=', 'wa_users.id')
                        ->whereDate('wa_orders.finish_at', $today);
                })
                ->groupBy('wa_users.id')
                ->get()
                ->keyBy('user_id');

// 批量生成报表数据
            $reports = $totals->map(function ($data, $userId) use ($today) {
                return [
                    'user_id'        => $userId,
                    'service_amount' => $data->service_amount,
                    'total_amount'   => $data->trade_amount,
                    'kehu_amount'    => $data->kehu_amount,
                    'date'           => $today,
                ];
            });

// 一次性插入
            Report::insert($reports->toArray());

        });


    }
}