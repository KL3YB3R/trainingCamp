<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class StatusPayments extends Model
{
    protected $table = 'status_payments';

    public $timestamps = false;

    protected $fillable = [
        'name',
        'color',
    ];
}
