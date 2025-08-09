<?php

namespace app\admin\model;


use plugin\admin\app\model\Base;


/**
 * @property int $id 主键
 * @property int $user_id
 * @property int $parent_id
 * @property int $layer
 * @property \Illuminate\Support\Carbon|null $created_at 创建时间
 * @property \Illuminate\Support\Carbon|null $updated_at 更新时间
 * @property-read \app\admin\model\User|null $parent
 * @property-read \app\admin\model\User|null $user
 * @method static \Illuminate\Database\Eloquent\Builder<static>|UserLayer newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|UserLayer newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|UserLayer query()
 * @mixin \Eloquent
 */
class UserLayer extends Base
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'wa_user_layer';

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'id';

    protected $fillable = [
        'user_id', 'parent_id', 'layer'
    ];

    function user()
    {
        return $this->belongsTo(User::class, 'user_id', 'id');
    }

    function parent()
    {
        return $this->belongsTo(User::class, 'parent_id', 'id');
    }



}
