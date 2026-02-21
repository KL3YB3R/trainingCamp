<?php

namespace App\Http\Controllers;

use App\Models\Aforo;
use App\Models\AuditTrails;
use App\Models\Auth\Users;
use App\Models\Parameters;
use App\Models\Payments;
use App\Models\Reservations;
use App\Models\Rols;
use App\Models\StatusPayments;
use App\Models\StatusReservations;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class AdminController extends Controller
{
    public function index()
    {
        $countUsers = Users::count();
        $aforo = Aforo::where("is_active", true)->first();
        $payments = Payments::count();
        $reservations = Reservations::getReservations();
        $reservationsWithoutPay = Reservations::getCountReservationsByStatus(1);
        $reservationsInVerification = Reservations::getCountReservationsByStatus(2);
        $reservationsPaying = Reservations::getCountReservationsByStatus(3);
        $reservationsPaid = Reservations::getCountReservationsByStatus(4);
        $roles = Rols::select('id', 'name')->get();
        $statusReservations = StatusReservations::select('id', 'name')->get();
        $statusPayments = StatusPayments::select('id', 'name')->get();

        
        return view('pages.admin.index', compact('countUsers', 'aforo', 'payments', 'reservations', 'reservationsWithoutPay', 'reservationsInVerification', 'reservationsPaying', 'reservationsPaid', 'roles', 'statusReservations', 'statusPayments'));
    }

    public function getUsers(Request $request) {
        $users = Users::getUsers($request);
        
        foreach ($users as $key => $value) {
            $dataToSend[] = [
                'fullname' => $value->name . ' ' . $value->last_name,
                'username' => $value->username,
                'email' => $value->email,
                'rol' => $value->rol->name,
                'id' => $value->id
            ];
        }

        return response()->json($dataToSend);
    }

    public function getReservations(Request $request) {
        $reservations = Reservations::getReservations(null, $request);
        
        foreach ($reservations as $key => $value) {
            $montos = Payments::where('reservation_id', $value->id)->pluck('amount');

            $sumaTotal = $montos->sum(function ($monto) {
                $limpio = str_replace(['.', ','], ['', '.'], $monto);
                return (float) $limpio;
            });

            $value->total_pagado = number_format($sumaTotal, 2, ',', '.');

            $dataToSend[] = [
                'start_date' => !is_null($value->start_date) ? Carbon::parse($value->start_date)->format('d / m / Y') : '',
                'end_date' => !is_null($value->end_date) ? Carbon::parse($value->end_date)->format('d / m / Y') : '',
                'n_guest' => $value->n_guest,
                'group_name' => $value->group_name,
                'amount' => $value->total_pagado,
                'status' => $value->status->name,
                'id' => $value->id,
                'percent_paid' => $value->percent_paid . '%',
            ];
        }

        return response()->json($dataToSend);
    }

    public function getPayments(Request $request) {
        $payments = Payments::getPayments($request);

        $dataToSend = [];
        if(count($payments) != 0) {
            foreach ($payments as $key => $value) {
                $dataToSend[] = [
                    'responsible' => $value->reservation->responsible_name,
                    'date_transfer' => !is_null($value->date_transfer) ? Carbon::parse($value->date_transfer)->format('d / m / Y') : '',
                    'n_reference' => $value->n_reference,
                    'phone_reference' => $value->phone_number,
                    'amount' => number_format($value->amount, 2, ',', '.'),
                    'status' => $value->status->name,
                    'id' => $value->id,
                    'status_id' => $value->status_id,
                    'reservation' => $value->reservation,
                    'start_date_reservation' => !is_null($value->reservation->start_date) ? Carbon::parse($value->reservation->start_date)->format('d / m / Y') : '',
                    'end_date_reservation' => !is_null($value->reservation->end_date) ? Carbon::parse($value->reservation->end_date)->format('d / m / Y') : '',
                ];
            }
        }   

        return response()->json($dataToSend);
    }

    public function deleteUser(Request $request) {
        try {
            
            DB::beginTransaction();
            
            Users::where('id', $request->userId)->delete();

            AuditTrails::logActivity(Auth::user()->id, 'Eliminar Usuario');
            
            DB::commit();
            return response()->json(['type' => 'success', 'message' => 'Usuario eliminado correctamente'], 200);
        
        } catch (\Throwable $th) {
            DB::rollBack();
            $logController = new LogController();
            $logController->saveLog($th->getMessage(), 500, 'reservation/store', $th);
            return response()->json(['type' => 'warning', 'message' => 'No se pudo borrar el usuario, intente nuevamente'], 500);
        }
    }

    public function updateStatusPayments(Request $request) {
        try {
            DB::beginTransaction();

            $payment = Payments::with('reservation')->find($request->idPayment);

            if(is_null($payment->reservation->total_amount)) 
                return response()->json(['type' => 'warning', 'message' => 'No hay un pago asociado a la reservación'], 500);

            if($request->action == "reject") $payment->update(['status_id' => 3]);
            else {
                $percent = number_format(($payment->amount * 100) / $payment->reservation->total_amount, 2, '.', '');
                
                if($request->percent >= 50) {
                    $updateAforo = Aforo::where('is_active', true)->orderBy('id', 'desc')->first();
                    $nOccupied = $updateAforo->n_occupied + $payment->reservation->n_guest;
                    $updateAforo->update(['n_occupied' => $nOccupied]);
                }

                $statusReservation = $percent < 100 ? 3 : 4;
                $totalPercent = $payment->reservation->percent_paid + $percent;
                
                $payment->update(['status_id' => 2]);
                $payment->reservation->update([
                    'status_id' => $statusReservation, 
                    'percent_paid' => $totalPercent,
                ]);
            }

            AuditTrails::logActivity(Auth::user()->id, 'Actualizar Estado de Pago');
            
            DB::commit();
            return response()->json(['type' => 'success', 'message' => 'Pago actualizado correctamente'], 200);
        
        } catch (\Throwable $th) {
            DB::rollBack();
            $logController = new LogController();
            $logController->saveLog($th->getMessage(), 500, 'reservation/store', $th);
            return response()->json(['type' => 'warning', 'message' => 'No se pudo actualizar el pago, intente nuevamente'], 500);
        }
    }

    public function getParameters(Request $request) {
        $aforo = Aforo::where('is_active', true)->select('n_occupied', 'n_aforo')->first();
        $parameters = Parameters::getParameters();

        $parameters->n_occupied = $aforo->n_occupied;
        $parameters->n_aforo = $aforo->n_aforo;
        
        return response()->json($parameters);
    }
}
