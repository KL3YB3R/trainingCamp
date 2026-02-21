<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class LogController extends Controller
{
    public function saveLog($message, $code, $location, $exception = null){
        $this->handleExceptionLog($location, $exception !== null ? $exception->getMessage() : null);
        return response()->json(['message' => $message], $code);
    }

    public function handleExceptionLog($location, $mensaje)
    {
        Log::error($location, [
            'message' => $mensaje
        ]);
    }
}
