<?php

namespace App\Models\Address;

use Illuminate\Database\Eloquent\Model;

class Estado extends Model
{
    protected $table = 'estados';

    public $timestamps = false;

    protected $fillable = [
        'estado', 
    ];
}
