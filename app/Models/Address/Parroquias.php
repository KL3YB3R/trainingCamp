<?php

namespace App\Models\Address;

use Illuminate\Database\Eloquent\Model;

class Parroquias extends Model
{
    protected $table = 'parroquia';

    public $timestamps = false;
    
    protected $fillable = [
        'municipio_id',
        'parroquia',
    ];
}
