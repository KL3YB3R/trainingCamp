<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class PayReservationRequest extends FormRequest
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
        return [
            'n_reference' => ['required', 'numeric', 'digits:6'],
            'phone_number' => ['required', 'numeric'],
            'amount' => ['required'],
        ];
    }

    public function messages(): array
    {
        return [
            'n_reference.required' => 'El número de referencia es requerido.',
            'n_reference.numeric' => 'El número de referencia debe ser numérico.',
            'n_reference.digits' => 'El número de referencia debe tener 6 dígitos.',
            'phone_number.required' => 'El número de teléfono es requerido.',
            'phone_number.numeric' => 'El número de teléfono debe ser numérico.',
            'amount.required' => 'El monto es requerido.',
            'amount.numeric' => 'El monto debe ser numérico.',
        ];
    }
}
