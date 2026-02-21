const tableIdToHideButtonByStatus = [
    'table_payments',
    'table_payments_modal'
]

async function saveAforo(form) {
    const formData = new FormData(form);
    const DATA = {
        method: 'POST',
        body: formData,
        headers: {
            'X-CSRF-TOKEN': D.querySelector('meta[name="csrf-token"]').content,
            'Accept': 'application/json',
            'X-Requested-With': 'XMLHttpRequest'
        }
    };

    const saveRequest = await fetch('aforo/store', DATA);
    const {type, message} = await saveRequest.json();
    
    swalMessage(message, type);

    if(type == 'success') {
        setTimeout(() => {
            W.location.reload();
        }, 2500);
    }
}

function showDetails(container, callbackName = null) {
    const tagContainer = D.querySelector(`#${container}`);
    D.querySelectorAll('#containers-details > div').forEach((item) => item.style.display = 'none');

    if(tagContainer) {
        tagContainer.style.display = 'block';
        if (callbackName && typeof window[callbackName] === "function") window[callbackName](); 
    }
}

/* TABLAS DE DASHBOARD */

async function getUsers(form = null, type = null) {
    let formData;
    if(form != null) {
        if(type == 'reset') form.reset();
        formData = new FormData(form);
        
    } else formData = new FormData();
    const DATA = {
        method: 'POST',
        headers: {
            'X-CSRF-TOKEN': D.querySelector('meta[name="csrf-token"]').content,
            'Accept': 'application/json',
            'X-Requested-With': 'XMLHttpRequest'
        },
        body: formData
    }
    const response = await fetch('admin/getUsers', DATA);
    const data = await response.json();
    renderTable('table_users', data);
}

async function getReservations(form = null, type = null) {
    let formData;
    if(form != null) {
        if(type == 'reset') form.reset();
        formData = new FormData(form);
        
    } else formData = new FormData();

    const DATA = {
        method: 'POST',
        headers: {
            'X-CSRF-TOKEN': D.querySelector('meta[name="csrf-token"]').content,
            'Accept': 'application/json',
            'X-Requested-With': 'XMLHttpRequest'
        },
        body: formData
    }
    const response = await fetch('admin/getReservations', DATA);
    const data = await response.json();
    renderTable('table_reservations', data);
}

async function getPayments(button = null, form = null, type = null) {
    let formData;
    
    if (button != null) {
        formData = new FormData();
        formData.set('reservationId', button.dataset.id);
    }else {
        if (form instanceof HTMLFormElement) {
            if (type == 'reset') form.reset();
            formData = new FormData(form);
        } else {
            formData = new FormData();
        }
    }
    const DATA = {
        method: 'POST',
        headers: {
            'X-CSRF-TOKEN': D.querySelector('meta[name="csrf-token"]').content,
            'Accept': 'application/json',
            'X-Requested-With': 'XMLHttpRequest'
        },
        body: formData
    }
    const response = await fetch('admin/getPayments', DATA);
    const data = await response.json();

    if (button == null) renderTable('table_payments', data);
    else renderTable('table_payments_modal', data);
}

function renderTable(tableId, data) {
    const table = document.getElementById(tableId);
    const tbody = table.querySelector('tbody');
    const template = tbody.querySelector('.template-row');

    // 1. Limpiar filas viejas (excepto el template)
    const rows = tbody.querySelectorAll('tr:not(.template-row)');
    rows.forEach(row => row.remove());

    if (!data || data.length === 0) {
        const totalColumns = table.querySelector('thead tr').children.length;
        const emptyRow = document.createElement('tr');
        emptyRow.innerHTML = `
            <td colspan="${totalColumns}" style="text-align: center; padding: 20px; color: #718096; background: #f9fafb;">
                <i class="fa-solid fa-inbox" style="display: block; font-size: 1.5rem; margin-bottom: 8px;"></i>
                No se encontraron registros para mostrar
            </td>
        `;
        tbody.appendChild(emptyRow);
        return; // Finaliza la ejecución aquí
    }

    // 2. Procesar cada registro
    data.forEach(item => {
        const clone = template.cloneNode(true);
        clone.classList.remove('template-row');
        clone.style.display = ''; // Mostrar

        // 3. Llenado Dinámico: Busca cada celda que tenga data-field
        const fields = clone.querySelectorAll('[data-field]');
        fields.forEach(cell => {
            const fieldName = cell.getAttribute('data-field');
            // Asigna el valor dinámicamente si existe en el objeto
            if(fieldName != 'rowId') cell.textContent = item[fieldName] || '---';
            else {
                if (!item.id) {
                    cell.innerHTML = '---'; 
                    return; // Salimos de esta iteración
                }

                // 2. Capturamos los botones ANTES de evaluar el estatus
                const buttons = cell.querySelectorAll('.button-table');

                if (tableIdToHideButtonByStatus.includes(tableId)) {
                    // Si el estatus no es 1, ocultamos botones Y ponemos guiones
                    if (item.status_id && item.status_id != 1) {
                        buttons.forEach(btn => btn.remove()); // Los eliminamos del DOM
                        cell.innerHTML = '---'; // Ahora sí se verá el guion
                    }
                }

                // 3. Si después de la lógica anterior todavía hay botones, les ponemos el ID
                const remainingButtons = cell.querySelectorAll('.button-table');
                if (remainingButtons.length > 0) {
                    remainingButtons.forEach(btn => {
                        btn.dataset.id = item.id;
                    });
                } else if (cell.innerHTML.trim() === "") {
                    // Por si acaso la celda quedó vacía por error
                    cell.innerHTML = '---';
                }
            }
            
            // Si el campo es 'id', lo guardamos en el dataset del botón o fila
            if(item.id) clone.dataset.id = item.id;
        });

        tbody.appendChild(clone);
    });
}

