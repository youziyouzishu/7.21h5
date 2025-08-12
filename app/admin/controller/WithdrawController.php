<?php

namespace app\admin\controller;

use app\admin\model\User;
use support\Request;
use support\Response;
use app\admin\model\Withdraw;
use plugin\admin\app\controller\Crud;
use support\exception\BusinessException;

/**
 * 提现管理 
 */
class WithdrawController extends Crud
{
    
    /**
     * @var Withdraw
     */
    protected $model = null;

    /**
     * 构造函数
     * @return void
     */
    public function __construct()
    {
        $this->model = new Withdraw;
    }

    /**
     * 查询
     * @param Request $request
     * @return Response
     * @throws BusinessException
     */
    public function select(Request $request): Response
    {
        [$where, $format, $limit, $field, $order] = $this->selectInput($request);
        $query = $this->doSelect($where, $field, $order)->with(['user','account']);
        return $this->doFormat($query, $format, $limit);
    }
    
    /**
     * 浏览
     * @return Response
     */
    public function index(): Response
    {
        return view('withdraw/index');
    }

    /**
     * 插入
     * @param Request $request
     * @return Response
     * @throws BusinessException
     */
    public function insert(Request $request): Response
    {
        if ($request->method() === 'POST') {
            return parent::insert($request);
        }
        return view('withdraw/insert');
    }

    /**
     * 更新
     * @param Request $request
     * @return Response
     * @throws BusinessException
    */
    public function update(Request $request): Response
    {
        if ($request->method() === 'POST') {
            $status = $request->input('status');
            $id = $request->input('id');
            $row = $this->model->find($id);
            if ($status == 1 && $row->status == 0) {
                //提现通过
                $row->user->total_withdraw_amount += $row->amount;
                $row->user->save();
            }
            if ($status == 2 && $row->status == 0) {
                //提现拒绝
                User::changeMoney($row->amount,$row->user_id,'提现驳回');
            }

            return parent::update($request);
        }
        return view('withdraw/update');
    }

}
