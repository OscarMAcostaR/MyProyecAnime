// compruebo que mi reerencia este hecha 
console.log("hola desde google");

$(document).ready(function () {
    obtenerUbicacion();
});

//funcion para obtener la geolocalizacion
function obtenerUbicacion() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(mostrarUbicacion, mostrarError);
    } else {
        alert("la geolocalizacion no es soportada por este navegador")
    }
}

function mostrarUbicacion(position) {
    console.log(position);
    const lat = position.coords.latitude;
    const lon = position.coords.longitude;
    console.log("Latitud: " + lat + ", Longitud: " + lon);


    obtenerDireccion(lat, lon);


    initMapComponents(lat, lon);
}


function mostrarError(error) {
    switch (error.code) {
        case error.PERMISSION_DENIED:
            alert("El susario nego el permiso de ubicacion.");
            break;
        case error.POSITION.UNAVAIBLE:
            alert("La ubicaion noesta disponible.");
            break;
        case error.TIMEOUT:
            alert("Se agoto el timpo de espera.");
            break;
        default:
            alert("Error desconocido: " + error.message);
            break;

    }



}

function obtenerDireccion(lat, lon) {
    const latLng = { lat: lat, lng: lon };
    const geocoder = new google.maps.Geocoder();

    geocoder.geocode({ location: latLng }, function (results, status) {
        if (status === 'OK') {
            console.log(results)
            if (results[0]) {
                const direccion = results[0].formatted_address;
                document.getElementById('direccion').innerText = "Direccion: " + direccion;

            } else {
                alert("No se encontraron resultados de direccion");
            }
        } else {
            alert("Geocodificacion fallida: " + status);
        }
    })


}
function initMapComponents(lat, lon) {
    const ubicacion = { lat: lat, lng: lon };

    //inicializar el mapa
    const mapa = new google.maps.Map(document.getElementById("map"), {
        zoom: 15,
        center: ubicacion
    });

    new google.maps.Marker({
        position: ubicacion,
        map: mapa,
        title: "Ubicacion Actual"
    });

    const panorama = new google.maps.StreetViewPanorama(
        document.getElementById("street"), {
        position: ubicacion,
        pov: { heading: 90, pitch: 5 }
    }
    );


    mapa.setStreetView(panorama);

}