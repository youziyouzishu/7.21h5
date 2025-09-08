<?php

namespace plugin\admin\app\controller;

use app\admin\model\Admin;
use app\admin\model\UserLayer;
use plugin\admin\app\model\User;
use support\exception\BusinessException;
use support\Request;
use support\Response;
use Throwable;

/**
 * 用户管理 
 */
class UserController extends Crud
{
    
    /**
     * @var User
     */
    protected $model = null;

    /**
     * 构造函数
     * @return void
     */
    public function __construct()
    {
        $this->model = new \app\admin\model\User;
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
        $query = $this->doSelect($where, $field, $order);

        if (in_array(3, admin('roles'))) {
            $query->where('admin_id', admin_id());
        }
        return $this->doFormat($query, $format, $limit);
    }

    /**
     * 浏览
     * @return Response
     * @throws Throwable
     */
    public function index(): Response
    {
        return raw_view('user/index');
    }

    /**
     * 插入
     * @param Request $request
     * @return Response
     * @throws BusinessException|Throwable
     */
    public function insert(Request $request): Response
    {
        if ($request->method() === 'POST') {
            $mobile = $request->input('mobile');
            $password = $request->input('password');
            $invite_code = $request->input('invited_code');
            $agent_invite_code = $request->input('agent_invited_code');

            $exists = User::where('mobile', $mobile)->exists();
            if ($exists) {
                return $this->fail('手机号已存在');
            }
            if (empty($invite_code) || !$parent = User::where('invite_code', $invite_code)->first()) {
                return $this->fail('邀请码不存在');
            }
            if ($agent_invite_code || !$agent = Admin::where('invite_code', $agent_invite_code)->first()) {
                return $this->fail('代理邀请码不存在');
            }
            $user = \app\admin\model\User::create([
                'mobile' => $mobile,
                'password' => password_hash($password, PASSWORD_DEFAULT),
                'invite_code' => \app\admin\model\User::generateInviteCode(),
                'parent_id' => $parent->id,
                'admin_id' => $agent->id ,
                'avatar' => '/app/admin/avatar.png'
            ]);

            // 增加直推关系
            UserLayer::create([
                'user_id' => $user->id,
                'parent_id' => $parent->id,
                'layer' => 1
            ]);
            UserLayer::where('user_id', $parent->id)->get()->each(function (UserLayer $item) use ($user) {
                UserLayer::create([
                    'user_id' => $user->id,
                    'parent_id' => $item->parent_id,
                    'layer' => $item->layer + 1
                ]);
            });
            return $this->success('注册成功');
        }
        return raw_view('user/insert');
    }

    /**
     * 更新
     * @param Request $request
     * @return Response
     * @throws BusinessException|Throwable
     */
    public function update(Request $request): Response
    {
        if ($request->method() === 'POST') {
            $id = $request->input('id');
            $money = $request->input('money');
            if (isset($money)) {
                \app\admin\model\User::changeMoney($money, $id, '会员余额变动');
                return $this->json(0);
            }
            return parent::update($request);
        }
        return raw_view('user/update');
    }

}
