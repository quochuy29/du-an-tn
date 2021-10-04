<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    /*
    * Phan Quốc Huy
    * PH11301
    * 28/09/2021
    */
    use HasFactory;

    protected $table = 'categories';
    protected $fillable = ['name', 'slug'];
}