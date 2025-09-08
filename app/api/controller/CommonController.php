<?php

namespace app\api\controller;

use app\admin\model\Area;
use app\admin\model\Banner;
use app\admin\model\Notice;
use app\api\basic\Base;
use plugin\admin\app\model\Option;
use support\Request;

class CommonController extends Base
{
    protected array $noNeedLogin = ['getBannerList'];

    /**
     * 获取轮播图
     * @param Request $request
     * @return \support\Response
     */
    function getBannerList(Request $request)
    {
        $rows = Banner::latest('weight')->get();
        return $this->success('请求成功', $rows);
    }

    /**
     * 获取配置项
     * @param Request $request
     * @return \support\Response
     */
    function getConfig(Request $request)
    {
        $config = Option::where('name', 'system_config')->value('value');
        $result = json_decode($config);
        $user = $request->user();
        if ($user->admin_id){
            $admin = $user->admin;
            $result->platform->zfb_sj_qr = $admin->zfb_sj_qr;
            $result->platform->zfb_yc_qr = $admin->zfb_yc_qr;
            $result->platform->wx_sj_qr = $admin->wx_sj_qr;
            $result->platform->bank_account = $admin->bank_account;
            $result->platform->bank_name = $admin->bank_name;
        }
        return $this->success('成功',$result);
    }




}
