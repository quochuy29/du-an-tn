<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PetProducts extends Model
{

    /*
    * Phan Quốc Huy
    * PH11301
    * 28/09/2021
    */
    use HasFactory;

    protected $table = 'pet_products';
    // coupons_id,
    protected $fillable = [
        'name', 'category_id', 'breed_id', 'slug', 'weight', 'gender_id',
        'price', 'status', 'quantity', 'description'
    ];

    function categories()
    {
        return $this->belongsTo(Category::class, 'category_id');
    }

    public function colors()
    {
        return $this->belongsToMany(Color::class, 'product_color', 'product_id', 'color_id');
    }

    public function agePets()
    {
        return $this->belongsToMany(PetAge::class, 'pet_product_age', 'pro_id', 'age_id');
    }

    public function gender()
    {
        return $this->belongsTo(Gender::class, 'gender_id');
    }

    public function galleries()
    {
        return $this->hasMany(ProductGallery::class, 'product_id');
    }

    public function breed()
    {
        return $this->belongsTo(PetBreed::class, 'breed_id');
    }

    public function new()
    {
        return $this->belongsTo(NewProduct::class, 'product_id');
    }

    // public function coupons()
    // {
    //     return $this->belongsTo('App\Models\Category', 'cate_id');
    // }
}