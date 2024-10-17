const id_carpeta = document.querySelector('#id_carpeta');
let tbl;
document.addEventListener('DOMContentLoaded', function(){
    tbl = $('#tblComentario').DataTable({
        ajax: {
            url: base_url + 'admin/listarcomentario/' + id_carpeta.value,
            dataSrc: ''
        },
        columns: [
            { data: 'Correo' },
            { data: 'Servicios' },
            { data: 'Fecha y horario del servicio' },
            { data: 'Rol'}

        ],
        language : {
            url : 'https://cdn.datatables.net/plug-ins/1.13.1/i18n/es-ES.json'
        },
        responsive: true,
        destroy: true,
        order: [[1, 'desc']],
    });
})
