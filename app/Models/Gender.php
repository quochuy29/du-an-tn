<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Gender extends Model
{
    /*
    * Phan Quốc Huy
    * PH11301
    * 28/09/2021
    */
    use HasFactory;
    protected $table = 'gender';
    protected $fillable = ['gender'];
}