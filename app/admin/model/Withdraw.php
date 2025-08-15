<?php

namespace app\admin\model;

use plugin\admin\app\model\Base;

/**
 * Class Withdraw
 *
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
 * @property-read \app\admin\model\Account|null $account
 * @method static \Illuminate\Database\Eloquent\Builder|Withdraw newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Withdraw newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Withdraw query()
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

    /**
     * 是否自动维护时间戳
     *
     * @var bool
     */
    public $timestamps = true;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
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
        'updated_at',
    ];

    /**
     * The accessors to append to the model's array form.
     *
     * @var array
     */
    protected $appends = [
        'status_text'
    ];

    /**
     * 关联用户
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id', 'id');
    }

    /**
     * 关联账户
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function account()
    {
        return $this->belongsTo(Account::class, 'account_id', 'id');
    }

    /**
     * 获取状态文本
     *
     * @return string
     */
    public function getStatusTextAttribute(): string
    {
        $map = [
            0 => '待审核',
            1 => '通过',
            2 => '驳回',
        ];

        return $map[$this->status] ?? '';
    }
}