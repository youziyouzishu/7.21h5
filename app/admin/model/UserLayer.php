<?php

namespace app\admin\model;

use plugin\admin\app\model\Base;
use app\admin\model\User;

/**
 * Class UserLayer
 *
 * @property int $id 主键
 * @property int $user_id
 * @property int $parent_id
 * @property int $layer
 * @property \Illuminate\Support\Carbon|null $created_at 创建时间
 * @property \Illuminate\Support\Carbon|null $updated_at 更新时间
 * @property-read User|null $parent
 * @property-read User|null $user
 * @method static \Illuminate\Database\Eloquent\Builder|UserLayer newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|UserLayer newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|UserLayer query()
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
        'parent_id',
        'layer',
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
     * Get the user associated with the layer.
     */
    public function user(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(User::class, 'user_id', 'id');
    }

    /**
     * Get the parent associated with the layer.
     */
    public function parent(): \Illuminate\Database\Eloquent\Relations\BelongsTo
    {
        return $this->belongsTo(User::class, 'parent_id', 'id');
    }
}
