<?php

namespace app\api\controller;

use app\admin\model\Shop;
use app\admin\model\User;
use app\api\basic\Base;
use support\Request;

class IndexController extends Base
{
    protected array $noNeedLogin = ['*'];
    public function index(Request $request)
    {
        $row = User::find(7);
        $shop =  $row->shop;
        return $this->success('成功',$shop);
    }

}
