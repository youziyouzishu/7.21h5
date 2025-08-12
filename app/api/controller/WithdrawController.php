<?php

namespace app\api\controller;

use app\admin\model\Account;
use app\admin\model\User;
use app\admin\model\Withdraw;
use app\api\basic\Base;
use plugin\admin\app\model\Option;
use support\Db;
use support\Request;

class WithdrawController extends Base
{
    /**
     * 添加账户
     * @param Request $request
     * @return \support\Response
     */
    function addAccount(Request $request)
    {
        $truename = $request->post('truename');
        $mobile = $request->post('mobile');
        $type = $request->post('type');
        $account = $request->post('account');
        Account::create([
            'user_id' => $request->user_id,
            'truename' => $truename,
            'mobile' => $mobile,
            'type' => $type,
            'account' => $account,
        ]);
        return $this->success('成功');
    }

    /**
     * 获取账户列表
     * @param Request $request
     * @return \support\Response
     */
    function getAccountList(Request $request)
    {
        $list = Account::where('user_id', $request->user_id)->orderBy('id', 'desc')->get();
        return $this->success('成功', $list);
    }

    /**
     * 账户编辑
     * @param Request $request
     * @return \support\Response
     * @throws \Throwable
     */
    function editAccount(Request $request)
    {
        $id = $request->post('id');
        $truename = $request->post('truename');
        $mobile = $request->post('mobile');
        $type = $request->post('type');
        $account = $request->post('account');

        $row = Account::findOrFail($id);
        // 使用事务管理
        Db::connection('plugin.admin.mysql')->transaction(function () use ($request, $row, $truename, $mobile, $type, $account) {
            // 删除旧记录并创建新记录
            $row->delete();
            $newRow = Account::create([
                'user_id' => $request->user_id,
                'truename' => $truename,
                'mobile' => $mobile,
                'type' => $type,
                'account' => $account,
            ]);
        }, 3); // 设置重试次数以应对死锁等异常情况
        return $this->success('成功');
    }


    /**
     * 账户删除
     */
    function delAccount(Request $request)
    {
        $ids = $request->post('ids');
        Account::where(['user_id' => $request->user_id])->whereIn('id',$ids)->delete();
        return $this->success();
    }

    /**
     * 获取账户详情
     * @param Request $request
     * @return \support\Response]
     */
    function getAccountDetail(Request $request)
    {
        $id = $request->post('id');
        $row = Account::findOrFail($id);
        return $this->success('成功', $row);
    }

    /**
     * 获取提现列表
     * @param Request $request
     * @return \support\Response
     */
    function getWithdrawList(Request $request)
    {
        $rows = Withdraw::with(['account'])->where(['user_id' => $request->user_id])->orderBy('id', 'desc')->paginate()->items();
        return $this->success('成功', $rows);
    }

    /**
     * 提现
     * @param Request $request
     * @return \support\Response
     */
    function doWithdraw(Request $request)
    {
        $id = $request->post('id');
        $amount = $request->post('amount');
        $row = Account::findOrFail($id);
        if ($row->user_id != $request->user_id) {
            return $this->fail('无操作权限');
        }
        $user = $request->user();
        if ($user->money < $amount){
            return $this->fail('余额不足');
        }
        $config = Option::where('name', 'system_config')->value('value');
        $config = json_decode($config);
        $fee_rate = $config->platform->withdraw_rate;
        $fee_amount = bcmul($amount, $fee_rate,2);
        $into_amount = bcsub($amount, $fee_amount,2);
        User::changeMoney(-$amount, $user->id, '提现');
        Withdraw::create([
            'user_id' => $user->id,
            'account_id' => $id,
            'amount' => $amount,
            'fee_rate' => $fee_rate,
            'fee_amount' => $fee_amount,
            'into_amount' => $into_amount,
        ]);
        return $this->success('成功');
    }

    function getBalance(Request $request)
    {
        $user = $request->user();
        $wait_amount = Withdraw::where(['user_id' => $user->id, 'status' => 0])->sum('amount');
        return $this->success('成功', [
            'balance' => $user->money,
            'wait_amount' => $wait_amount
        ]);
    }

}
