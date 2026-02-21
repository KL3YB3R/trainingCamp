<div id="payments-container" style="display: none;">
    <div class="section-heading" style="margin-bottom:12px;">
        <h2>Pagos</h2>
        <span class="decor" aria-hidden="true"></span>
    </div>

    <form id="form_search_payments" class="critetios-container">
        <h2>Criterios de Búsqueda</h2>
        <hr>

        <div class="inputs-container">
            <aside class="" style="width: 100%">
                <label for="start_date_search" style="margin-top: 0 !important">Fecha de pago Desde</label>
                <input id="start_date_search" type="date" name="start_date_search" 
                    class="form-control" placeholder="dd / mm / aaaa">
            </aside>
            <aside class="" style="width: 100%">
                <label for="end_date_search" style="margin-top: 0 !important">Fecha de pago Hasta</label>
                <input id="end_date_search" type="date" name="end_date_search" 
                    class="form-control" placeholder="dd / mm / aaaa">
            </aside>
            <aside class="" style="width: 100%">
                <label for="status_search" style="margin-top: 0 !important">Estatus</label>
                <select name="status_search" id="status_search" class="custom-select" style="margin-top: 5px">
                    <option value="" selected>-- SELECCIONE --</option>
                    @foreach ($statusPayments as $estatus)
                        <option value="{{$estatus->id}}">{{$estatus->name}}</option>                        
                    @endforeach
                </select>
            </aside>
        </div>

        <button id="search_users" type="submit" class="p-3 button button-primary mt-10 mb-2" style="background-color: #2b7a78; color: white; border: none; cursor: pointer;" data-action="search">
            <i class="fa-solid fa-magnifying-glass"></i> Buscar
        </button>
        <button id="search_users" type="submit" class="p-3 button button-secondary mt-10 mb-2" style="color: white; border: none; cursor: pointer;" data-action="reset">
            <i class="fa-solid fa-hand-holding-dollar"></i> Ver todos
        </button>
    </form>

    <div class="table-container" style="margin-top: 5rem">
        <table id="table_payments" class="custom-table">
            <thead>
                <th>Responsable</th>
                <th>Fecha de Pago</th>
                <th>N° de Referencia (últimos 6 dígitos)</th>
                <th>Teléfono de Referencia</th>
                <th>Monto (Bs.)</th>
                <th>Estatus</th>
                <th>Acciones</th>
            </thead>
            <tbody id="body_payments">
                <tr class="template-row" style="display: none;">
                    <td class="text-center" style="border-right: 1px solid #c1c1c1" data-field="responsible"></td>
                    <td class="text-center" style="border-right: 1px solid #c1c1c1" data-field="date_transfer"></td>
                    <td class="text-center" style="border-right: 1px solid #c1c1c1" data-field="n_reference"></td>
                    <td class="text-center" style="border-right: 1px solid #c1c1c1" data-field="phone_reference"></td>
                    <td class="text-center" style="border-right: 1px solid #c1c1c1" data-field="amount"></td>
                    <td class="text-center" style="border-right: 1px solid #c1c1c1" data-field="status"></td>
                    <td class="text-center actions" data-field="rowId">
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
    
</div>