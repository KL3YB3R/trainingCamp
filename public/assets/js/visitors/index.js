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