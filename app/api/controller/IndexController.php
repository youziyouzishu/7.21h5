<?php

namespace app\api\controller;

use app\admin\model\Shop;
use app\api\basic\Base;
use support\Request;

class IndexController extends Base
{
    protected array $noNeedLogin = ['*'];
    public function index(Request $request)
    {

        $param['user_id'] = 1;
        $param['name'] = '1111';
        $param['image'] = '1111';
        $param['tb_address'] = '1111';
        $param['ali_address'] = '1111';
        $param['xy_address'] = '1111';
        $param['tm_address'] = '1111';
        $param['zfb_account'] = '1111';
        $param['zfb_yc_qr'] = '1111';
        $param['zfb_sj_qr'] = '1111';
        $param['wx_sj_qr'] = '1111';
        $param['bank_account'] = '1111';
        $param['bank_name'] = '1111';
        $row = Shop::create($param);
        return $this->success('成功', $row);
    }

}
