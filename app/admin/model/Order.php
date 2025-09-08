<?php

namespace app\admin\model;

use Illuminate\Database\Eloquent\SoftDeletes;
use plugin\admin\app\model\Base;
use app\admin\model\User;

/**
 * 订单模型
 *
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
 * @property \Illuminate\Support\Carbon|null $finish_at 完成时间
 * @property \Illuminate\Support\Carbon|null $created_at 创建时间
 * @property \Illuminate\Support\Carbon|null $updated_at 更新时间
 * @property-read string $status_text 状态文本
 * @property-read User|null $toUser 卖家用户
 * @property-read User|null $user 买家用户
 * @property int|null $admin_id 代理商
 * @property \Illuminate\Support\Carbon|null $deleted_at 删除时间
 * @method static \Illuminate\Database\Eloquent\Builder|Order onlyTrashed()
 * @method static \Illuminate\Database\Eloquent\Builder|Order withTrashed(bool $withTrashed = true)
 * @method static \Illuminate\Database\Eloquent\Builder|Order withoutTrashed()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Order newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Order newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Order query()
 * @property-read \app\admin\model\Admin|null $admin
 * @mixin \Eloquent
 */
class Order extends Base
{
    use SoftDeletes;

    /** @var string 关联表名 */
    protected $table = 'wa_orders';

    /** @var string 主键 */
    protected $primaryKey = 'id';

    /** @var array 追加的访问器 */
    protected $appends = ['status_text'];

    /** @var array 字段类型转换 */
    protected $casts = [
        'pay_at' => 'datetime',
        'finish_at' => 'datetime',
    ];

    /** @var array 可批量赋值字段 */
    protected $fillable = [
        'admin_id',
        'user_id',
        'to_user_id',
        'ordersn',
        'service_rate',
        'kehu_rate',
        'push_rate',
        'goods_name',
        'trade_amount',
        'service_amount',
        'kehu_amount',
        'push_amount',
        'status',
        'user_pay_image',
        'platform_pay_image',
        'is_copy',
        'pay_at',
        'finish_at',
        'admin_id',
        'created_at',
        'updated_at',
    ];

    /**
     * 是否自动维护时间戳
     *
     * @var bool
     */
    public $timestamps = true;

    /**
     * 获取状态文本
     *
     * @return string
     */
    public function getStatusTextAttribute(): string
    {
        $map = [
            0 => '待付款',
            1 => '待确认',
            2 => '已确认',
        ];
        return $map[$this->status] ?? '';
    }

    /**
     * 买家用户关联
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id', 'id');
    }

    /**
     * 卖家用户关联
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function toUser()
    {
        return $this->belongsTo(User::class, 'to_user_id', 'id');
    }

    function admin()
    {
        return $this->belongsTo(Admin::class, 'admin_id', 'id');
    }
}