/* ------------------------------------------------------------------ */

async function saveUser(form) {
    // TODO: ACA OBTENDREMOS LOS DATOS DEL FORMULARIO
    const formData = new FormData(form),
          DATA = {
            method: 'POST', 
            body: formData, 
            headers: {
                'X-CSRF-TOKEN': D.querySelector('meta[name="csrf-token"]').content,
                'Accept': 'application/json',  // ← ESTA LÍNEA ES CRUCIAL
                'X-Requested-With': 'XMLHttpRequest' // ← También ayuda
            }
        };
        
    // TODO: ACA ENVIAREMOS EL FORMULARIO
    const saveUser = await fetch('register/saveUser', DATA);

    // TODO: ACA OBTENDREMOS LA RESPUESTA
    const {type, message} = await saveUser.json();

    Swal.fire({
        text: message,
        icon: type,
        confirmButtonColor: '#2b7a78',
        confirmButtonText: 'Aceptar',
        timer: 2500
    });

    if(type == "success") {
        setTimeout(() => {
            W.location.reload();
        }, 2500);
    }
}

async function deleteUser(button) {
    let isSure = await swalMessageWithQuestion('Se eliminará el usuario', 'warning');
    // TODO: ACA OBTENDREMOS LOS DATOS DEL FORMULARIO
    if(isSure.isConfirmed) {
        const formData = new FormData();
        formData.append('userId', button.dataset.id);
        const DATA = {
                method: 'POST', 
                body: formData, 
                headers: {
                    'X-CSRF-TOKEN': D.querySelector('meta[name="csrf-token"]').content,
                    'Accept': 'application/json',  // ← ESTA LÍNEA ES CRUCIAL
                    'X-Requested-With': 'XMLHttpRequest' // ← También ayuda
                }
            };
    
            
        // TODO: ACA ENVIAREMOS EL FORMULARIO
        const saveUser = await fetch('admin/deleteUser', DATA);
    
        // TODO: ACA OBTENDREMOS LA RESPUESTA
        const {type, message} = await saveUser.json();
    
        Swal.fire({
            text: message,
            icon: type,
            confirmButtonColor: '#2b7a78',
            confirmButtonText: 'Aceptar',
            timer: 2500
        });
    
        if(type == "success") {
            setTimeout(() => {
                W.location.reload();
            }, 2500);
        }
    }
    
}

async function actionPayment(button) {
    let firstMessage = "Recuerde verificar los datos antes de ejecutar la acción",
        {isConfirmed} = await swalMessageWithQuestion(firstMessage, 'warning');
        parameters = {
            idPayment: button.dataset.id,
            action: button.value
        };

    if(isConfirmed) {
        updateStatusPayments(parameters);
        //if(button.value == 'confirm') swalPercentage();    
        //else return updateStatusPayments(parameters);
    }
}

