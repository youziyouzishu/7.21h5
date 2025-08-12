<?php

namespace app\admin\model;

use plugin\admin\app\model\Base;


/**
 * @property int $id 主键
 * @property int $user_id 用户
 * @property string $service_amount 服务费
 * @property string $total_amount 总金额
 * @property string $kehu_amount 客户收益
 * @property \Illuminate\Support\Carbon|null $created_at 创建时间
 * @property \Illuminate\Support\Carbon|null $updated_at 更新时间
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Report newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Report newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|Report query()
 * @property \Illuminate\Support\Carbon $date 日期
 * @mixin \Eloquent
 */
class Report extends Base
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'wa_report';

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'id';

    protected $casts = [
        'date' => 'date',
    ];

    protected $fillable = [
        'user_id',
        'date',
        'service_amount',
        'total_amount',
        'kehu_amount',
        'created_at',
        'updated_at',
    ];
    
    
    
}
