<div id="editAforo" class="modal-overlay">
    <div class="modal-content width-xl">
        <div class="modal-header">
            <span>Editar Parámetros</span>
            <span class="btnCerrar" data-modal-close="editAforo" style="cursor: pointer; font-size: 24px;">&times;</span>
        </div>
        <form action="" id="formEditAforo" method="POST" class="modal-body">
            @csrf

            <article class="params-container">
                <aside class="mt-2">
                    <label for="new_aforo" class="label-input">Capacidad Máxima de Aforo</label>
                    <input id="new_aforo" type="number" name="new_aforo" required>
                </aside>
                <aside class="mt-2">
                    <label for="tasa_dolar" class="label-input">Tasa dolar (Bs):</label>
                    <input id="tasa_dolar" type="text" class="amount" name="tasa_dolar" required>
                </aside>
                <aside class="mt-2">
                    <label for="amount_pay" class="label-input">Monto a pagar por persona (Bs):</label>
                    <input id="amount_pay" type="text" class="amount" name="amount_pay" required>
                </aside>
            </article>

            <button type="submit" class="btn-modal" style="">
                Guardar
            </button>
        </form>
    </div>
</div>