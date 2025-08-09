<?php
/**
 * Here is your custom functions.
 */


/**
 * 生成订单编号
 * @return string
 */
if (!function_exists('generateOrderSn')) {
    function generateOrderSn()
    {
        return date('Ymd') . mb_strtoupper(uniqid());
    }
}