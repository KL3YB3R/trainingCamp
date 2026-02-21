<?php

namespace App\Http\Controllers;

use App\Http\Requests\AforoRequest;
use App\Models\Aforo;
use App\Models\AuditTrails;
use App\Models\Parameters;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class AforoController extends Controller
{
    public function store(AforoRequest $request)
    {
        try {
            DB::beginTransaction();

            $lastAforo = Aforo::orderBy('id', 'desc')->first();
            if(!is_null($lastAforo)) $lastAforo->update(['is_active' => false]);

            Aforo::updateAforo($request);
            Parameters::updateParameters($request);

            AuditTrails::logActivity(Auth::user()->id, 'Actualizar parámetros');
                
            DB::commit();
            return response()->json(['type' => 'success', 'message' => 'Parámetros actualizados correctamente'], 200);
                
        } catch (\Throwable $th) {
            DB::rollBack();
            $logController = new LogController();
            $logController->saveLog($th->getMessage(), 500, 'reservation/store', $th);
            return response()->json(['type' => 'warning', 'message' => 'No se pudo actualizar el aforo, intente nuevamente'], 500);
            
        }
    }
}
