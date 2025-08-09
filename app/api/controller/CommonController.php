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
    protected array $noNeedLogin = ['*'];

    #获取省
    function getProvince(Request $request)
    {
        $row = Area::where('level', 1)->get();
        return $this->success('请求成功', $row);
    }

    #获取城市
    function getCity(Request $request)
    {
        $pid = $request->post('pid');
        $row = Area::where('level', 2)->where('pid', $pid)->get();
        return $this->success('请求成功', $row);
    }

    #获取区
    function getDistrict(Request $request)
    {
        $pid = $request->post('pid');
        $row = Area::where('level', 3)->where('pid', $pid)->get();
        return $this->success('请求成功', $row);
    }

    #根据经纬度获取市
    function getCityFromLngLat(Request $request)
    {
        $lng = $request->post('lng');
        $lat = $request->post('lat');
        $row = Area::getCityFromLngLat($lng, $lat);
        return $this->success('请求成功', $row);
    }

    #根据经纬度获取区
    function getDistrictFromLngLat(Request $request)
    {
        $lng = $request->post('lng');
        $lat = $request->post('lat');
        $row = Area::getDistrictFromLngLat($lng, $lat);
        return $this->success('请求成功', $row);
    }

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
     * 公告栏
     * @param Request $request
     * @return \support\Response
     */
    function getNoticeList(Request $request)
    {
        $row = Notice::orderByDesc('id')->first();
        return $this->success('请求成功', $row);
    }

    /**
     * 获取配置项
     * @param Request $request
     * @return \support\Response
     */
    function getConfig(Request $request)
    {
        $config = Option::where('name', 'system_config')->value('value');
        return $this->success('成功',json_decode($config));
    }




}
