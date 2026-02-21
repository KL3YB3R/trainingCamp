<?php

namespace App\Http\Controllers;

use App\Http\Requests\Auth\RegisterRequest;
use App\Models\AuditTrails;
use App\Models\Auth\Users;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class RegisterController extends Controller
{
    public function index()
    {
        return view('pages.auth.register');
    }

    public function saveUser(RegisterRequest $request) {
        try {
            DB::beginTransaction();
            
            $inputs = $request->all();
            $inputs['rol_id'] = 2;

            $userExist = Users::where('email', $inputs['email'])->first();

            if($userExist) 
                return response()->json(['type' => 'warning', 'message' => 'El correo ya se encuentra registrado'], 200);

            $createUser = Users::create($inputs);
            
            if($createUser){
                AuditTrails::logActivity($createUser->id, 'Registro de usuario');
                DB::commit();
                return response()->json(['type' => 'success', 'message' => 'Usuario registrado correctamente'], 200);
            }

        } catch (\Throwable $th) {
            DB::rollBack();
            $logController = new LogController();
            $logController->saveLog($th->getMessage(), 500, 'register/saveUser', $th);
            return response()->json(['type' => 'warning', 'message' => 'Error al registrar el usuario'], 500);
        }
        
    }
}
