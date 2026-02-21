@extends('layouts.app')

@push('styles')
    <link rel="stylesheet" href="{{ asset('assets/css/auth/login.css') }}">
@endpush

@section('content')

    <section>
        <form id="formRegister" class="auth-wrap" role="main" aria-labelledby="registerTitle">
            @csrf
            <div class="card" aria-live="polite">
                <h2 id="registerTitle">Crear cuenta</h2>

                <input type="hidden" name="next" value="">

                <article class="grid grid-cols-2 gap-3 w-100!">
                    <aside class="col-6 w-100!">
                        <label for="name">Nombres</label>
                        <input id="name" class="w-100" name="name" type="text" required maxlength="60" placeholder="Nombres">
                    </aside>

                    <aside class="col-6 w-100!">
                        <label for="last_name">Apellidos</label>
                        <input id="last_name" class="w-100" name="last_name" type="text" required maxlength="60" placeholder="Apellidos">
                    </aside>
    
                </article>

                <article>
                    <label for="username">Usuario</label>
                    <input id="username" name="username" type="text" required maxlength="60" placeholder="Nombre de usuario">
                </article>

                <article>
                    <label for="email">Email</label>
                    <input id="email" name="email" type="email" required maxlength="150" placeholder="tu@ejemplo.com">
                </article>

                <article>
                    <label for="password">Contraseña</label>
                    <input id="password" name="password" type="password" required minlength="6" maxlength="128" placeholder="Mínimo 6 caracteres">
                </article>
                
                <article>
                    <label for="password_confirmation">Confirmar contraseña</label>
                    <input id="password_confirmation" name="password_confirmation" type="password" required minlength="6" maxlength="128" placeholder="Repite la contraseña">
                </article>

                <div class="links">
                    <a class="small create-account-link" href="{{ route('login') }}">¿Ya tienes cuenta? Inicia sesión</a>
                </div>

                <div class="row">
                    <button class="btn" type="submit" id="submitBtn">Crear cuenta</button>
                </div>

                <div class="muted" style="margin-top:10px;">Al registrarte aceptas las condiciones del servicio.</div>
            </div>
        </form>
    </section>

    @push('scripts')
        {!! JsValidator::formRequest('App\Http\Requests\Auth\RegisterRequest', '#formRegister') !!}
        <script src="{{ asset('assets/js/auth/register.js') }}"></script>
    @endpush
    
    <script>

        $(document).ready(function() {
            $('#register-form').validate({
                errorClass: 'is-invalid',
                validClass: 'is-valid',
                errorElement: 'div',
                errorPlacement: function(error, element) {
                    error.addClass('invalid-feedback');
                    element.next('.invalid-feedback').html(error.html());
                },
                highlight: function(element) {
                    $(element).addClass('is-invalid').removeClass('is-valid');
                },
                unhighlight: function(element) {
                    $(element).removeClass('is-invalid').addClass('is-valid');
                },
                rules: {
                    email: {
                        required: true,
                        email: true
                    },
                    password: {
                        required: true,
                        minlength: 8
                    }
                },
                messages: {
                    email: {
                        required: "El email es obligatorio",
                        email: "Email inválido"
                    },
                    password: {
                        required: "La contraseña es obligatoria",
                        minlength: "Mínimo 8 caracteres"
                    }
                },
                submitHandler: function(form) {
                    // Validación del backend aún ocurrirá
                    form.submit();
                }
            });
        });
        
        /* (function(){
            var form = document.getElementById('registerForm');
            var pass = document.getElementById('password');
            var pass2 = document.getElementById('pass_confirm');
            var submit = document.getElementById('submitBtn');

            function validatePasswords(e){
                if (pass.value && pass2.value && pass.value !== pass2.value) {
                    pass2.setCustomValidity('Las contraseñas no coinciden');
                    submit.disabled = true;
                } else {
                    pass2.setCustomValidity('');
                    submit.disabled = false;
                }
            }

            pass.addEventListener('input', validatePasswords);
            pass2.addEventListener('input', validatePasswords);

            var u = document.getElementById('user');
            if(u) u.focus();
        })(); */
    </script>

@endsection