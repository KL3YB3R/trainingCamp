<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class GalleryRequest extends FormRequest
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
            'image_path' => ['required', 'image', 'mimes:jpeg,png,jpg', 'max:2048'],
            'text_image' => ['required', 'max:255'],
        ];
    }

    public function messages(): array
    {
        return [
            'image_path.required' => 'La imagen es obligatoria.',
            'image_path.image' => 'El archivo debe ser una imagen.',
            'image_path.mimes' => 'El archivo debe tener una extensión válida (jpeg, png, jpg).',
            'image_path.max' => 'El archivo debe tener un tamaño máximo de 2MB.',
            'text_image.required' => 'El texto es obligatorio.',
            'text_image.max' => 'El texto debe tener un máximo de 255 caracteres.',
        ];
    }
}
