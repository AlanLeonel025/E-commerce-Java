const BASE_URL = 'http://localhost:8080/CarritoWeb';

let btnNewModal = document.getElementById('btn-nuevo');
btnNewModal.addEventListener('click', showNewModal);

let btnGuardar = document.getElementById('btn-guardar');
btnGuardar.addEventListener('click', guardarCliente);

let txtSearch = document.getElementById('txt-search');
txtSearch.addEventListener('keyup', buscarClientes);

function buscarClientes(){
    let url = BASE_URL + '/clientes';

    let terminoBuscado = txtSearch.value;

    let params = `?search=${terminoBuscado}`;

    fetch(url + params).then(
        response => response.json()
    ).then(
        jsonSearchResult => {
            generarTabla(jsonSearchResult.data);
        }
    )

}

function showNewModal(event){
    
    $('#titulo-modal-cliente').html("Nuevo cliente")

    let inputs = document.querySelectorAll('#modal-editor-cliente input');

    for(let i=0; i<inputs.length; i++){
        inputs[i].value = '';
    }

    $('#modal-editor-cliente').modal('show');

}

function showEditModal(event){
    
    let idCliente = event.currentTarget.getAttribute('data-cliente-id');

    getCliente(idCliente).then(
        json => {

            let dataCliente = json.data[0];

            $('#id-cliente').val(dataCliente.id);
            $('#nombre').val(dataCliente.nombre);
            $('#apellido').val(dataCliente.apellido);
            $('#email').val(dataCliente.email);

            $('#titulo-modal-cliente').html("Editar cliente")

            $('#modal-editor-cliente').modal('show');
        }
    )

}

function eliminarCliente(event){

    let idCliente = event.currentTarget.getAttribute('data-cliente-id');

    Swal.fire({
        title: '¿Confirma que desea eliminar el cliente seleccionado?',
        icon: 'question',
        showCancelButton: true,
        confirmButtonText: 'Eliminar',
        cancelButtonText: 'Cancelar'
    }).then(
        result =>{
            if (result.value){
                let url = BASE_URL + '/clientes?id=' + idCliente;

                fetch(url, 
                    { method: 'DELETE' }).then(
                        response => response.json()
                    ).then(
                        data =>{

                            Swal.fire({
                                title: 'Eliminado',
                                text: data.message,
                                icon: 'success',
                                confirmButtonText: 'Aceptar'
                            })

                            cargarListadoDeClientes();
                        }
                    )     
            }
        }
        
    )




}

function cargarListadoDeClientes(){
    getClientes().then(
        json => {
            generarTabla(json.data);
        }
    );
}

async function getClientes(){
    let url = BASE_URL + '/clientes';

    let response = await fetch(url);
    let json     = await response.json();

    return json;
}

async function getCliente(id){
    let url = BASE_URL + '/clientes?id=' + id;

    let response = await fetch(url);
    let json     = await response.json();

    return json;
}

function generarTabla(data){
    let container = document.getElementById('contenedor');

    let contenidoHTML = '';

    for( cliente of data){
        contenidoHTML += `
                            <tr>
                                <td>${cliente.id}</td>
                                <td>${cliente.nombre}</td>
                                <td>${cliente.apellido}</td>
                                <td>${cliente.email}</td>

                                <td>
                                    <button data-cliente-id="${cliente.id}" class="btn-editar btn btn-success">
                                        <i class="fa fa-edit"></i>
                                    </button>
                                    <button data-cliente-id="${cliente.id}" class="btn-eliminar btn btn-danger">
                                        <i class="fa fa-trash"></i>
                                    </button>
                                </td>
                            </tr>
                         `
    }

    container.innerHTML = contenidoHTML;

    $('.btn-editar').click(showEditModal);
    $('.btn-eliminar').click(eliminarCliente);  
}

function guardarCliente(){
    let url = BASE_URL + '/clientes';

    let nombreCliente   = $('#nombre').val();
    let apellidoCliente = document.getElementById('apellido').value;
    let emailCliente    = document.getElementById('email').value;

    let params = `?nombre=${nombreCliente}&apellido=${apellidoCliente}&email=${emailCliente}`;

    let method = 'POST';

    if ( $('#id-cliente').val() ){
        method = 'PUT';
        params += '&id=' + $('#id-cliente').val();
    }

    fetch(url + params, 
        {
            method : method
        }
    ).then(
        response => response.json()
    ).then(
        data=>{
            Swal.fire({
                title: 'Guardado',
                text:  data.message,
                icon: 'success',
                confirmButtonText: 'Aceptar'
            })

            cargarListadoDeClientes();

            $('#modal-editor-cliente').modal('hide');
        }
    )

}


cargarListadoDeClientes();

