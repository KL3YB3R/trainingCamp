<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Payments extends Model
{
    protected $table = 'payments';

    protected $fillable = [
        'reservation_id',
        'n_reference',
        'phone_number',
        'amount',
        'status_id',
        'date_transfer'
    ];

    public function reservation() {
        return $this->belongsTo(Reservations::class);
    }

    public function status() {
        return $this->belongsTo(StatusPayments::class, 'status_id');
    }

    public static function payReservation($request) {
        return self::create([
            'reservation_id' => $request->reservation_id,
            'n_reference' => $request->n_reference,
            'phone_number' => $request->phone_number,
            'amount' => $request->amount,
            'date_transfer' => $request->date_transfer,
            'status_id' => 1
        ]);
    }

    public static function getPayments($request) {
        $payments = self::with(['reservation', 'status']);

        if($request->has('reservationId') && $request->filled('reservationId')) {
            $payments = $payments->where('reservation_id', $request->reservationId);
        }
        if($request->has('start_date_search') && $request->filled('start_date_search')) {
            $payments = $payments->where('date_transfer', '>=', $request->start_date_search);
        }
        if($request->has('end_date_search') && $request->filled('end_date_search')) {
            $payments = $payments->where('date_transfer', '<=', $request->end_date_search);
        }
        if($request->has('status_search') && $request->filled('status_search')) {
            $payments = $payments->where('status_id', $request->status_search);
        }

        return $payments->orderBy('date_transfer', 'desc')->get();
    }
}
