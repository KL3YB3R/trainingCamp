@extends('layouts.app')

@push('styles')
  <link rel="stylesheet" href="{{ asset('assets/css/admin/news.css') }}">
  <link rel="stylesheet" href="{{ asset('assets/css/admin/gallery.css') }}">
@endpush

@section('content')
<section class="hero" id="inicio" aria-label="Bienvenida">
  <div class="container">
    <div class="section-heading" style="margin-bottom:12px;">
      <h2>Bienvenidos</h2>
      <p class="lead">Una comunidad scout enfocada en educación, exploración y servicio a la sociedad.</p>
      <span class="decor" aria-hidden="true"></span>
    </div>

    <h1>Bienvenidos al Campo Escuela Quiripical</h1>
    <p class="tagline">Actividades al aire libre, formación de liderazgo y proyectos comunitarios en contacto con la naturaleza.</p>
  </div>
</section>

<section id="news" aria-label="Noticias" style="margin-bottom: 3rem">
  <div class="container parent-news-home" id="parent-news">
    <div class="section-heading">
      <h2>Noticias</h2>
      <p class="lead">Entérate de nuestras actualizaciones</p>
      <span class="decor" aria-hidden="true"></span>
      <a href="{{ route('news.index') }}" class="d-flex align-items-center logout-button" style="color: #2b7a78;">
        Ver todas 
        <i class="fa-solid fa-arrow-right ms-2" style="pointer-events: none"></i>
      </a>
    </div>

    @include('pages.includes.news')
  </div>
</section>

<section id="galeria" aria-label="Galería" class="galeria" style="margin-bottom: 3rem">
  <div class="container parent-gallery-home" id="parent-gallery">
    <div class="section-heading" style="margin-bottom:3rem;">
      <h2>Galería</h2>
      <p class="lead">Recuerdos de actividades y proyectos recientes</p>
      <span class="decor" aria-hidden="true"></span>
      <a href="{{ route('gallery.index') }}" class="d-flex align-items-center logout-button" style="color: #2b7a78;">
        Ver todos 
        <i class="fa-solid fa-arrow-right ms-2" style="pointer-events: none"></i>
      </a>
    </div>

    @include('pages.includes.gallery')

  </div>
</section>

<section id="quienes-somos" aria-label="Quienes Somos" style="margin-bottom: 3rem">
  <div class="container">
    <div class="section-heading">
      <h2>Quienes Somos</h2>
      <p class="lead">Formación, servicio y convivencia en la naturaleza</p>
      <span class="decor" aria-hidden="true"></span>
    </div>

    <div class="grid" style="align-items:start;">
      <article class="card" style="grid-column: span 2;">
        <h3>Propósito</h3>
        <p>Somos un grupo scout dedicado a formar jóvenes con valores, liderazgo y espíritu de servicio a la comunidad. Nuestro campo escuela proporciona experiencias de aprendizaje práctico al aire libre, desarrollo personal y trabajo en equipo.</p>
      </article>

      <article class="card">
        <h3>Equipo</h3>
        <ul>
          <li>Seguidor Mayor: Lucho Rivera</li>
          <li>Guía de Ruta: Marta López</li>
          <li>Encargado de Proyectos: Carlos Paredes</li>
        </ul>
      </article>
    </div>
  </div>
</section>

<section id="historia" aria-label="Historia" style="margin-bottom: 3rem">
  <div class="container">
    <div class="section-heading">
      <h2>Historia</h2>
      <p class="lead">Nuestro recorrido y misión</p>
      <span class="decor" aria-hidden="true"></span>
    </div>

    <div class="historia" style="display:flex; flex-wrap:wrap; gap:20px; align-items:flex-start;">
      <div style="flex:1 1 60%;">
        <p>El Campo Escuela Quiripical nace del deseo de nuestra comunidad de conservar y transmitir los valores del movimiento scout: servicio, amistad, progreso y respeto por la naturaleza. A lo largo de los años hemos desarrollado programas de formación en liderazgo, primeros auxilios, orientación, supervivencia y trabajo en equipo, siempre bajo un marco seguro y participativo.</p>
        <p>Con cada curso y actividad, buscamos que nuestros jóvenes scouts crezcan en responsabilidad y empatía, preparándolos para enfrentar los retos del mundo real con integridad y iniciativa.</p>
      </div>

      <aside style="flex:0 0 240px;">
        {{-- <a href="{{ route('reserva') }}" id="openReservaBtn" class="btn-reserva" style="display:inline-block; padding:14px 20px; background:var(--primary); color:white; text-decoration:none; border-radius:8px; font-weight:600; text-align:center;">
          Hacer Reserva
        </a> --}}
        <div style="height:18px;"></div>
        <p style="margin:0; color:var(--muted); font-size:0.92rem;">¿Necesitas ayuda? Contáctanos y te orientamos sobre fechas, equipo necesario y programas disponibles.</p>
      </aside>
    </div>
  </div>
</section>
@endsection

@push('scripts')
  <script src="{{asset('assets/js/admin/newsIndex.js')}}"></script>
  <script src="{{asset('assets/js/admin/galleryIndex.js')}}"></script>
@endpush