const D = document;
const W = window;
const storagePath = "{{ asset('storage') }}";
const inputsAmount = D.querySelectorAll('.amount');

/* Modal */
let currentModal;

function toggleModal(action, modal, otherInformation = null) {
    const tagModal = D.querySelector(`#${modal}`),
          tagOtherInformation = tagModal.querySelector('.other_information');

    tagModal.querySelectorAll('input').forEach(input => input.value = '');
    
    tagModal.style.display = action;
    currentModal = modal;

    if (otherInformation != null) tagOtherInformation.value = otherInformation;
}

function swalMessage(message, type) {
    Swal.fire({
        text: message,
        icon: type,
        confirmButtonColor: '#2b7a78',
        confirmButtonText: 'Aceptar',
        timer: 2500
    });
}

function swalMessageWithQuestion(message, type, appearTitle = true) {
    return Swal.fire({
        title: appearTitle ? '¿Estás seguro?' : undefined,
        text: message,
        icon: type,
        showCancelButton: true,
        confirmButtonColor: '#2b7a78',
        cancelButtonColor: '#17252a',
        confirmButtonText: 'Sí, continuar',
        cancelButtonText: 'Cancelar'
    });
}

async function getStates(stateIdSelected = null) {
    const states = $('.state-select');

    const DATA = {
        method: 'POST',
        headers: {
            'X-CSRF-TOKEN': D.querySelector('meta[name="csrf-token"]').content,
            'Accept': 'application/json',  // ← ESTA LÍNEA ES CRUCIAL
            'X-Requested-With': 'XMLHttpRequest' // ← Tambien ayuda
        }
    };

    const response = await fetch('address/getStates', DATA);
    const data = await response.json();

    for (let i = 0; i < states.length; i++) {
        const select = states[i];
        select.innerHTML = '';
        const option = document.createElement('option');
        option.value = '';
        option.text = 'Seleccionar Estado';
        select.add(option);
        for (let j = 0; j < data.length; j++) {
            const option = document.createElement('option');
            option.value = data[j].id;
            option.text = data[j].estado;
            select.add(option);
        }
    }
}

async function getMunicipalities(stateTag) {
    const formData = new FormData();
    formData.append('stateId', stateTag.value);
    const DATA = {
        method: 'POST',
        headers: {
            'X-CSRF-TOKEN': D.querySelector('meta[name="csrf-token"]').content,
            'Accept': 'application/json',  // ← ESTA LÍNEA ES CRUCIAL
            'X-Requested-With': 'XMLHttpRequest' // ← Tambien ayuda
        },
        body: formData
    };

    const response = await fetch('address/getMunicipalities', DATA);
    const data = await response.json();

    const select = D.querySelector(`.municipality-select[data-state="${stateTag.id}"]`);
    select.innerHTML = '';
    const option = document.createElement('option');
    option.value = '';
    option.text = 'Seleccionar municipio';
    select.add(option);
    for (let j = 0; j < data.length; j++) {
        const option = document.createElement('option');
        option.value = data[j].id;
        option.text = data[j].municipio;
        select.add(option);
    }
}

async function getParish(municipalityTag) {
    const formData = new FormData();
    formData.append('municipalityId', municipalityTag.value);
    const DATA = {
        method: 'POST',
        headers: {
            'X-CSRF-TOKEN': D.querySelector('meta[name="csrf-token"]').content,
            'Accept': 'application/json',  // ← ESTA LÍNEA ES CRUCIAL
            'X-Requested-With': 'XMLHttpRequest' // ← Tambien ayuda
        },
        body: formData
    };

    const response = await fetch('address/getParishes', DATA);
    const data = await response.json();

    const select = D.querySelector(`.parish-select[data-municipality="${municipalityTag.id}"]`);
    select.innerHTML = '';
    const option = document.createElement('option');
    option.value = '';
    option.text = 'Seleccionar Parroquia';
    select.add(option);
    for (let j = 0; j < data.length; j++) {
        const option = document.createElement('option');
        option.value = data[j].id;
        option.text = data[j].parroquia;
        select.add(option);
    }
}

function cleanInput(button) {
    if(button.classList.contains('btnModal')) {
        const tagModal = D.querySelector(`#${button.dataset.modalId}`);
        tagModal.querySelectorAll('input, textarea, select').forEach(input => {
            input.value = '';
            input.disabled = false;
        });
    }
}

function getInformationReservation(reservationId, type = 'edit') {
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

    const getInformation = fetch('reservation/getInformationReservation', DATA);
    getInformation.then(res => res.json()).then(res => {
        if(res.type == 'success') editReservation(res.data, type);
    });
}

