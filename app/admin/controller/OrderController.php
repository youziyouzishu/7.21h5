<?php

namespace app\admin\controller;

use app\admin\model\User;
use Carbon\Carbon;
use support\Request;
use support\Response;
use app\admin\model\Order;
use plugin\admin\app\controller\Crud;
use support\exception\BusinessException;

/**
 * 数据优化管理 
 */
class OrderController extends Crud
{
    
    /**
     * @var Order
     */
    protected $model = null;

    /**
     * 构造函数
     * @return void
     */
    public function __construct()
    {
        $this->model = new Order;
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
        $query = $this->doSelect($where, $field, $order)->with(['user','toUser']);
        if (in_array(3, admin('roles'))) {
            $query->where('admin_id', admin_id());
        }
        return $this->doFormat($query, $format, $limit);
    }

    /**
     * 浏览
     * @return Response
     */
    public function index(): Response
    {
        return view('order/index');
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
            $service_rate = $request->post('service_rate');
            $kehu_rate = $request->post('kehu_rate');
            $push_rate = $request->post('push_rate');
            $trade_amount = $request->post('trade_amount');
            $user_id = $request->post('user_id');
            $user = User::findOrFail($user_id);
            $request->setParams('post',[
                'admin_id' => $user->admin_id,
                'ordersn' => generateOrderSn(),
                'service_amount' => intval(bcmul($trade_amount, $service_rate,2)),
                'kehu_amount' => intval(bcmul($trade_amount, $kehu_rate,2)),
                'push_amount' => intval(bcmul($trade_amount, $push_rate,2)),
            ]);
            return parent::insert($request);
        }
        return view('order/insert');
    }

    /**
     * 复制
     * @param Request $request
     * @return Response
     * @throws BusinessException
     */
    public function copy(Request $request): Response
    {
        if ($request->method() === 'POST') {
            $id = $request->input('id');
            $row = Order::findOrFail($id);

            $trade_amount = $row->trade_amount + $row->service_amount + $row->kehu_amount;
            $request->setParams('post',[
                'ordersn' => generateOrderSn(),
                'service_amount' => intval(bcmul($trade_amount, $row->service_rate,2)),
                'kehu_amount' => intval(bcmul($trade_amount, $row->kehu_rate,2)),
                'push_amount' => intval(bcmul($trade_amount, $row->push_rate,2)),
                'kehu_rate' =>  $row->kehu_rate,
                'push_rate' => $row->push_rate,
                'service_rate' => $row->service_rate,
                'goods_name' => $row->goods_name,
                'trade_amount' => $trade_amount
            ]);
            $row->is_copy = 1;
            $row->save();
            return parent::insert($request);
        }
        return view('order/copy');
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
            $id = $request->post('id');
            $status = $request->post('status');
            $row = Order::findOrFail($id);
            if ($row->status == 1 && $status == 2){
                //后台确认  给这个用户上级反直推收益
                User::changeMoney($row->push_amount,$row->user->parent_id,'直推收益');
                //后台确认  给买家增加服务费
                $row->user->total_service_amount += $row->service_amount;
                //后台确认  给买家增加总金额
                $row->user->total_amount += $row->trade_amount + $row->kehu_amount;
                //后台确认  总订单收益
                $row->user->total_trade_amount += $row->kehu_amount;
                //后台确认  总直推金额
                $row->user->parent->total_push_amount += $row->push_amount;
                $row->user->parent->save();
                $row->user->save();
                //后台确认 给代理商增加数据
                if ($row->user->admin){
                    $row->user->admin->total_amount = $row->trade_amount;
                    $row->user->admin->save();
                }
                $request->setParams('post',[
                    'finish_at' => Carbon::now()
                ]);
            }
            return parent::update($request);
        }
        return view('order/update');
    }

}
