<?php

namespace App\Models;

use App\Models\Address\Estado;
use App\Models\Address\Municipios;
use App\Models\Address\Parroquias;
use App\Models\Auth\Users;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class Reservations extends Model
{
    protected $table = 'reservations';

    protected $fillable = [
        'user_id',
        'start_date',
        'end_date',
        'n_guest',
        'group_name',
        'responsible_name',
        'responsible_email',
        'status_id',
        'state_id',
        'municipality_id',
        'parish_id',
        'address',
        'total_amount',
        'percent_paid',
    ];

    protected $appends = ['total_paid']; 

    // RELATIONS
    public function user() {
        return $this->belongsTo(Users::class, 'user_id');
    }

    public function status() {
        return $this->belongsTo(StatusReservations::class, 'status_id');
    }

    public function payments() {
        return $this->hasMany(Payments::class, 'reservation_id');
    }

    public function state() {
        return $this->belongsTo(Estado::class, 'state_id');
    }

    public function municipality() {
        return $this->belongsTo(Municipios::class, 'municipality_id');
    }

    public function parish() {
        return $this->belongsTo(Parroquias::class, 'parish_id');
    }

    public function getTotalPaidAttribute() {
        $total = $this->payments->sum(function ($payment) {
            $limpio = str_replace(['.', ','], ['', '.'], $payment->amount);
            return (float) $limpio;
        });
        return number_format($total, 2, ',', '.');
    }

    public static function getReservations($userId = null, $request = null) {
        $reservations = self::with(['user:id,name,email', 'status', 'payments'])
            ->select('id', 'user_id', 'start_date', 'end_date', 'n_guest', 'group_name', 'status_id', 'total_amount', 'percent_paid');

        if(!is_null($userId)) $reservations = $reservations->where('user_id', $userId);

        if (!is_null($request)) {
            if ($request->has('start_date_search') && $request->filled('start_date_search')) {
                $reservations = $reservations->where('start_date', '>=', $request->start_date_search);
            }
            if ($request->has('end_date_search') && $request->filled('end_date_search')) {
                $reservations = $reservations->where('end_date', '<=', $request->end_date_search);
            }
            if ($request->has('group_name_search') && $request->filled('group_name_search')) {
                $reservations = $reservations->where('group_name', 'like', '%' . $request->group_name_search . '%');
            }
            if ($request->has('status_search') && $request->filled('status_search')) {
                $reservations = $reservations->where('status_id', 'like', '%' . $request->status_search . '%');
            }
        }
        
        $data = $reservations->orderBy('created_at', 'desc')->get();

        $data->each(function($item) {
            $item->total_paid = $item->getTotalPaidAttribute();
            $item->total_amount = number_format($item->total_amount, 2, ',', '.');
        });
        
        return $data;
    }

    public static function createReservation($request, $totalToPay) {
        return self::create([
            'user_id' => Auth::user()->id,
            'start_date' => $request->start_date,
            'end_date' => $request->end_date,
            'n_guest' => $request->n_guests,
            'group_name' => $request->scout_name,
            'responsible_name' => $request->name_responsable,
            'responsible_email' => $request->email_responsable,
            'status_id' => 1,
            'state_id' => $request->estado_responsable,
            'municipality_id' => $request->municipio_responsable,
            'parish_id' => $request->parroquia_responsable,
            'address' => $request->address,
            'total_amount' => $totalToPay,
            'percent_paid' => 0,
        ]);
    }

    public static function updateReservation($request, $totalToPay) {
        $reservation = self::find($request->reservation_id);
        
        return $reservation->update([
            'start_date' => $request->start_date,
            'end_date' => $request->end_date,
            'n_guest' => $request->n_guests,
            'group_name' => $request->scout_name,
            'responsible_name' => $request->name_responsable,
            'responsible_email' => $request->email_responsable,
            'state_id' => $request->estado_responsable,
            'municipality_id' => $request->municipio_responsable,
            'parish_id' => $request->parroquia_responsable,
            'address' => $request->address,
            'total_amount' => $totalToPay,
            'percent_paid' => 0,
        ]);
    }

    public static function deleteReservation($request) {
        return self::where('id', $request->reservationId)->delete();
    }

    public static function getCountReservationsByStatus($statusId) {
        return self::where('status_id', $statusId)->count();
    } 
}
