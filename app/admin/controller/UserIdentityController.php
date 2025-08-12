<?php

namespace app\admin\controller;

use app\admin\model\User;
use support\Request;
use support\Response;
use app\admin\model\UserIdentity;
use plugin\admin\app\controller\Crud;
use support\exception\BusinessException;

/**
 * 用户认证 
 */
class UserIdentityController extends Crud
{
    
    /**
     * @var UserIdentity
     */
    protected $model = null;

    /**
     * 构造函数
     * @return void
     */
    public function __construct()
    {
        $this->model = new UserIdentity;
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
        $query = $this->doSelect($where, $field, $order)->with(['user']);
        return $this->doFormat($query, $format, $limit);
    }
    
    /**
     * 浏览
     * @return Response
     */
    public function index(): Response
    {
        return view('user-identity/index');
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
        return view('user-identity/insert');
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
            $id = $request->input('id');
            $name = $request->input('name');
            $row = UserIdentity::findOrFail($id);
            $row->user->nickname = $name;
            $row->user->save();
            return parent::update($request);
        }
        return view('user-identity/update');
    }

}
