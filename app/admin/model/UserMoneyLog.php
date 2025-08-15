<?php

namespace app\admin\model;

use plugin\admin\app\model\Base;

/**
 * Class UserMoneyLog
 *
 * @property int $id 主键
 * @property int $user_id 用户
 * @property string $money 金额
 * @property string $before 变更前
 * @property string $after 变更后
 * @property string $memo 备注
 * @property \Illuminate\Support\Carbon|null $created_at 创建时间
 * @property \Illuminate\Support\Carbon|null $updated_at 更新时间
 * @property-read \app\admin\model\User|null $user
 * @method static \Illuminate\Database\Eloquent\Builder|UserMoneyLog newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|UserMoneyLog newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|UserMoneyLog query()
 * @mixin \Eloquent
 */
class UserMoneyLog extends Base
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'wa_user_money_log';

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
        'money',
        'before',
        'after',
        'memo',
        'created_at',
        'updated_at',
    ];

    /**
     * The attributes that should be mutated to dates.
     *
     * @var array
     */
    protected $dates = [
        'created_at',
        'updated_at',
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
}