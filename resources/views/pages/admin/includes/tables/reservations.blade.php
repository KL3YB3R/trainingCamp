<div id="reservations-container" style="display: none;">
    <div class="section-heading" style="margin-bottom:12px;">
        <h2>Reservaciones</h2>
        <span class="decor" aria-hidden="true"></span>
    </div>

    {{-- <button data-modal-id="newReserve" type="button" class="btnModal p-3 button button-primary mt-10 mb-2" style="background-color: #2b7a78; color: white; border: none; cursor: pointer;">
        <i class="fa-solid fa-plus"></i> Nueva Reserva
    </button> --}}

    <form id="form_search_reservations" class="critetios-container">
        <h2>Criterios de Búsqueda</h2>
        <hr>

        <div class="inputs-container">
            <aside class="" style="width: 100%">
                <label for="start_date_search" style="margin-top: 0 !important">Fecha de Ingreso</label>
                <input id="start_date_search" type="date" name="start_date_search" 
                    class="form-control" placeholder="dd / mm / aaaa">
            </aside>
            <aside class="" style="width: 100%">
                <label for="end_date_search" style="margin-top: 0 !important">Fecha de Salida</label>
                <input id="end_date_search" type="date" name="end_date_search" 
                    class="form-control" placeholder="dd / mm / aaaa">
            </aside>
            {{-- <aside class="" style="width: 100%">
                <label for="group_name_search" style="margin-top: 0 !important">Nombre del Grupo</label>
                <input id="group_name_search" type="text" name="group_name_search" 
                    class="form-control" placeholder="Ingrese el Nombre del Grupo">
            </aside> --}}
            <aside class="" style="width: 100%">
                <label for="status_search" style="margin-top: 0 !important">Estatus</label>
                <select name="status_search" id="status_search" class="custom-select" style="margin-top: 5px">
                    <option value="" selected>-- SELECCIONE --</option>
                    @foreach ($statusReservations as $estatus)
                        <option value="{{$estatus->id}}">{{$estatus->name}}</option>                        
                    @endforeach
                </select>
            </aside>
        </div>

        <button id="search_users" type="submit" class="p-3 button button-primary mt-10 mb-2" style="background-color: #2b7a78; color: white; border: none; cursor: pointer;" data-action="search">
            <i class="fa-solid fa-magnifying-glass"></i> Buscar
        </button>
        <button id="search_users" type="submit" class="p-3 button button-secondary mt-10 mb-2" style="color: white; border: none; cursor: pointer;" data-action="reset">
            <i class="fa-solid fa-calendar-check"></i> Ver todos
        </button>
    </form>

    <div class="table-container" style="margin-top: 5rem">
        <table id="table_reservations" class="custom-table">
            <thead>
                <th class="">Fecha de Ingreso</th>
                <th>Fecha de Salida</th>
                <th>Cantidad de Huespedes</th>
                <th>Nombre de Grupo</th>
                <th>Monto (Bs.)</th>
                <th>Estatus</th>
                <th>Acciones</th>
            </thead>
            <tbody id="body_reservations">
                <tr class="template-row" style="display: none;">
                    <td class="text-center" style="border-right: 1px solid #c1c1c1" data-field="start_date"></td>
                    <td class="text-center" style="border-right: 1px solid #c1c1c1" data-field="end_date"></td>
                    <td class="text-center" style="border-right: 1px solid #c1c1c1" data-field="n_guest"></td>
                    <td class="text-center" style="border-right: 1px solid #c1c1c1" data-field="group_name"></td>
                    <td class="text-center" style="border-right: 1px solid #c1c1c1" data-field="amount"></td>
                    <td class="text-center" style="border-right: 1px solid #c1c1c1" data-field="status"></td>
                    <td class="text-center actions" data-field="rowId">
                        <button type="button" data-modal-id="showPayments" id="buttonShowPayments" class="button-table btnModal button-success" title="Ver pagos" onclick="getPayments(this)">
                            <i class="fa-solid fa-hand-holding-dollar" style="pointer-events: none !important"></i>
                        </button>
                        <button type="button" class="button-table button-muted ms-1 mb-1" title="Ver Información" onclick="showInformationReservation(this)">
                            <i class="fa-solid fa-list" style="pointer-events: none;"></i>
                        </button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    
</div>