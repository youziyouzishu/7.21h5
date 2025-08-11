<?php

namespace app\admin\model;

use plugin\admin\app\model\Base;


/**
 * @property int $id 主键
 * @property int $user_id 用户
 * @property string $name 姓名
 * @property string $amount 金额
 * @property string $date 日期
 * @property int $status 状态:0=待审核,1=已审核
 * @property \Illuminate\Support\Carbon|null $created_at 创建时间
 * @property \Illuminate\Support\Carbon|null $updated_at 更新时间
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Subscribe newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Subscribe newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Subscribe query()
 * @property-read mixed $status_text
 * @mixin \Eloquent
 */
class Subscribe extends Base
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'wa_subscribe';

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'id';

    protected $fillable = [
        'user_id',
        'name',
        'amount',
        'date',
        'status',
        'created_at',
        'updated_at',
    ];

    protected $appends = [
        'status_text',
    ];

    public function getStatusTextAttribute()
    {
        return [
            0 => '待审核',
            1 => '已审核',
        ][$this->status]??'';
    }
    
    
    
}
