<?php

namespace app\api\controller;

use app\api\basic\Base;
use support\Request;

class IndexController extends Base
{
    protected array $noNeedLogin = ["*"];
    public function index(Request $request)
    {
    }

}
