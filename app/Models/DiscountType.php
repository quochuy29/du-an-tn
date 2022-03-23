<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class DiscountType extends Model
{
    use HasFactory, SoftDeletes;
    protected $table = "discount_types";

    protected $fillable = [
        'name'
    ];

    public function coupons()
    {
        return $this->hasMany(Coupons::class, 'discount_type')->withTrashed();
    }

    public function products()
    {
        return $this->hasMany(Product::class, 'discount_type')->withTrashed();
    }

    public function accessory()
    {
        return $this->hasMany(Accessory::class, 'discount_type')->withTrashed();
    }
}