<script type="text/javascript">
    // Función para validar la fecha y hora
    document.getElementById("contact_fecha").addEventListener("change", validateDateAndTime);
    document.getElementById("contact_hora").addEventListener("change", validateDateAndTime);

    // Función para validar la cantidad de personas
    document.getElementById("contac_people").addEventListener("input", updateTotal);
    document.getElementById("contact_add").addEventListener("input", updateTotal);

    // Función para actualizar el total de personas
    function updateTotal() {
        let contactPeople = parseInt(document.getElementById("contac_people").value) || 0;
    let contactAdd = parseInt(document.getElementById("contact_add").value) || 0;
    let total = contactPeople + contactAdd;
    document.getElementById("total").value = total;
    }

    // Función para validar la fecha y hora de la reservación
    function validateDateAndTime() {
        let date = document.getElementById("contact_fecha").value;
    let time = document.getElementById("contact_hora").value;
    let currentDate = new Date();
    let reservationDate = new Date(date + ' ' + time);

    // Si la fecha es hoy, verificar la diferencia de tiempo
    if (date === getCurrentDateString()) {
        // Si la reservación es para hoy y el tiempo es menos de 2 horas de anticipación
        let diffInHours = (reservationDate - currentDate) / (1000 * 60 * 60);
    if (diffInHours < 2) {
        Swal.fire({
            icon: 'error',
            title: '¡Error!',
            text: 'La reservación debe realizarse con al menos 2 horas de antelación.',
        });
    return;
            }
    // Validación de la hora mínima para el mediodía
    let hour = parseInt(time.split(':')[0]);
    if (hour === 12 && diffInHours < 2) {
        Swal.fire({
            icon: 'error',
            title: '¡Error!',
            text: 'Si la reservación es para medio día, debe realizarse como mínimo a las 2 PM.',
        });
    return;
            }
        }

    // Si la fecha es para otro día, se puede hacer la reservación en el horario permitido
    let validHours = reservationDate.getHours();
    if (validHours < 8 || validHours > 19) {
        Swal.fire({
            icon: 'error',
            title: '¡Error!',
            text: 'La hora de la reservación debe estar entre las 08:00 AM y las 07:00 PM.',
        });
    return;
        }
    }

    // Función para obtener la fecha de hoy en formato YYYY-MM-DD
    function getCurrentDateString() {
        let today = new Date();
    let dd = String(today.getDate()).padStart(2, '0');
    let mm = String(today.getMonth() + 1).padStart(2, '0');
    let yyyy = today.getFullYear();
    return yyyy + '-' + mm + '-' + dd;
    }

    // Validar el número de personas cuando se presiona el botón de "Reservar"
    document.getElementById("miBoton").addEventListener("click", function(e) {
        e.preventDefault(); // Evitar el envío del formulario para validaciones

    let contactPeople = parseInt(document.getElementById("contac_people").value) || 0;
    let contactAdd = parseInt(document.getElementById("contact_add").value) || 0;

    // Validar número de personas
    if (contactPeople < 1 || contactPeople > 8 || contactAdd < 0 || contactAdd > 4) {
        Swal.fire({
            icon: 'error',
            title: '¡Error!',
            text: 'El número de personas debe ser entre 1 y 8, y las personas adicionales entre 0 y 4.',
        });
    return;
        }

    // Si la validación es exitosa, mostrar mensaje de éxito
    Swal.fire({
        icon: 'success',
    title: '¡Reservación Exitosa!',
    text: 'Tu reservación ha sido realizada correctamente.',
        });

    // validar en timpo real el numero de personas
    //const cajaimprimir = document.getElementById('total');
    // Usamos el evento 'input' para detectar cuando el usuario escribe en tiempo real
    //cajaimprimir.addEventListener('input', function() {

     //   let suma =  contactPeople + contactAdd; 
        // Actualizamos el contenido de la caja de resultados con el valor que el usuario está escribiendo
       // total.textContent = cajaimprimir.value;
//});


    });
</script>
