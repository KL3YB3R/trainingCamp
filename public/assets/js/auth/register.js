// ! VARIABLES, SIEMPRE ACA USEN CONST PARA LAS VARIABLES QUE NO SERAN CAMBIADAS A LO LARGO DEL CODIGO Y LET PARA LAS VARIABLES QUE SI SERAN CAMBIADAS



// ! ESTA SERA LA SECCION PARA COLOCAR TODAS LAS FUNCIONES DEL ARCHIVO

async function registerUser(form){
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
        confirmButtonColor: '#006B3F',
        confirmButtonText: 'Aceptar',
        timer: 2500
    });

    if(type == "success") {
        setTimeout(() => {
            window.location.href = '/login';
        }, 2500);
    }
}


// ! ESTA SERA LA SECCION PARA INTEGRAR LOS EVENTOS
// TODO: ESTE EVENTO CAPTURA EL ENVIO DEL FORMULARIO DEL REGISTRO, PARA NO RECARGAR LA PAGINA SE COLOCARA POR ACA
D.addEventListener('submit', (e) => {
    // TODO: SE VALIDA EL FORMULARIO POR EL ID
    if(e.target.id == 'formRegister'){
        // TODO: ESTA LINEA HACE QUE NO SE RECARGUE LA PAGINA CUANDO SE ENVIA EL FORMULARIO
        e.preventDefault()
        // TODO: SE ENVIA A UNA FUNCION PARA ENVIAR EL FORMULARIO
        registerUser(e.target);
    }
    
})