function swalPercentage() {
    Swal.fire({
        title: '<span style="color: #17252a;">Actualizar Estado de Reserva</span>',
        html: `
            <div id="swal-payment-options" style="text-align: left; margin-top: 15px;">
                <label class="payment-option">
                    <input type="radio" name="pago" value="49">
                    <div class="option-icon"><i class="fa-solid fa-hourglass-start"></i></div>
                    <div class="option-text">
                        <b>Abono Parcial (Saldo < 50%)</b>
                        <small>La reserva sigue pendiente. No se descuenta del aforo.</small>
                    </div>
                </label>

                <label class="payment-option selected">
                    <input type="radio" name="pago" value="50" checked>
                    <div class="option-icon"><i class="fa-solid fa-user-check"></i></div>
                    <div class="option-text">
                        <b>Reserva Asegurada (Saldo > 50%)</b>
                        <small>El acumulado supera el mínimo. Se descuenta del aforo.</small>
                    </div>
                </label>

                <label class="payment-option">
                    <input type="radio" name="pago" value="100">
                    <div class="option-icon"><i class="fa-solid fa-hand-holding-dollar"></i></div>
                    <div class="option-text">
                        <b>Liquidación Total (100%)</b>
                        <small>Reserva pagada en su totalidad. Ocupa aforo.</small>
                    </div>
                </label>
            </div>
        `,
        didOpen: () => {
            // Lógica visual para resaltar la opción seleccionada
            const options = document.querySelectorAll('.payment-option');
            options.forEach(opt => {
                opt.addEventListener('click', () => {
                    options.forEach(o => o.classList.remove('selected'));
                    opt.classList.add('selected');
                });
            });
        },
        focusConfirm: false,
        confirmButtonColor: '#2b7a78',
        confirmButtonText: '<i class="fa-solid fa-check"></i> Confirmar Pago',
        showCancelButton: true,
        cancelButtonText: 'Cancelar',
        preConfirm: () => {
            return document.querySelector('input[name="pago"]:checked').value;
        }
    }).then((result) => {
        if (result.isConfirmed) {
            const valor = parseInt(result.value);
            parameters.percent = valor;
            parameters.occupy_spot = (valor >= 51);
            updateStatusPayments(parameters);
        }
    });

}

async function updateStatusPayments(parameters) {
    const formData = new FormData();
    Object.entries(parameters).forEach(([key, value]) => {
        formData.append(key, value);
    });
    const DATA = {
        method: 'POST', 
        body: formData, 
        headers: {
            'X-CSRF-TOKEN': D.querySelector('meta[name="csrf-token"]').content,
            'Accept': 'application/json',  // ← ESTA LÍNEA ES CRUCIAL
            'X-Requested-With': 'XMLHttpRequest' // ← Tambien ayuda
        }
    };
    const response = await fetch('admin/updateStatusPayments', DATA);
    const data = await response.json();

    const buttonShowPaymets = D.querySelector('#buttonShowPayments');

    Swal.fire({
        text: data.message,
        icon: data.type,
        confirmButtonColor: '#2b7a78',
        confirmButtonText: 'Aceptar',
        timer: 2500
    });
    
    if(data.type == 'success') {
        setTimeout(() => {
            W.location.reload();
        }, 2500);
    }

    //if(buttonShowPaymets != null) return getPayments(buttonShowPaymets);
}

function showInformationReservation(button) {
    const reservationId = button.dataset.id;
    toggleModal('flex', 'newReserve', reservationId);
    getInformationReservation(reservationId, 'show');
    const modalReservation = D.querySelector('#newReserve');
    modalReservation.querySelectorAll('input, textarea, select').forEach(input => input.disabled = true);
}

async function getInformationParameters() {
    const DATA = {
        method: 'POST', 
        headers: {
            'X-CSRF-TOKEN': D.querySelector('meta[name="csrf-token"]').content,
            'Accept': 'application/json',  // ← ESTA LÍNEA ES CRUCIAL
            'X-Requested-With': 'XMLHttpRequest' // ← Tambien ayuda
        }
    } 
    
    const getParameters = await fetch('admin/getParameters', DATA);
    const {id, tasa_dolar, amount_person, is_active, n_aforo} = await getParameters.json();

    D.querySelector('#new_aforo').value = n_aforo;
    D.querySelector('#tasa_dolar').value = tasa_dolar;
    D.querySelector('#amount_pay').value = amount_person;
}


D.addEventListener('submit', (e) => {
    if(e.target.id == "formEditAforo") {
        e.preventDefault();
        saveAforo(e.target);
    }

    if(e.target.id == "formNewUser") {
        e.preventDefault();
        saveUser(e.target);
    }

    if(e.target.id == "form_search_users") {
        e.preventDefault();
        getUsers(e.target, e.submitter.dataset.action);
    }

    if(e.target.id == "form_search_reservations") {
        e.preventDefault();
        getReservations(e.target, e.submitter.dataset.action);
    }

    if(e.target.id == "form_search_payments") {
        e.preventDefault();
        getPayments(null, e.target, e.submitter.dataset.action);
    }
})

D.addEventListener('click', (e) => {
    if(e.target.matches('.showDetails')) showDetails(e.target.dataset.container, e.target.dataset.function);
    if(e.target.matches('.button-action-payment')) actionPayment(e.target);
})