<?php

namespace app\admin\model;

use plugin\admin\app\model\Base;


/**
 * @property int $id 主键
 * @property int $user_id 用户
 * @property string $name 真实姓名
 * @property string $mobile 手机号
 * @property string $card_front 身份证正面
 * @property string $card_reverse 身份证反面
 * @property string $contract_image 合同照片
 * @property string $zfb_account 支付宝账号
 * @property string $zfb_yc_qr 支付宝远程收款码
 * @property string $zfb_sj_qr 支付宝商家收款码
 * @property string $wx_sj_qr 微信商家收款码
 * @property string $bank_account 银行卡号
 * @property string $bank_name 银行名称
 * @property int $status 状态:0=待审核,1=通过,2=拒绝
 * @property string|null $reason 原因
 * @property \Illuminate\Support\Carbon|null $created_at 创建时间
 * @property \Illuminate\Support\Carbon|null $updated_at 更新时间
 * @method static \Illuminate\Database\Eloquent\Builder<static>|UserIdentity newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|UserIdentity newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder<static>|UserIdentity query()
 * @property-read mixed $status_text
 * @mixin \Eloquent
 */
class UserIdentity extends Base
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'wa_user_identity';

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    protected $primaryKey = 'id';

    protected $appends = [
        'status_text'
    ];


     protected $fillable = [
        'user_id',
        'name',
        'mobile',
        'card_front',
        'card_reverse',
        'contract_image',
        'zfb_account',
        'zfb_yc_qr',
        'zfb_sj_qr',
        'wx_sj_qr',
        'bank_account',
        'bank_name',
        'status',
        'reason',
        'created_at',
        'updated_at',
     ];

    public function getStatusTextAttribute()
    {
        return [
            0 => '待审核',
            1 => '通过',
            2 => '拒绝',
        ][$this->status];
    }






}
