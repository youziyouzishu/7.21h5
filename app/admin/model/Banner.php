<?php

namespace app\admin\model;

use plugin\admin\app\model\Base;

/**
 * Class Banner
 *
 * @property int $id
 * @property string|null $image 图片地址
 * @property string|null $url 跳转链接
 * @property int $sort 排序
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @method static \Illuminate\Database\Eloquent\Builder|Banner newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Banner newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Banner query()
 * @mixin \Eloquent
 */
class Banner extends Base
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'wa_banner';

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
        'image',
        'url',
        'sort',
        'created_at',
        'updated_at',
    ];

    /**
     * 是否自动维护时间戳
     *
     * @var bool
     */
    public $timestamps = true;
}