$(document).ready(function () {
    // Hacer que los elementos sean arrastrables
    $(".anime-item").on("dragstart", function (event) {
        event.originalEvent.dataTransfer.setData("text", event.target.id);
    });

    // Preparar las zonas de soltado
    $(".dropzone").on("dragover", function (event) {
        event.preventDefault();
        $(this).css("background-color", "#f8f8f8");
    });

    $(".dropzone").on("dragleave", function () {
        $(this).css("background-color", "transparent");
    });

    $(".dropzone").on("drop", function (event) {
        event.preventDefault();
        var droppedId = event.originalEvent.dataTransfer.getData("text");
        var droppedElement = $("#" + droppedId);

        // Verificar si la zona coincide con el personaje arrastrado
        if ((droppedId === "naruto" && this.id === "dropzone-1") ||
            (droppedId === "goku" && this.id === "dropzone-2") ||
            (droppedId === "luffy" && this.id === "dropzone-3")) {
            $(this).addClass("accepted");
            $(this).append(droppedElement);
            droppedElement.css("margin-top", "30px");
        } else {
            $(this).addClass("rejected");
            setTimeout(() => {
                $(this).removeClass("rejected");
            }, 1000);
        }

        $(this).css("background-color", "transparent");
    });
});