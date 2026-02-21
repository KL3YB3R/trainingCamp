<header style="border-bottom:1px solid #eee; padding:12px 0;">
  <div style="max-width:1100px; margin:0 auto; display:flex; align-items:center; justify-content:space-between;">
    <a href="{{ route('home') }}" class="title" style="width: 70px; height: 70px; border-radius: 50%; background-color: #fff;" class="title">
      <img src="{{ asset('assets/img/logo.png') }}" alt="Logo Campo Escuela Quiripical" style="width: 100%; height: 100%;">
    </a>

    <nav aria-label="Navegación principal" style="margin-left:24px; ">
      <div class="container nav-row" style="padding:.5rem; display:flex; align-items:center;">
        <div class="nav-links" style="margin-right: 2rem">
          <ul style="display:flex; gap:12px; list-style:none; margin:0; padding:0;">
            <li><a href="{{ route('home') }}#quienes-somos">Quienes Somos</a></li>
            <li><a href="{{ route('home') }}#galeria">Galería</a></li>
            <li><a href="{{ route('home') }}#historia">Historia</a></li>
          </ul>
        </div>

        <div class="auth-buttons" aria-hidden="false" style="margin-left:auto;">
          <a href="{{ route('login') }}" class="" title="Iniciar sesión">Iniciar sesión</a>
          <a href="{{ route('register') }}" class="" title="Registrarse" style="margin-left:10px;">Registrarse</a>
        </div>
      </div>
    </nav>
  </div>
</header>