@extends('layouts.app')

@push('styles')
    <link rel="stylesheet" href="{{ asset('assets/css/modal-styles.css') }}">
@endpush

@section('content')

    <section class="hero" id="inicio" aria-label="Bienvenida">

        <div class="container-home">
            <x-titles title="Bienvenidos" subtitle="Una comunidad scout enfocada en educación, exploración y servicio a la sociedad." />


            @include('pages.includes.tableReservation')
        </div>
    </section>

    @include('pages.visitors.modals.reserva')
    @include('pages.visitors.modals.pagarReserva')
    @include('pages.modals.showPayments')

@endsection

@push('scripts')
    {!! JsValidator::formRequest('App\Http\Requests\ReservationRequest', '#formReservation') !!}
    {!! JsValidator::formRequest('App\Http\Requests\PayReservationRequest', '#formPayReservation') !!}
    <script src="{{ asset('assets/js/visitors/index.js') }}"></script>
@endpush