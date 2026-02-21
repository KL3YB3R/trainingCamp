<div id="payReservation" class="modal-overlay">
    <div class="modal-content">
        <div class="modal-header">
            <span>Pagar Reserva</span>
            <span class="btnCerrar" data-modal-close="payReservation" style="cursor: pointer; font-size: 24px;">&times;</span>
        </div>
        <form action="" id="formPayReservation" method="POST" class="modal-body">
            @csrf

            <input type="hidden" class="other_information" name="reservation_id" id="reservation_id">

            <article style="display: grid; grid-template-columns: repeat(3, 1fr); gap: 1rem; border: 2px solid #17252a; padding: 15px; border-radius: 6px;">
                <aside style="text-align: center;">
                    <label style="display: block; font-weight: bold; text-transform: uppercase;">Banco Receptor</label>
                    <p style="margin: 0; color: #17252a; font-weight: 600;">BANCO DE VENEZUELA</p>
                </aside>
                <aside style="text-align: center; border-left: 1px solid #def2f1; border-right: 1px solid #def2f1;">
                    <label style="display: block; font-weight: bold; text-transform: uppercase;">Documento</label>
                    <p style="margin: 0; color: #17252a; font-weight: 600;">J-5000123-6</p>
                </aside>
                <aside style="text-align: center;">
                    <label style="display: block; font-weight: bold; text-transform: uppercase;">Teléfono</label>
                    <p style="margin: 0; color: #17252a; font-weight: 600;">0424 933 23 22</p>
                </aside>
            </article>

            <article class="grid grid-flow-col gap-4 mt-4">
                <aside>
                    <label for="n_reference">N° de Referencia (Últimos 6 Dígitos)</label>
                    <input id="n_reference" type="text" name="n_reference" class="" required maxlength="6">
                </aside>
                <aside>
                    <label for="phone_number">N° de Teléfono del Pago Móvil</label>
                    <input id="phone_number" type="text" name="phone_number" class="" required maxlength="15">
                </aside>
                <aside>
                    <label for="date_transfer" style="display: block;">Fecha de Pago</label>
                    <input id="date_transfer" type="date" name="date_transfer" placeholder="dd / mm / aaaa" class="input-monto" required>
                </aside>
                <aside>
                    <label for="amount" style="display: block;">Monto</label>
                    <input id="amount" type="text" name="amount" class="amount" placeholder="0,00" class="input-monto" required>
                </aside>
            </article>

            <button type="submit" class="button-primary" style="color: white; border: none; padding: 10px 20px; border-radius: 4px; cursor: pointer; width: 100%; margin-top: 2rem;">
                Enviar Pago
            </button>
        </form>
    </div>
</div>