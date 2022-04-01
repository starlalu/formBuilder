<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class form_masters extends Model
{
    use HasFactory;

     function form_details()
     {
        return $this->hasMany(form_details::class,'form_id');
     }
}
