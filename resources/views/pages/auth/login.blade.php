@extends('layouts.app')

@push('styles')
    <link rel="stylesheet" href="{{ asset('assets/css/auth/login.css') }}">
@endpush

@section('content')

    <section>
        <div class="auth-wrap" role="main" aria-labelledby="loginTitle">
            <div class="card" aria-live="polite">
                <h2 id="loginTitle">Iniciar sesión</h2>

                {{-- Mensajes de error heredados vía query string (error=1 | error=db) --}}
                @if(request('error') === '1')
                    <div class="error">Credenciales inválidas. Verifica usuario y contraseña.</div>
                @elseif(request('error') === 'db')
                    <div class="error">Error de conexión a la base de datos. Intenta más tarde.</div>
                @endif

                {{-- Errores de validación o status de sesión --}}
                @if ($errors->any())
                    <div class="error">
                        <ul style="margin:0; padding-left:18px;">
                            @foreach ($errors->all() as $e)
                                <li>{{ $e }}</li>
                            @endforeach
                        </ul>
                    </div>
                @endif

                @if (session('status'))
                    <div class="muted">{{ session('status') }}</div>
                @endif

                <form action="{{ route('login.authenticate') }}" id="formLogin" method="post" autocomplete="on" novalidate>
                    @csrf

                    <label for="username">Usuario</label>
                    <input id="username" name="username" type="text" required autofocus maxlength="60" placeholder="Tu usuario" value="{{ old('user') }}">

                    <label for="password">Contraseña</label>
                    <input id="password" name="password" type="password" required maxlength="128" placeholder="********">

                    @if(session('error'))
                        <div class="flex items-center mt-4">
                            <svg class="w-5 h-5 text-red-500 mr-2" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"/>
                            </svg>
                            <span class="text-red-700 font-medium">{{ session('error') }}</span>
                        </div>
                    @endif

                    <div class="links" style="margin-top:.75rem;">
                        {{-- <a class="small" href="{{ route('password.request') }}">¿Olvidaste tu contraseña?</a> --}}
                        <a class="small create-account-link" href="{{ route('register') }}">¿No estás registrado? Crea una cuenta</a>
                    </div>


                    <div class="row" style="margin-top:1rem;">
                        <button class="btn" type="submit">Entrar</button>
                    </div>
                </form>

                {{-- Comentario con credenciales demo original --}}
            </div>
        </div>
    </section>

    @push('scripts')
        {!! JsValidator::formRequest('App\Http\Requests\Auth\LoginRequest', '#formLogin') !!}
        <script>
            D.addEventListener('submit', function(e){
                if(e.target.id == 'formLogin'){
                    e.preventDefault();
                    Login(e.target);
                }
            });

            function Login(form){
                var btn = form.querySelector('button');
                btn.disabled = true;
                btn.innerHTML = 'Entrando...';
                form.submit();
            }
        </script>
    @endpush

    <script>
        (function(){
            // Auto-focus en el campo usuario
            var u = document.getElementById('username');
            if(u) u.focus();
        })();

        
    </script>

@endsection