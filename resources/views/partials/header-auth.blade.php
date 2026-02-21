<header style="background:#fff; border-bottom:1px solid #eee; padding:12px 0;">
  <div style="max-width:1100px; margin:0 auto; display:flex; align-items:center; justify-content:space-between;">
    <a href="{{ route('home') }}" class="title" style="width: 70px; height: 70px; border-radius: 50%; background-color: #fff;" class="title">
      <img src="{{ asset('assets/img/logo.png') }}" alt="Logo Campo Escuela Quiripical" style="width: 100%; height: 100%;">
    </a>

    <nav aria-label="Navegación principal" style="margin-left:24px; ">
      <div class="container nav-row" style="padding:.5rem; display:flex; align-items:center;">
        <div class="nav-links" style="margin-right: 2rem">
          <ul style="display:flex; gap:12px; list-style:none; margin:0; padding:0;">
            @if (auth()->user()->rol_id == 1)
              <li><a href="{{ route('gallery.index') }}">Galeria</a></li>
              <li><a href="{{ route('news.index') }}">Noticias</a></li>
            @else
              <li><a href="{{ route('visitors.index') }}">Mis reservas</a></li>
            @endif
          </ul>
        </div>

        <div class="auth-buttons" aria-hidden="false" style="margin-left:auto;">
          <a href="{{ route('logout') }}" class="d-flex align-items-center logout-button" title="Iniciar sesión" style="color: #2b7a78;">
            Logout 
            <i class="fa-solid fa-arrow-right-from-bracket ms-2" style="pointer-events: none"></i>
          </a>
        </div>
      </div>
    </nav>
  </div>
</header>