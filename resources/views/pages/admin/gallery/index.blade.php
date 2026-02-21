@extends('layouts.app')

@push('styles')
    <link rel="stylesheet" href="{{ asset('assets/css/admin/gallery.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/css/modal-styles.css') }}">
@endpush

@section('content')
    <section class="hero container-home" id="parent-gallery" style=" width: 95%; margin: auto; margin-bottom: 3rem">
        <x-titles title="Galeria" subtitle="Administra tu galeria" />
        
        @auth
            <button type="button" data-modal-id="newImage" class="btnModal button button-primary" style="margin-top: 1.5rem">Agregar Imagen</button>
        @endauth

        @include('pages.includes.gallery')
        
    </section>

    @include('pages.admin.modals.createImage')

@endsection

@push('scripts')
    {!! JsValidator::formRequest('App\Http\Requests\GalleryRequest', '#formNewImage') !!}
    <script src="{{asset('assets/js/admin/galleryIndex.js')}}"></script>
@endpush