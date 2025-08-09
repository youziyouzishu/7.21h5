<?php

namespace app\admin\model;

use plugin\admin\app\model\Base;


/**
 * @property int $id 主键
 * @property int $user_id 买家
 * @property int $to_user_id 卖家
 * @property string $ordersn 订单编号
 * @property float $service_rate 服务费率
 * @property float $kehu_rate 客户费率
 * @property float $push_rate 直推费率
 * @property string $goods_name 商品名称
 * @property string $trade_amount 交易金额
 * @property string $service_amount 服务费
 * @property string $kehu_amount 客户金额
 * @property string $push_amount 直推收益
 * @property int $status 状态:0=待付款,1=待确认,2=已确认
 * @property string|null $user_pay_image 用户支付凭证
 * @property string|null $platform_pay_image 平台支付凭证
 * @property int $is_copy 是否复制:0=否,1=是
 * @property \Illuminate\Support\Carbon|null $pay_at 支付时间
 * @property string|null $finish_at 完成时间
 * @property \Illuminate\Support\Carbon|null $created_at 创建时间
 * @property \Illuminate\Support\Carbon|null $updated_at 更新时间
 * @property-read mixed $status_text
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Order newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Order newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Order query()
 * @mixin \Eloquent
 */
class Order extends Base
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'wa_orders';

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'id';

    protected $appends = ['status_text'];

    protected $casts = [
        'pay_at' => 'datetime',
    ];


    public function getStatusTextAttribute()
    {
        return [
            0 => '待付款',
            1 => '待确认',
            2 => '已确认',
        ][$this->status]?:'';
    }




}
