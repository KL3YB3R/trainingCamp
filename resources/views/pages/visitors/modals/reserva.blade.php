<div id="newReserve" class="modal-overlay">
    <div class="modal-content">
        <div class="modal-header">
            <span>Nueva Reserva</span>
            <span class="btnCerrar" data-modal-close="newReserve" style="cursor: pointer; font-size: 24px;">&times;</span>
        </div>
        <form action="" id="formReservation" method="POST" class="modal-body" style="overflow-y: auto !important">
            @csrf

            <input type="hidden" class="other_information" name="reservation_id">

            <aside class="d-flex flex-column h-100" style="flex: 1;">
                <label for="scout_name" style="margin-top: 0 !important">Nombre del Grupo Scout</label>
                <input id="scout_name" type="text" name="scout_name" 
                    class="form-control" required>
            </aside>
            
            <article class="grid grid-flow-col gap-4">
                <aside>
                    <label for="start_date">Fecha de Entrada</label>
                    <input id="start_date" type="date" name="start_date" class="" required>
                </aside>
                <aside>
                    <label for="end_date">Fecha de Salida</label>
                    <input id="end_date" type="date" name="end_date" class="" required>
                </aside>
            </article>

            <article class="grid grid-flow-col gap-4 items-stretch d-flex">
    
                <aside class="d-flex flex-column h-100" style="flex: 1;">
                    <label for="n_guests">N° de Huéspedes</label>
                    <input id="n_guests" type="text" name="n_guests" 
                        class="form-control" required>
                    <span style="color: black; font-size: 13px; font-weight: 500;">Aforo disponible: <span style="color: rgb(4, 112, 27)">{{$aforo->n_aforo - $aforo->n_occupied}}</span></span>
                </aside>

                <aside class="d-flex flex-column h-100" style="flex: 1;">
                    <label for="name_responsable">Nombre del Responsable</label>
                    <input id="name_responsable" type="text" name="name_responsable" 
                        class="form-control" required>
                </aside>
            </article>

            <aside class="d-flex flex-column h-100 mb-6" style="flex: 1;">
                <label for="email_responsable">Email del Responsable</label>
                <input id="email_responsable" type="email" name="email_responsable" 
                    class="form-control" required>
            </aside>

            <aside class="d-flex flex-column h-100 mb-6" style="flex: 1;">
                <label for="estado_responsable">Estado</label>
                <select name="estado_responsable" id="estado_responsable" class="custom-select state-select">
                    <option value="">-- SELECCIONE --</option>
                </select>
            </aside>

            <aside class="d-flex flex-column h-100 mb-6" style="flex: 1;">
                <label for="municipio_responsable">Municipio</label>
                <select name="municipio_responsable" id="municipio_responsable" class="custom-select municipality-select" data-state="estado_responsable">
                    <option value="">-- SELECCIONE --</option>
                </select>
            </aside>

            <aside class="d-flex flex-column h-100 mb-6" style="flex: 1;">
                <label for="parroquia_responsable">Parroquia</label>
                <select name="parroquia_responsable" id="parroquia_responsable" class="custom-select parish-select" data-municipality="municipio_responsable">
                    <option value="">-- SELECCIONE --</option>
                </select>
            </aside>

            <aside class="d-flex flex-column h-100 mb-6" style="flex: 1;">
                <label for="address">Dirección</label>
                <textarea name="address" id="address" rows="3" placeholder="Av. / Edf. / Casa"></textarea>
            </aside>

            <button type="submit" class="button-primary" style=" color: white; border: none; padding: 10px 20px; border-radius: 4px; cursor: pointer; width: 100%;" id="buttonReserve">
                Guardar Reserva
            </button>
        </form>
    </div>
</div>