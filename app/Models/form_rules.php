<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class form_rules extends Model
{
    use HasFactory;
    

    function form_details()
    {
        return $this->hasOne(form_details::class, 'id', 'form_details_id');
    }
}
