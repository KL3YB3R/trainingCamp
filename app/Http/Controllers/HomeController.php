<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller
{

    public function index()
    {
        if(Auth::check()) {
            if(Auth::user()->rol_id == 1) return redirect()->route('admin.index');
            return redirect()->route('visitors.index');
        }
        
        return view('pages.home.home');
    }
}
