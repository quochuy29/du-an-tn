<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductColor extends Model
{
    /*
    * Phan Quốc Huy
    * PH11301
    * 28/09/2021
    */
    use HasFactory;

    protected $table = 'product_color';
    protected $fillable = ['color_id', 'product_id', 'quantity'];
}