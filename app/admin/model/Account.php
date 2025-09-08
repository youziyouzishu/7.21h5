<?php

namespace app\admin\model;

use Illuminate\Database\Eloquent\SoftDeletes;
use plugin\admin\app\model\Base;

/**
 * Class Account
 *
 * @property int $id                 主键
 * @property int $user_id            用户
 * @property string $truename       真实姓名
 * @property string $mobile         手机号
 * @property int $type              类型:1=银行卡,2=微信,3=支付宝
 * @property string $account        账户
 * @property \Illuminate\Support\Carbon|null $created_at  创建时间
 * @property \Illuminate\Support\Carbon|null $updated_at  更新时间
 * @property \Illuminate\Support\Carbon|null $deleted_at  删除时间
 * @property-read mixed $type_text
 * @property-read \app\admin\model\User|null $user
 * @method static \Illuminate\Database\Eloquent\Builder|Account newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Account newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Account query()
 * @method static \Illuminate\Database\Eloquent\Builder|Account onlyTrashed()
 * @method static \Illuminate\Database\Eloquent\Builder|Account withTrashed(bool $withTrashed = true)
 * @method static \Illuminate\Database\Eloquent\Builder|Account withoutTrashed()
 * @property int|null $admin_id 代理商
 * @mixin \Eloquent
 */
class Account extends Base
{
    use SoftDeletes;

    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'wa_account';

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'id';


    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'user_id',
        'truename',
        'mobile',
        'type',
        'account',
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
        'deleted_at',
    ];

    /**
     * The accessors to append to the model's array form.
     *
     * @var array
     */
    protected $appends = [
        'type_text',
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
     * 获取类型文本
     *
     * @return string
     */
    public function getTypeTextAttribute(): string
    {
        $map = [
            1 => '银行卡',
            2 => '微信',
            3 => '支付宝',
        ];

        return $map[$this->type] ?? '';
    }
}
