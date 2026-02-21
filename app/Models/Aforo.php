<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Aforo extends Model
{
    protected $table = 'aforo';

    protected $fillable = [
        'n_aforo', 
        'n_occupied', 
        'is_active', 
    ];

    public static function updateAforo($request)
    {
        $lastAforo = self::orderBy('id', 'desc')->first();
        
        return self::create([
            'n_aforo' => $request->new_aforo ?? $lastAforo->n_aforo ?? 0,
            'n_occupied' => $lastAforo->n_occupied ?? 0,
            'is_active' => true
        ]);
    }
}
