<div id="showPayments" class="modal-overlay">
    <div class="modal-content width-xl">
        <div class="modal-header">
            <span>Histórico de Pagos</span>
            <span class="btnCerrar" data-modal-close="showPayments" style="cursor: pointer; font-size: 24px;">&times;</span>
        </div>
        <div class="modal-body">
            <table id="table_payments_history" class="custom-table">
                <thead>
                    {{-- <th class="">Fecha de Ingreso</th>
                    <th>Fecha de Salida</th>
                    <th>Nombre de Grupo</th> --}}
                    <th>N° de Referencia</th>
                    <th>Monto (Bs.)</th>
                    <th>Fecha de Pago</th>
                    <th>Estatus</th>
                </thead>
                <tbody id="body_payments_history">
                    <tr class="template-row" style="display: none;">
                        {{-- <td class="text-center" style="border-right: 1px solid #c1c1c1" data-field="checkin"></td>
                        <td class="text-center" style="border-right: 1px solid #c1c1c1" data-field="checkout"></td>
                        <td class="text-center" style="border-right: 1px solid #c1c1c1" data-field="group_name"></td> --}}
                        <td class="text-center" style="border-right: 1px solid #c1c1c1" data-field="n_reference"></td>
                        <td class="text-center" style="border-right: 1px solid #c1c1c1" data-field="amount"></td>
                        <td class="text-center" style="border-right: 1px solid #c1c1c1" data-field="payment_date"></td>
                        <td class="text-center" style="border-right: 1px solid #c1c1c1" data-field="status"></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>