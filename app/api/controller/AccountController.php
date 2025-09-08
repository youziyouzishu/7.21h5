<?php

namespace app\api\controller;

use app\admin\model\Admin;
use app\admin\model\User;
use app\admin\model\UserLayer;
use app\api\basic\Base;
use support\Request;
use Tinywan\Jwt\JwtToken;

class AccountController extends Base
{

    protected array $noNeedLogin = ['*'];

    /**
     * 注册
     * @param Request $request
     * @return \support\Response|void
     */
    function register(Request $request)
    {

        $mobile = $request->input('mobile');
        $password = $request->input('password');
        $confirm_password = $request->input('confirm_password');
        $invite_code = $request->input('invite_code');
        $agent_invite_code = $request->input('agent_invite_code');
        if ($password != $confirm_password) {
            return $this->fail('密码不一致');
        }
        $exists = User::where('mobile', $mobile)->exists();
        if ($exists) {
            return $this->fail('手机号已存在');
        }
        if (empty($invite_code) || !$parent = User::where('invite_code', $invite_code)->first()) {
            return $this->fail('邀请码不存在');
        }
        if ($agent_invite_code && !$agent = Admin::where('invite_code', $agent_invite_code)->first()) {
            return $this->fail('代理邀请码不存在');
        }
        $user = User::create([
            'mobile' => $mobile,
            'password' => password_hash($password, PASSWORD_DEFAULT),
            'invite_code' => User::generateInviteCode(),
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

        $token = JwtToken::generateToken([
            'id' => $user->id,
            'client' => JwtToken::TOKEN_CLIENT_MOBILE
        ]);
        return $this->success('注册成功', ['user' => $user->refresh(), 'token' => $token]);
    }

    /**
     * 登陆
     * @param Request $request
     * @return \support\Response
     */
    function login(Request $request)
    {
        $mobile = $request->input('mobile');
        $password = $request->input('password');
        $user = User::where('mobile', $mobile)->first();
        if (!$user || !password_verify($password, $user->password)) {
            return $this->fail('用户名或密码错误');
        }
        if ($user->status == 1) {
            return $this->fail('用户被禁用');
        }
        $token = JwtToken::generateToken([
            'id' => $user->id,
            'client' => JwtToken::TOKEN_CLIENT_MOBILE
        ]);
        return $this->success('登录成功', ['user' => $user->refresh(), 'token' => $token]);
    }

    /**
     * 刷新token
     * @param Request $request
     * @return \support\Response
     */
    function refreshToken(Request $request)
    {
        $res = JwtToken::refreshToken();
        return $this->success('刷新成功', $res);
    }
}
