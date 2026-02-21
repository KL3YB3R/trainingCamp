<article class="card-container" id="dashboard-admin">
    <aside class="no-pointer">
        <figure>
            <h2>
                <i class="fa-solid fa-users"></i> AFORO MÁXIMO
            </h2>
            <button class="btnModal" data-modal-id="editAforo" title="Cambiar parámetros" onclick="getInformationParameters()">
                <i class="fa-solid fa-gear" style="pointer-events: none;"></i>
            </button>
        </figure>

        <h1 class="text-center" style="margin: 5px 0; font-size: 3rem; color: #17252a; line-height: 1;">
            {{$aforo->n_aforo}}
        </h1>

        <div style="background: #def2f1; border-radius: 6px; padding: 10px; margin-top: 10px; display: flex; flex-direction: column; gap: 5px;">
            <div style="display: flex; justify-content: space-between; font-size: 0.85rem;">
                <span style="color: #17252a;">Ocupados:</span>
                <span class="color-occupied" style="font-weight: bold;">{{$aforo->n_occupied}}</span>
            </div>
            <div style="display: flex; justify-content: space-between; font-size: 0.85rem; border-top: 1px solid rgba(43, 122, 120, 0.2); pt-5">
                <span style="color: #17252a;">Disponibles:</span>
                <span class="color-available" style="font-weight: bold;">{{$aforo->n_aforo - $aforo->n_occupied}}</span>
            </div>
        </div>
    </aside>
    <aside class="showDetails" data-container="users-container" data-function="getUsers">
        <figure>
            <h2>
                <i class="fa-solid fa-users"></i> USUARIOS REGISTRADOS
            </h2>
        </figure>

        <h1 class="text-center" style="margin: 5px 0; margin-top: 2rem; font-size: 3rem; color: #17252a; line-height: 1;">
            {{$countUsers}}
        </h1>
    </aside>
    <aside class="showDetails" data-container="reservations-container" data-function="getReservations">
        <figure>
            <h2>
                <i class="fa-solid fa-calendar-check"></i> RESERVACIONES
            </h2>
        </figure>

        <div style="background: #def2f1; border-radius: 6px; padding: 10px; margin-top: 10px; display: flex; flex-direction: column; gap: 5px;">
            <div style="display: flex; justify-content: space-between; font-size: 0.85rem;">
                <span style="color: #17252a;">Por Pagar:</span>
                <span style="font-weight: bold; color: #F7D117;">{{$reservationsWithoutPay}}</span>
            </div>
            <div style="display: flex; justify-content: space-between; font-size: 0.85rem; border-top: 1px solid rgba(43, 122, 120, 0.2); pt-5">
                <span style="color: #17252a;">Verificando Pago:</span>
                <span style="font-weight: bold; color: #00247D;">{{$reservationsInVerification}}</span>
            </div>
            <div style="display: flex; justify-content: space-between; font-size: 0.85rem; border-top: 1px solid rgba(43, 122, 120, 0.2); pt-5">
                <span style="color: #17252a;">Abonando:</span>
                <span style="font-weight: bold; color: #006B3F;">{{$reservationsPaying}}</span>
            </div>
            <div style="display: flex; justify-content: space-between; font-size: 0.85rem; border-top: 1px solid rgba(43, 122, 120, 0.2); pt-5">
                <span style="color: #17252a;">Pagado:</span>
                <span style="font-weight: bold; color: #2b7a78;">{{$reservationsPaid}}</span>
            </div>
        </div>
    </aside>
    <aside class="showDetails" data-container="payments-container" data-function="getPayments">
        <figure>
            <h2>
                <i class="fa-solid fa-money-bill-transfer"></i> PAGOS REALIZADOS
            </h2>
        </figure>
        <h1 class="text-center" style="margin: 5px 0; margin-top: 2rem; font-size: 3rem; color: #17252a; line-height: 1;">
            {{$payments}}
        </h1>
    </aside>
</article>