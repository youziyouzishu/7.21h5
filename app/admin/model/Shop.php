<?php

namespace app\admin\model;

use Illuminate\Database\Eloquent\SoftDeletes;
use plugin\admin\app\model\Base;


/**
 * @property int $id 主键
 * @property int $user_id 用户
 * @property string $name 姓名
 * @property string $image 营业执照
 * @property string $tb_address 淘宝店铺地址
 * @property string $ali_address 阿里店铺地址
 * @property string $xy_address 闲鱼店铺地址
 * @property string $tm_address 天猫店铺地址
 * @property string $zfb_account 支付宝账号
 * @property string $zfb_yc_qr 支付宝远程收款码
 * @property string $zfb_sj_qr 支付宝商家收款码
 * @property string $wx_sj_qr 微信商家收款码
 * @property string $bank_account 银行卡号
 * @property string $bank_name 银行名称
 * @property int $status 状态:0=待审核,1=通过,2=拒绝
 * @property string|null $reason 原因
 * @property \Illuminate\Support\Carbon|null $created_at 创建时间
 * @property \Illuminate\Support\Carbon|null $updated_at 更新时间
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Shop newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Shop newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Shop query()
 * @property-read mixed $status_text
 * @property-read \app\admin\model\User|null $user
 * @property \Illuminate\Support\Carbon|null $deleted_at 删除时间
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Shop onlyTrashed()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Shop withTrashed(bool $withTrashed = true)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Shop withoutTrashed()
 * @mixin \Eloquent
 */
class Shop extends Base
{
    use SoftDeletes;
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'wa_shop';

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'id';

    protected $appends = [
        'status_text'
    ];

    protected $fillable = [
        'user_id',
        'name',
        'image',
        'tb_address',
        'ali_address',
        'xy_address',
        'tm_address',
        'zfb_account',
        'zfb_yc_qr',
        'zfb_sj_qr',
        'wx_sj_qr',
        'bank_account',
        'bank_name',
        'status',
        'reason',
        'created_at',
        'updated_at',
    ];

    public function getStatusTextAttribute()
    {
        return [
            0 => '待审核',
            1 => '通过',
            2 => '拒绝',
        ][$this->status]??'';
    }

    function user()
    {
        return $this->belongsTo(User::class, 'user_id', 'id');
    }




}
