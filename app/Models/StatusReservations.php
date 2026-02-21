<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class StatusReservations extends Model
{
    protected $table = 'status_reservation';

    public $timestamps = false;

    protected $fillable = [
        'name',
        'color',
    ];
}
