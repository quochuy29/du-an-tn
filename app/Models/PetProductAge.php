<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PetProductAge extends Model
{
    use HasFactory;

    protected $table = 'pet_product_age';
    protected $fillable = ['age_id', 'pro_id'];
}