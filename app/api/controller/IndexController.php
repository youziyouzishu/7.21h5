<?php

namespace app\api\controller;

use app\admin\model\Shop;
use app\admin\model\User;
use app\admin\model\UserIdentity;
use app\api\basic\Base;
use support\Request;

class IndexController extends Base
{
    protected array $noNeedLogin = ["*"];
    public function index(Request $request)
    {

    }

}
