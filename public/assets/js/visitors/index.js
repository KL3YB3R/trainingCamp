async function saveReservation(form) {
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

    const saveRequest = await fetch('reservation/store', DATA);
    const {type, message} = await saveRequest.json();
    
    swalMessage(message, type);

    setTimeout(() => {
        W.location.reload();
    }, 2500);
}

async function savePayReservation(form) {
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

    const saveRequest = await fetch('reservation/pay', DATA);
    const {type, message} = await saveRequest.json();
    
    swalMessage(message, type);

    if(type == 'success') {
        setTimeout(() => {
            W.location.reload();
        }, 2500);
    }
}

function showInformationReservation(reservationId) {
    toggleModal('flex', 'newReserve', reservationId);
    getInformationReservation(reservationId, 'show');
    const modalReservation = D.querySelector('#newReserve');
    modalReservation.querySelectorAll('input, textarea, select').forEach(input => input.disabled = true);
    modalReservation.querySelector('#buttonReserve').style.display = 'none';
}



async function deleteReservation(reservationId) {
    const message = 'Se eliminará la reservación';
          isConfirmed = await swalMessageWithQuestion(message, 'warning');

    if(isConfirmed) {
        const formData = new FormData();
        formData.set('reservationId', reservationId);
        const DATA = {
            method: 'POST',
            body: formData,
            headers: {
                'X-CSRF-TOKEN': D.querySelector('meta[name="csrf-token"]').content,
                'Accept': 'application/json',
                'X-Requested-With': 'XMLHttpRequest'
            }
        };

        const deleteReservation = await fetch('reservation/delete', DATA);
        const {type, message} = await deleteReservation.json();
        
        swalMessage(message, type);

        if(type == 'success') {
            setTimeout(() => {
                W.location.reload();
            }, 2500);
        }
    }
}

function showPayments(reservationId) {
    toggleModal('flex', 'showPayments');
    getPayments(reservationId);
}

async function getPayments(reservationId) {
    const formData = new FormData();
    formData.set('reservationId', reservationId);

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
    
    renderTable('table_payments_history', data)
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

        //clone.querySelector('[data-field="checkin"]').textContent = item.start_date_reservation;
        //clone.querySelector('[data-field="checkout"]').textContent = item.end_date_reservation;
        //clone.querySelector('[data-field="group_name"]').textContent = item.reservation.group_name;
        clone.querySelector('[data-field="n_reference"]').textContent = item.n_reference;
        clone.querySelector('[data-field="amount"]').textContent = item.amount;
        clone.querySelector('[data-field="payment_date"]').textContent = item.date_transfer;
        clone.querySelector('[data-field="status"]').textContent = item.status;

        tbody.appendChild(clone);
    });
}


D.addEventListener('submit', (e) => {
    if(e.target.id == "formReservation") {
        e.preventDefault();
        saveReservation(e.target);
    }

    if(e.target.id == "formPayReservation") {
        e.preventDefault();
        savePayReservation(e.target);
    }
})