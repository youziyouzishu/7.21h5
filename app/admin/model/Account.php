<?php

namespace app\admin\model;

use Illuminate\Database\Eloquent\SoftDeletes;
use plugin\admin\app\model\Base;


/**
 * @property int $id 主键
 * @property int $user_id 用户
 * @property string $truename 真实姓名
 * @property string $mobile 手机号
 * @property int $type 类型:1=银行卡,2=微信,3=支付宝
 * @property string $account 账户
 * @property \Illuminate\Support\Carbon|null $created_at 创建时间
 * @property \Illuminate\Support\Carbon|null $updated_at 更新时间
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Account newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Account newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Account query()
 * @property \Illuminate\Support\Carbon|null $deleted_at 删除时间
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Account onlyTrashed()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Account withTrashed(bool $withTrashed = true)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Account withoutTrashed()
 * @property-read mixed $type_text
 * @property-read \app\admin\model\User|null $user
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

    protected $fillable = [
        'user_id',
        'truename',
        'mobile',
        'type',
        'account',
        'created_at',
        'updated_at',
    ];

    protected $appends = [
        'type_text',
    ];

    function user()
    {
        return $this->belongsTo(User::class, 'user_id', 'id');
    }

    public function getTypeTextAttribute()
    {
        return [
            1 => '银行卡',
            2 => '微信',
            3 => '支付宝',
        ][$this->type]?:'';
    }
    
    
}
