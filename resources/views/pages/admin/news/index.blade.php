@extends('layouts.app')

@push('styles')
    <link rel="stylesheet" href="{{ asset('assets/css/admin/news.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/css/modal-styles.css') }}">
@endpush

@section('content')
    <section class="hero container-home" id="parent-news" style=" width: 95%; margin: auto; margin-bottom: 3rem">
        <x-titles title="Noticias" subtitle="Administra tus noticias" />
        
        @auth
            <button type="button" data-modal-id="newNews" class="btnModal button button-primary" style="margin-top: 1.5rem">Agregar noticia</button>
        @endauth


        @include('pages.includes.news')
    </section>

    @include('pages.admin.modals.createNews')

@endsection

@push('scripts')
    {!! JsValidator::formRequest('App\Http\Requests\NewsRequest', '#formNewNews') !!}
    <script src="{{asset('assets/js/admin/newsIndex.js')}}"></script>
@endpush