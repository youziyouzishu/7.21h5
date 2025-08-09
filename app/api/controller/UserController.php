<?php

namespace app\api\controller;

use app\admin\model\Order;
use app\admin\model\Shop;
use app\admin\model\Subscribe;
use app\admin\model\User;
use app\admin\model\UserIdentity;
use app\admin\model\UserLayer;
use app\api\basic\Base;
use Carbon\Carbon;
use support\Request;
use Tinywan\Jwt\Exception\JwtRefreshTokenExpiredException;

class UserController extends Base
{
    /**
     * 获取个人信息
     * @param Request $request
     * @return \support\Response
     */
    function getUserInfo(Request $request)
    {
        $user_id = $request->post('user_id');
        if (!empty($user_id)) {
            $request->user_id = $user_id;
        }
        $row = User::find($request->user_id);
        if (empty($row)) {
            throw new JwtRefreshTokenExpiredException();
        }
        return $this->success('成功', $row);
    }

    /**
     * 修改个人信息
     * @param Request $request
     * @return \support\Response
     */
    function editUserInfo(Request $request)
    {
        $param = $request->post();
        $fields = ['nickname', 'avatar', 'sex', 'birthday', 'password'];
        foreach ($param as $key => $value) {
            if (!in_array($key, $fields)) {
                unset($param[$key]);
            }
            if ($key == 'sex') {
                $param[$key] = strval($value);
            }
            if ($key == 'password') {
                $param[$key] = password_hash($value, PASSWORD_DEFAULT);
            }
        }
        $row = User::find($request->user_id);
        $row->fill($param);
        $row->save();
        return $this->success('成功');
    }

    function getUserIdentity(Request $request)
    {
        $row = User::find($request->user_id);
        return $this->success('成功', $row->userIdentity());
    }

    function getUserShop(Request $request)
    {
        $row = User::find($request->user_id);
        return $this->success('成功', $row->shop());
    }

    function editUserIdentity(Request $request)
    {
        $param = $request->post();
        $row = UserIdentity::findOrFail($param['id']);
        $row->fill($param);
        $row->save();
    }

    function editUserShop(Request $request)
    {
        $param = $request->post();
        $row = Shop::findOrFail($param['id']);
        $row->fill($param);
        $row->save();
    }

    /**
     * 申请个人认证
     * @param Request $request
     * @return \support\Response
     */
    function insertUserIdentity(Request $request)
    {
        $param = $request->post();
        $row = UserIdentity::create($param);
        return $this->success('成功', $row);
    }

    /**
     * 申请店铺认证
     * @param Request $request
     * @return \support\Response
     */
    function insertShop(Request $request)
    {
        $param = $request->post();
        $row = Shop::create($param);
        return $this->success('成功', $row);
    }

    /**
     * 预约订单
     * @param Request $request
     * @return \support\Response
     */
    function doSubscribe(Request $request)
    {
        $user = User::find($request->user_id);
        if ($user->user_identity_status != 2) {
            return $this->fail('请先完成个人认证');
        }
        $name = $request->input('name');
        $amount = $request->input('amount');
        $date = $request->input('date');
        $row = Subscribe::create([
            'name' => $name,
            'amount' => $amount,
            'date' => $date,
        ]);
        return $this->success('成功', $row);
    }

    /**
     * 获取预约列表
     * @param Request $request
     * @return \support\Response
     */
    function getSubscribeList(Request $request)
    {
        $status = $request->input('status');#状态 1待审核  2已审核
        $list = Subscribe::where(['user_id' => $request->user_id])
            ->when($status, function ($query) use ($status) {
                if ($status == 1) {
                    $query->where('status', 0);
                } else {
                    $query->where('status', 1);
                }
            })
            ->orderBy('id', 'desc')
            ->paginate()
            ->items();
        return $this->success('成功', $list);
    }

    /**
     * 获取数据优化列表
     * @param Request $request
     * @return \support\Response
     */
    function getOrderList(Request $request)
    {
        $status = $request->input('status');#状态 1待付款  2待确认  3已确认
        $list = Order::where(function ($query) use ($request) {
            $query->where('user_id', $request->user_id)->orWhere('to_user_id', $request->user_id);
        })
            ->when($status, function ($query) use ($status) {
                if ($status == 1) {
                    $query->where('status', 0);
                } elseif ($status == 2) {
                    $query->where('status', 1);
                } else {
                    $query->where('status', 2);
                }
            })
            ->orderBy('id', 'desc')
            ->paginate()
            ->items();
        return $this->success('成功', $list);
    }

    /**
     * 获取数据优化详情
     * @param Request $request
     * @return \support\Response
     */
    function getOrderDetail(Request $request)
    {
        $id = $request->input('id');
        $row = Order::findOrFail($id);
        return $this->success('成功', $row);
    }

    /**
     * 数据优化支付
     * @param Request $request
     * @return \support\Response
     */
    function orderPay(Request $request)
    {
        $id = $request->input('id');
        $user_pay_image = $request->input('user_pay_image');
        $platform_pay_image = $request->input('platform_pay_image');
        $row = Order::findOrFail($id);
        if ($row->status != 0) {
            return $this->fail('订单已支付');
        }
        if ($row->user_id != $request->user_id) {
            return $this->fail('无权限');
        }
        $row->status = 1;
        $row->user_pay_image = $user_pay_image;
        $row->platform_pay_image = $platform_pay_image;
        $row->pay_at = Carbon::now();
        $row->save();
        return $this->success('成功');
    }

    /**
     * 团队列表
     * @param Request $request
     * @return \support\Response
     */
    function getTeamList(Request $request)
    {
        $user = $request->user();
        $team_count = UserLayer::where('parent_id', $user->id)->count();
        $direct_count = UserLayer::where('parent_id', $user->id)->where('layer', 1)->count();
        $team_ids = UserLayer::where('parent_id', $user->id)->pluck('user_id');
        $today_team_amount = 0;#今日团队金额
        $today_team_serrvice_amount = 0;#今日团队服务费
        Order::whereIn('to_user_id', $team_ids)
            ->whereDate('finish_at', Carbon::today())
            ->each(function ($item) use (&$today_team_amount, &$today_team_serrvice_amount) {
                $today_team_amount += $item->trade_amount + $item->kehu_amount;
                $today_team_serrvice_amount += $item->service_amount;
            });
        $team_list = User::whereIn('id', $team_ids)->each(function ($item) {
            $item->team_count = UserLayer::where('parent_id', $item->id)->count();
        });
        return $this->success('成功', [
            'team_count' => $team_count,
            'direct_count' => $direct_count,
            'today_team_amount' => $today_team_amount,
            'today_team_serrvice_amount' => $today_team_serrvice_amount,
            'team_list' => $team_list,
        ]);
    }

    /**
     * 直推列表
     * @param Request $request
     * @return \support\Response
     */
    function getDirectList(Request $request)
    {
        $user = $request->user();
        $team_ids = UserLayer::where('parent_id', $user->id)->where('layer', 1)->pluck('user_id');
        $team_list = User::whereIn('id', $team_ids)->each(function ($item) {
            $item->team_count = UserLayer::where('parent_id', $item->id)->count();
        });
        return $this->success('成功', $team_list);
    }


}
