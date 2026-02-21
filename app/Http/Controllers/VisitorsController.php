<?php

namespace App\Http\Controllers;

use App\Models\Aforo;
use App\Models\Reservations;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class VisitorsController extends Controller
{
    public function index()
    {
        $userId = Auth::id();

        $reservations = Reservations::getReservations($userId);
        
        $aforo = Aforo::where('is_active', true)->select('n_occupied', 'n_aforo')->first();

        return view('pages.visitors.index', compact('reservations', 'aforo'));
    }
}