async function editReservation(reservation, type = 'edit') {
    toggleModal('flex', 'newReserve', reservation.id);

    const modalReservation = D.querySelector('#newReserve');
    modalReservation.querySelectorAll('input, textarea, select').forEach(input => {
        input.disabled = type == 'show' ? true : false;
        input.value = '';   
    });

    modalReservation.querySelector('#scout_name').value = reservation?.group_name;
    modalReservation.querySelector('#start_date').value = reservation?.start_date;
    modalReservation.querySelector('#end_date').value = reservation?.end_date;
    modalReservation.querySelector('#n_guests').value = reservation?.n_guest;
    modalReservation.querySelector('#name_responsable').value = reservation?.responsible_name;
    modalReservation.querySelector('#email_responsable').value = reservation?.responsible_email;
    modalReservation.querySelector('#estado_responsable').value = reservation?.state?.id;
    await getMunicipalities(modalReservation.querySelector('#estado_responsable'));
    modalReservation.querySelector('#municipio_responsable').value = reservation?.municipality?.id;
    await getParish(modalReservation.querySelector('#municipio_responsable'));
    modalReservation.querySelector('#parroquia_responsable').value = reservation?.parish?.id;
    modalReservation.querySelector('#address').value = reservation?.address;
    modalReservation.querySelector('.other_information').value = reservation?.id;
    modalReservation.querySelector('#buttonReserve').innerHTML = "Guardar cambios";
}


$(document).ready(function() {
    // Esta configuración se aplicará a TODOS los formularios validados
    if ($.validator) {
        $.validator.setDefaults({
            errorClass: 'is-invalid',
            validClass: 'is-valid',
            errorElement: 'div',
            highlight: function(element) {
                $(element).addClass('is-invalid').removeClass('is-valid');
                $(element).closest('.form-group').addClass('has-error');
            },
            unhighlight: function(element) {
                $(element).removeClass('is-invalid').addClass('is-valid');
                $(element).closest('.form-group').removeClass('has-error');
            },
            errorPlacement: function(error, element) {
                if (element.parent('.input-group').length) {
                    error.insertAfter(element.parent());
                } else if (element.prop('type') === 'radio' || element.prop('type') === 'checkbox') {
                    error.appendTo(element.closest('.form-group'));
                } else {
                    error.insertAfter(element);
                }
                error.addClass('invalid-feedback');
            }
        });
    }

    // OBTENER LOS ESTADOS PARA EL SELECT
    getStates();
});

W.addEventListener('click', (e) => {
    if(e.target.matches('.btnModal')) toggleModal('flex', e.target.dataset.modalId);
    if(e.target.matches('.btnCerrar')) toggleModal('none', e.target.dataset.modalClose);
    
    const modal = document.getElementById(currentModal);
    if (e.target === modal) modal.style.display = 'none';
});


inputsAmount.forEach(input => {
    input.addEventListener('input', function (e) {
        let value = input.value;
        
        // 1. Eliminar todo lo que no sea número
        value = value.replace(/\D/g, "");
        
        // 2. Convertir a formato decimal (centavos)
        // Dividimos por 100 para que los últimos 2 dígitos sean decimales
        let options = { minimumFractionDigits: 2, maximumFractionDigits: 2 };
        let formattedValue = new Intl.NumberFormat('de-DE', options).format(
            parseFloat(value) / 100
        );
        
        // 3. Si el valor es NaN (está vacío), limpiar el input
        if (value === "") input.value = "";
        else input.value = formattedValue;
    })
})

// Expresion para formato de monto
/* D.getElementById('amount')?.addEventListener('input', function (e) {
    let value = e.target.value;
    
    // 1. Eliminar todo lo que no sea número
    value = value.replace(/\D/g, "");
    
    // 2. Convertir a formato decimal (centavos)
    // Dividimos por 100 para que los últimos 2 dígitos sean decimales
    let options = { minimumFractionDigits: 2, maximumFractionDigits: 2 };
    let formattedValue = new Intl.NumberFormat('de-DE', options).format(
        parseFloat(value) / 100
    );
    
    // 3. Si el valor es NaN (está vacío), limpiar el input
    if (value === "") e.target.value = "";
    else e.target.value = formattedValue;
}); */

D.addEventListener('change', (e) => {
    if(e.target.matches('.state-select')) {
        getMunicipalities(e.target);
    }
    if(e.target.matches('.municipality-select')) {
        getParish(e.target);
    }
});