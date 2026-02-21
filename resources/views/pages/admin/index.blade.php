@extends('layouts.app')

@push('styles')
    <link rel="stylesheet" href="{{ asset('assets/css/modal-styles.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/css/cards.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/css/admin/index.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/css/criterios.css') }}">
@endpush

@section('content')
    <section class="hero" id="inicio" aria-label="Bienvenida" style=" margin-bottom: 3rem">

        <div class="container-home">
            <div class="section-heading" style="margin-bottom:12px;">
                <h2>Resumen General</h2>
                <span class="decor" aria-hidden="true"></span>
            </div>
        </div>

        @include('pages.admin.includes.panelAdmin')

        <div style="width: 95%; margin: auto auto; margin-top: 6rem;" id="containers-details">
            @include('pages.admin.includes.tables.reservations')
            @include('pages.admin.includes.tables.users')
            @include('pages.admin.includes.tables.payments')
        </div>
    </section>

    @include('pages.admin.modals.aforo')
    @include('pages.admin.modals.newUser')
    @include('pages.admin.modals.showPayments')
    @include('pages.visitors.modals.reserva')
@endsection

@push('scripts')
    {!! JsValidator::formRequest('App\Http\Requests\AforoRequest', '#formEditAforo') !!}
    {!! JsValidator::formRequest('App\Http\Requests\Auth\RegisterRequest', '#formNewUser') !!}
    <script src="{{ asset('assets/js/admin/index.js') }}"></script>
@endpush