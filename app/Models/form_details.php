<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class form_details extends Model
{
    use HasFactory;

    function form_master()
    {
        return $this->hasOne(form_details::class, 'id', 'form_id');
    }
    function form_rules()
    {
        return $this->hasMany(form_rules::class,'form_details_id');
    }
}
