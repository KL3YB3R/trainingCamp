<?php

namespace App\Http\Controllers;

use App\Http\Requests\Auth\LoginRequest;
use App\Models\Auth\Users;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class LoginController extends Controller
{
    public function index()
    {
        return view('pages.auth.login');
    }

    public function authenticate(LoginRequest $request)
    {
        try {
            $request->authenticate();
            $request->session()->regenerate();
            // Redirigir al dashboard o página principal

            $user = Auth::user();

            if($user->rol_id == 2) return redirect()->intended(route('visitors.index'));
            return redirect()->intended(route('admin.index'));

        } catch (\Exception $e) {
            // Error de conexión a la base de datos
            $logController = new LogController();
            $logController->saveLog($e->getMessage(), 500, 'login/authenticate', $e);
            return redirect()->route('login')
                ->withInput()
                ->with('error', 'No se pudo iniciar sesión. Por favor, intente nuevamente.');
        }
    }

    public function logout(Request $request)
    {
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();
        
        return redirect()->route('login');
    }
}
