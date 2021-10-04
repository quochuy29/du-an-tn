<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PetAge extends Model
{
    use HasFactory;

    protected $table = 'pet_age';
    protected $fillable = ['age'];
}