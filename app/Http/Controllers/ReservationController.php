<?php

namespace App\Http\Controllers;

use App\Http\Requests\PayReservationRequest;
use App\Http\Requests\ReservationRequest;
use App\Models\AuditTrails;
use App\Models\Parameters;
use App\Models\Payments;
use App\Models\Reservations;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class ReservationController extends Controller
{
    public function calculateToPay($request) {
        // CONSULTAR EL MONTO POR PERSONA
        $guests = $request->n_guests;
        $parameters = Parameters::where('is_active', true)->select('id', 'tasa_dolar', 'amount_person', 'is_active')->orderBy('id', 'desc')->first();

        $totalToPay = $parameters->amount_person * $guests;

        return $totalToPay;
    }

    public function store(ReservationRequest $request) {
        try {
            DB::beginTransaction();

            $totalToPay = $this->calculateToPay($request);

            if(isset($request->reservation_id) && !is_null($request->reservation_id)) 
                $saveReservation = Reservations::updateReservation($request, $totalToPay);
            else
                $saveReservation = Reservations::createReservation($request, $totalToPay);
            
            if ($saveReservation) {
                AuditTrails::logActivity(Auth::user()->id, 'Registro de Reservación');
                DB::commit();
                return response()->json(['type' => 'success', 'message' => 'Reserva guardada correctamente'], 200);
            }else {
                DB::rollBack();
                return response()->json(['type' => 'warning', 'message' => 'No se pudo guardar la reserva, intente nuevamente'], 500);
            }
                
        } catch (\Throwable $th) {
            DB::rollBack();
            $logController = new LogController();
            $logController->saveLog($th->getMessage(), 500, 'reservation/store', $th);
            return response()->json(['type' => 'warning', 'message' => 'No se pudo crear la reserva, intente nuevamente'], 500);
            
        }
    }

    public function pay(PayReservationRequest $request) {
        try {
            DB::beginTransaction();

            $payReservation = Payments::payReservation($request);

            if ($payReservation) {

                $reservation = Reservations::find($payReservation->reservation_id);
                $reservation->update(['status_id' => 2]);

                AuditTrails::logActivity(Auth::user()->id, 'Pagar Reservación');
                
                DB::commit();
                return response()->json(['type' => 'success', 'message' => 'Pago registrado correctamente'], 200);
            }else {
                DB::rollBack();
                return response()->json(['type' => 'warning', 'message' => 'No se pudo pagar la reservación, intente nuevamente'], 500);
            }
                
        } catch (\Throwable $th) {
            DB::rollBack();
            $logController = new LogController();
            $logController->saveLog($th->getMessage(), 500, 'reservation/pay', $th);
            return response()->json(['type' => 'warning', 'message' => 'No se pudo pagar la reservación, intente nuevamente'], 500);
            
        }
    }

    public function edit(ReservationRequest $request) {
        try {
            DB::beginTransaction();

            $payReservation = Payments::payReservation($request);

            if ($payReservation) {

                $reservation = Reservations::find($payReservation->reservation_id);
                $reservation->update(['status_id' => 2]);
                
                DB::commit();
                return response()->json(['type' => 'success', 'message' => 'Pago registrado correctamente'], 200);
            }else {
                DB::rollBack();
                return response()->json(['type' => 'warning', 'message' => 'No se pudo pagar la reservación, intente nuevamente'], 500);
            }
                
        } catch (\Throwable $th) {
            DB::rollBack();
            $logController = new LogController();
            $logController->saveLog($th->getMessage(), 500, 'reservation/edit', $th);
            return response()->json(['type' => 'warning', 'message' => 'No se pudo pagar la reservación, intente nuevamente'], 500);
            
        }
    }

    public function delete(Request $request) {
        try {
            DB::beginTransaction();

            Reservations::deleteReservation($request);
            AuditTrails::logActivity(Auth::user()->id, 'Eliminar Reservación');

            DB::commit();
            return response()->json(['type' => 'success', 'message' => 'Reservación eliminada correctamente'], 200);
                
        } catch (\Throwable $th) {
            DB::rollBack();
            $logController = new LogController();
            $logController->saveLog($th->getMessage(), 500, 'reservation/delete', $th);
            return response()->json(['type' => 'warning', 'message' => 'No se pudo eliminar la reservación, intente nuevamente'], 500);
            
        }
    }

    public function getInformationReservation(Request $request) {
        try {
            DB::beginTransaction();

            $reservation = Reservations::with(['state', 'municipality', 'parish'])->where('id', $request->reservationId)->select('reservations.id', 'reservations.group_name', 'reservations.start_date', 'reservations.end_date', 'reservations.n_guest', 'reservations.responsible_name', 'reservations.responsible_email', 'reservations.state_id', 'reservations.municipality_id', 'reservations.parish_id', 'reservations.address')->first();

            $reservation->start_date = date('Y-m-d', strtotime($reservation->start_date));
            $reservation->end_date = date('Y-m-d', strtotime($reservation->end_date));

            if(!is_null($reservation)) {
                DB::commit();
                return response()->json(['type' => 'success', 'message' => 'Información de la reservación obtenida correctamente', 'data' => $reservation], 200);
            }else {
                DB::rollBack();
                return response()->json(['type' => 'warning', 'message' => 'No se pudo obtener la información de la reservación, intente nuevamente'], 500);
            }
                
        } catch (\Throwable $th) {
            DB::rollBack();
            $logController = new LogController();
            $logController->saveLog($th->getMessage(), 500, 'reservation/getInformationReservation', $th);
            return response()->json(['type' => 'warning', 'message' => 'No se pudo obtener la información de la reservación, intente nuevamente'], 500);
            
        }
    }
}
