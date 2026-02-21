<div id="showPayments" class="modal-overlay">
    <div class="modal-content width-2xl">
        <div class="modal-header">
            <span>Pagos de la Reservación</span>
            <span class="btnCerrar" data-modal-close="showPayments" style="cursor: pointer; font-size: 24px;">&times;</span>
        </div>
        <form action="" id="formNewUser" method="POST" class="modal-body">
            @csrf

            <div class="table-container">
                <table id="table_payments_modal" class="custom-table">
                    <thead>
                        <th>Responsable</th>
                        <th>Fecha de Pago</th>
                        <th>N° de Referencia (últimos 6 dígitos)</th>
                        <th>Teléfono de Referencia</th>
                        <th>Monto (Bs.)</th>
                        <th>Estatus</th>
                        <th>Acciones</th>
                    </thead>
                    <tbody id="body_payments_modal">
                        <tr class="template-row" style="display: none;">
                            <td width="20%" class="text-center" style="border-right: 1px solid #c1c1c1" data-field="responsible"></td>
                            <td width="20%" class="text-center" style="border-right: 1px solid #c1c1c1" data-field="date_transfer"></td>
                            <td width="20%" class="text-center" style="border-right: 1px solid #c1c1c1" data-field="n_reference"></td>
                            <td width="15%" class="text-center" style="border-right: 1px solid #c1c1c1" data-field="phone_reference"></td>
                            <td width="15%" class="text-center" style="border-right: 1px solid #c1c1c1" data-field="amount"></td>
                            <td width="15%" class="text-center" style="border-right: 1px solid #c1c1c1" data-field="status"></td>
                            <td width="15%" class="text-center actions" data-field="rowId">
                                <button type="button" value="confirm" class="button-action-payment button-table button-success" title="Confirmar Pago">
                                    <i class="fa-solid fa-check" style="pointer-events: none !important"></i>
                                </button>

                                <button type="button" value="reject" class="button-action-payment button-table button-cancel" title="Rechazar Pago">
                                    <i class="fa-solid fa-ban" style="pointer-events: none !important"></i>
                                </button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </form>
    </div>
</div>