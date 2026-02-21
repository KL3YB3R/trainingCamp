<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

class Parameters extends Model
{
    protected $table = 'parameters';

    protected $fillable = [
        'tasa_dolar',
        'amount_person',
        'is_active',
    ];

    public static function getParameters() {
        $parameters = self::where('is_active', true)->select('id', 'tasa_dolar', 'amount_person', 'is_active')->orderBy('id', 'desc')->first();

        if(!is_null($parameters)) {
            $parameters->tasa_dolar = number_format($parameters->tasa_dolar, 2, ',', '.');
            $parameters->amount_person = number_format($parameters->amount_person, 2, ',', '.');
        }
        
        return $parameters;
    }

    public static function updateParameters($request)
    {
        $amountTopay = 0;
        $tasaDolar = 0;
        $lastParameter = self::orderBy('id', 'desc')->first();
        if(!is_null($lastParameter)) $lastParameter->update(['is_active' => false]);

        if(!is_null($request->amount_pay)) {
            $amountTopay = str_replace(['.', ','], ['', '.'], $request->amount_pay);
        }

        if(!is_null($request->tasa_dolar)) {
            $tasaDolar = str_replace(['.', ','], ['', '.'], $request->tasa_dolar);
        }

        return self::create([
            'tasa_dolar' => $tasaDolar,
            'amount_person' => $amountTopay,
            'is_active' => true
        ]);
    }
}
