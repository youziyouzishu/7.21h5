<?php

namespace app\admin\model;

use Illuminate\Database\Eloquent\SoftDeletes;
use plugin\admin\app\model\Base;



/**
 * @property int $id 主键
 * @property int $user_id 用户
 * @property int $account_id 账户
 * @property int $status 状态:0=待审核,1=通过,2=驳回
 * @property string|null $reason 原因
 * @property string $amount 提现金额
 * @property float $fee_rate 手续费率
 * @property string $into_amount 到账金额
 * @property string $fee_amount 手续费
 * @property \Illuminate\Support\Carbon|null $created_at 创建时间
 * @property \Illuminate\Support\Carbon|null $updated_at 更新时间
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Withdraw newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Withdraw newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Withdraw onlyTrashed()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Withdraw query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Withdraw withTrashed(bool $withTrashed = true)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Withdraw withoutTrashed()
 * @mixin \Eloquent
 */
class Withdraw extends Base
{

    use SoftDeletes;
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'wa_withdraw';

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'id';


    protected $fillable = [
        'user_id',
        'account_id',
        'status',
        'reason',
        'amount',
        'fee_rate',
        'into_amount',
        'fee_amount',
        'created_at',
        'updated_at',
    ];

    public function getStatusTextAttribute()
    {
        return [
            0 => '待审核',
            1 => '通过',
            2 => '驳回',
        ][$this->status]?:'';
    }
    
    
    
}
