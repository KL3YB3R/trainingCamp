<?php

namespace App\Http\Requests;

use App\Models\Aforo;
use Illuminate\Foundation\Http\FormRequest;

class ReservationRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        $aforo = Aforo::where('is_active', true)->first();
        $limiteDisponible = $aforo->n_aforo - $aforo->n_occupied;
        
        return [
            "scout_name" => ["required"],
            "start_date" => ["required", "date"],
            "end_date" => ["required", "date"],
            "n_guests" => ["required", "numeric", 'min:1', "max:{$limiteDisponible}"],
            "name_responsable" => ["required"],
            "email_responsable" => ["required"],
        ];
    }

    public function messages()
    {
        return [
            "required" => "Campo obligatorio",
            "date" => "Formato de fecha incorrecto",
            "numeric" => "Solo está permitido el ingreso de numeros",
            'n_guests.max' => 'No hay suficiente aforo disponible.',
        ];
    }
}
