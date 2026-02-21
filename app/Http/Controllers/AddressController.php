<?php

namespace App\Http\Controllers;

use App\Models\Address\Estado;
use App\Models\Address\Municipios;
use App\Models\Address\Parroquias;
use Illuminate\Http\Request;

class AddressController extends Controller
{
    public function getStates() {
        $states = Estado::orderBy('estado')->get();

        return response()->json($states);
    }

    public function getMunicipalities(Request $request) {
        $stateIdSelected = $request->stateId;
        
        $municipalities = Municipios::where('estado_id', $stateIdSelected)->orderBy('municipio')->get();

        return response()->json($municipalities);
    }

    public function getParishes(Request $request) {
        $municipalityIdSelected = $request->municipalityId;
        
        $parish = Parroquias::where('municipio_id', $municipalityIdSelected)->orderBy('parroquia')->get();

        return response()->json($parish);
    }
}
