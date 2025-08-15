<?php

namespace app\admin\model;

use plugin\admin\app\model\Base;

/**
 * Class Admin
 *
 * @property integer $id ID(主键)
 * @property string $username 用户名
 * @property string $nickname 昵称
 * @property string $password 密码
 * @property string $avatar 头像
 * @property string $email 邮箱
 * @property string $mobile 手机
 * @property string $created_at 创建时间
 * @property string $updated_at 更新时间
 * @property string $login_at 登录时间
 * @property integer $status 禁用
 * @property string $zfb_sj_qr 支付宝商家收款码
 * @property string $zfb_yc_qr 支付宝远程收款码
 * @property string $wx_sj_qr 微信收款码
 * @property string $bank_account 银行卡号
 * @property string $bank_name 银行名称
 * @method static \Illuminate\Database\Eloquent\Builder|Admin newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Admin newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Admin query()
 * @mixin \Eloquent
 */
class Admin extends Base
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'wa_admins';

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
        'username',
        'nickname',
        'password',
        'avatar',
        'email',
        'mobile',
        'login_at',
        'status',
        'zfb_sj_qr',
        'zfb_yc_qr',
        'wx_sj_qr',
        'bank_account',
        'bank_name',
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