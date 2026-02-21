<!doctype html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>{{ $title ?? 'Campo Escuela Quiripical - Scout' }}</title>
    <link rel="stylesheet" href="{{ asset('assets/css/app.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/css/home.css') }}">
    @vite(['resources/css/app.css', 'resources/js/app.js'])
    {{-- jQuery (requerido por jsvalidation) --}}
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com">

    <link href="{{asset('assets/css/css/fontawesome.css')}}" rel="stylesheet" />
    <link href="{{asset('assets/css/css/brands.css')}}" rel="stylesheet" />
    <link href="{{asset('assets/css/css/solid.css')}}" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net" rel="stylesheet" />
    {{-- <link href="{{asset('assets/css/css/sharp-thin.css')}}" rel="stylesheet" />
    <link href="{{asset('assets/css/css/sharp-duotone-thin.css')}}" rel="stylesheet" /> --}}
    
    {{-- CSS de jsvalidation --}}
    {{-- <link rel="stylesheet" href="{{ asset('vendor/jsvalidation/jsvalidation.css') }}"> --}}
    <style>
        /* Estilo para forzar el footer abajo */
        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh; /* Ocupa el 100% de la ventana */
            margin: 0;
        }

        main {
            flex: 1 0 auto; /* Empuja al footer hacia abajo */
        }

        footer {
            flex-shrink: 0; /* Evita que el footer se aplaste */
        }
    </style>
    
    @stack('styles')
</head>
<body>
    @auth
        @include('partials.header-auth')
    @else
        @include('partials.header-guest')
    @endauth

    {{-- El contenido principal ahora empuja al footer --}}
    <main>
        @yield('content')
    </main>

    {{-- Tu footer se mantiene igual, pero ahora respetará el flexbox --}}
    <footer class="social-footer" aria-label="Redes sociales" style="background:#fff; border-top:1px solid #eee; padding:16px 0;">
        <div style="max-width:1100px; margin:0 auto; text-align:center; display:flex; justify-content:center; align-items:center; gap:14px; flex-wrap: wrap;">
            <a href="https://www.facebook.com/tudefacebook" target="_blank" rel="noopener" aria-label="Facebook" style="width:40px; height:40px; border-radius:50%; display:inline-flex; align-items:center; justify-content:center; background:#4267B2; color:#fff; text-decoration:none;">
                <i class="fa-brands fa-facebook-f"></i> {{-- Usa FontAwesome ya que lo tienes cargado --}}
            </a>
            <a href="https://www.instagram.com/tudInstagram" target="_blank" rel="noopener" aria-label="Instagram" style="width:40px; height:40px; border-radius:50%; display:inline-flex; align-items:center; justify-content:center; background:#E1306C; color:#fff; text-decoration:none;">
                <i class="fa-brands fa-instagram"></i>
            </a>
            <div class="container" style="color: #17252a;">
                © {{ date("Y") }} Campo Escuela Quiripical. Todos los derechos reservados.
            </div> 
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://cdn.jsdelivr.net"></script>
    <script src="{{ asset('vendor/jsvalidation/js/jsvalidation.js') }}"></script>
    <script src="{{asset('assets/js/globalVariables.js')}}"></script>
    <script>
        window.storagePath = "{{ asset('storage') }}";
    </script>

    @stack('scripts')
</body>
</html>