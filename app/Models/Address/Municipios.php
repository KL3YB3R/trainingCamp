<?php

namespace App\Models\Address;

use Illuminate\Database\Eloquent\Model;

class Municipios extends Model
{
    protected $table = 'municipios';

    public $timestamps = false;

    protected $fillable = [
        'estado_id',
        'municipio',
    ];
}
