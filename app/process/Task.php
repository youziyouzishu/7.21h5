<?php

namespace app\process;

use app\admin\model\User;
use Carbon\Carbon;
use Workerman\Crontab\Crontab;

class Task
{
    public function onWorkerStart()
    {
        // 每天的7点50执行，注意这里省略了秒位
        new Crontab('50 3 * * *', function () {
            $users = User::all();
            $today = Carbon::today();
            foreach ($users as $user) {
                $totals = $user->allChildrenOrders()
                    ->whereDate('finish_at', $today)
                    ->selectRaw('SUM(service_amount) as service_amount,SUM(trade_amount) as trade_amount,SUM(kehu_amount) as kehu_amount')
                    ->first();

                $user->report()->create([
                    'service_amount' => $totals->service_amount ?? 0,
                    'total_amount'   => $totals->trade_amount ?? 0,
                    'kehu_amount'    => $totals->kehu_amount ?? 0,
                    'date'           => $today,
                ]);
            }
        });


    }
}