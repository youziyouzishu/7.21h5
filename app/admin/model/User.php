<?php

namespace app\admin\model;


use Carbon\Carbon;
use Illuminate\Contracts\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletes;
use plugin\admin\app\model\Base;
use support\Db;


/**
 * @property int $id 主键
 * @property string $username 用户名
 * @property string $nickname 昵称
 * @property string $password 密码
 * @property string $sex 性别
 * @property string|null $avatar 头像
 * @property string|null $email 邮箱
 * @property string|null $mobile 手机
 * @property int $level 等级
 * @property string|null $birthday 生日
 * @property string $money 余额(元)
 * @property int $score 积分
 * @property \Illuminate\Support\Carbon|null $last_time 登录时间
 * @property string|null $last_ip 登录ip
 * @property \Illuminate\Support\Carbon|null $join_time 注册时间
 * @property string|null $join_ip 注册ip
 * @property string|null $token token
 * @property \Illuminate\Support\Carbon|null $created_at 创建时间
 * @property \Illuminate\Support\Carbon|null $updated_at 更新时间
 * @property int $role 角色
 * @property int $status 禁用
 * @method static \Illuminate\Database\Eloquent\Builder<static>|User newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|User newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|User onlyTrashed()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|User query()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|User withTrashed(bool $withTrashed = true)
 * @method static \Illuminate\Database\Eloquent\Builder<static>|User withoutTrashed()
 * @property string $invite_code 邀请码
 * @property int|null $parent_id 上级
 * @property-read \app\admin\model\Shop|null $shop
 * @property-read \app\admin\model\UserIdentity|null $userIdentity
 * @property-read mixed $shop_status
 * @property-read mixed $user_identity_status
 * @property string $total_service_amount 总服务费
 * @property string $total_amount 总金额(交易金额+客户收益)
 * @property \Illuminate\Support\Carbon|null $deleted_at 删除时间
 * @property string $total_trade_amount 总交易金额
 * @property string $total_withdraw_amount 总提现金额
 * @property string $total_push_amount 累计直推金额
 * @property-read User|null $parent
 * @property-read \Illuminate\Database\Eloquent\Collection<int, \app\admin\model\Report> $report
 * @property-read \Illuminate\Database\Eloquent\Collection<int, User> $children
 * @property-read \Illuminate\Database\Eloquent\Collection<int, \app\admin\model\Order> $allChildrenOrders
 * @property-read \Illuminate\Database\Eloquent\Collection<int, \app\admin\model\Order> $orders
 * @property int|null $admin_id 代理商
 * @mixin \Eloquent
 */
class User extends Base
{
    use SoftDeletes;
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'wa_users';


    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'id';

    protected $casts = [
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
        'last_time' => 'datetime',
        'join_time' => 'datetime',
    ];

    protected $fillable = [
        'username',
        'nickname',
        'password',
        'sex',
        'avatar',
        'email',
        'mobile',
        'level',
        'birthday',
        'money',
        'score',
        'last_time',
        'last_ip',
        'join_time',
        'join_ip',
        'token',
        'role',
        'status',
        'invite_code',
        'parent_id',
        'total_service_amount',
        'total_amount',
        'total_trade_amount',
        'created_at',
        'updated_at',
    ];

    /**
     * 是否自动维护时间戳
     *
     * @var bool
     */
    public $timestamps = true;

    public static function changeMoney($money, $user_id, $memo)
    {
        Db::connection('plugin.admin.mysql')->beginTransaction();
        try {
            $user = self::lockForUpdate()->find($user_id);
            if ($user && $money != 0) {
                $before = $user->money;
                $after = function_exists('bcadd') ? bcadd($user->money, $money, 2) : $user->money + $money;
                //更新会员信息
                $user->money = $after;
                $user->save();
                //写入日志
                UserMoneyLog::create(['user_id' => $user_id, 'money' => $money, 'before' => $before, 'after' => $after, 'memo' => $memo]);
            }
            Db::connection('plugin.admin.mysql')->commit();
        } catch (\Throwable $e) {
            Db::connection('plugin.admin.mysql')->rollback();
            throw $e;
        }
    }

    /**
     * 生成邀请二维码
     * @return string
     */
    public static function generateInviteCode()
    {
        do {
            $invite_code = mt_rand(10000, 99999);
        } while (self::where(['invite_code' => $invite_code])->exists());
        return strval($invite_code);
    }

    public function getUserIdentityStatusAttribute()
    {
        $userIdentity =  $this->userIdentity;
        if ($userIdentity) {
            if ($userIdentity->status == 0){
                return 1;//待审核
            }
            if ($userIdentity->status == 1){
                return 2;//已通过
            }
            if ($userIdentity->status == 2){
                return 3;//驳回
            }
        }
        return 0;
    }

    public function getShopStatusAttribute()
    {
        $shop =  $this->shop;
        if ($shop) {
            if ($shop->status == 0){
                return 1;//待审核
            }
            if ($shop->status == 1){
                return 2;//已通过
            }
            if ($shop->status == 2){
                return 3;//驳回
            }
        }
        return 0;
    }

    function userIdentity()
    {
        return $this->hasOne(UserIdentity::class, 'user_id', 'id');
    }

    function shop()
    {
        return $this->hasOne(Shop::class, 'user_id', 'id');
    }

    function parent()
    {
        return $this->belongsTo(self::class, 'parent_id', 'id');
    }

    function report()
    {
        return $this->hasMany(Report::class, 'user_id', 'id');
    }

    function children()
    {
        return $this->hasMany(self::class, 'parent_id', 'id');
    }

    public function allChildrenOrders()
    {
        return $this->hasManyThrough(Order::class, self::class, 'parent_id', 'user_id', 'id', 'id');
    }

    function orders()
    {
        return $this->hasMany(Order::class, 'user_id', 'id');
    }

    function admin()
    {
        return $this->belongsTo(Admin::class, 'admin_id', 'id');
    }





}
