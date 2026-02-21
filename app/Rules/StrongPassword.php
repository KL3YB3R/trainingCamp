<?php

namespace App\Rules;

use Closure;
use Illuminate\Contracts\Validation\ValidationRule;
use Illuminate\Contracts\Validation\ValidatorAwareRule;

class StrongPassword implements ValidationRule, ValidatorAwareRule
{
    /**
     * The validator instance.
     */
    protected $validator;
    
    /**
     * Set the current validator.
     */
    public function setValidator($validator)
    {
        $this->validator = $validator;
    }
    
    /**
     * Run the validation rule.
     */
    public function validate(string $attribute, mixed $value, Closure $fail): void
    {
        $messages = [];
        
        // Verificaciones individuales
        if (strlen($value) < 8) {
            $messages[] = 'al menos 8 caracteres';
        }
        
        if (!preg_match('/[a-z]/', $value)) {
            $messages[] = 'una letra minúscula';
        }
        
        if (!preg_match('/[A-Z]/', $value)) {
            $messages[] = 'una letra mayúscula';
        }
        
        if (!preg_match('/[0-9]/', $value)) {
            $messages[] = 'un número';
        }
        
        if (!preg_match('/[@$!%*#?&]/', $value)) {
            $messages[] = 'un carácter especial (@$!%*#?&)';
        }
        
        // Si hay errores, construir mensaje
        if (!empty($messages)) {
            $fail('La contraseña debe contener ' . implode(', ', $messages) . '.');
            
            // Para JSValidation, también agregar el error al validator
            if ($this->validator) {
                $this->validator->errors()->add($attribute, 
                    'La contraseña debe contener ' . implode(', ', $messages) . '.');
            }
        }
    }
}