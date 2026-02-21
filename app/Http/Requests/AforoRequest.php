<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class AforoRequest extends FormRequest
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
            'new_aforo' => ['required', 'numeric', 'min:0'],
        ];
    }

    public function messages()
    {
        return [
            'new_aforo.required' => 'Campo Obligatorio.',
            'new_aforo.numeric' => 'El aforo debe ser numérico.',
            'new_aforo.min' => 'El aforo debe ser mayor o igual a 0.',
        ];
    }
}
