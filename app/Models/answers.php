<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class answers extends Model
{
    use HasFactory;

    function user()
    {
        return $this->hasOne(User::class, 'id', 'users_id');
    }

}
