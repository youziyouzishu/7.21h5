<?php

namespace app\admin\model;

use plugin\admin\app\model\Base;

/**
 * @property integer $id 主键(主键)
 * @property integer $user_id 用户
 * @property integer $account_id 账户
 * @property string $amount 提现金额
 * @property float $fee_rate 手续费率
 * @property string $fee_amount 手续费
 * @property string $into_amount 到账金额
 * @property integer $status 状态:0=待审核,1=通过,2=驳回
 * @property string $reason 原因
 * @property string $created_at 创建时间
 * @property string $updated_at 更新时间
 * @property-read mixed $status_text
 * @property-read \app\admin\model\User|null $user
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Withdraw newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Withdraw newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Withdraw query()
 * @mixin \Eloquent
 */
class Withdraw extends Base
{
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
        'amount',
        'fee_rate',
        'fee_amount',
        'into_amount',
        'status',
        'reason',
        'created_at',
        'updated_at'
    ];

    protected $appends = [
        'status_text'
    ];

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id', 'id');
    }

    public function getStatusTextAttribute()
    {
        return [
            0 => '待审核',
            1 => '通过',
            2 => '驳回',
        ][$this->status]?:'';
    }

    
    
    
}
