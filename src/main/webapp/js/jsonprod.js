const BASE_URL = 'http://localhost:8080/CarritoWeb';

let btnNewModal = document.getElementById('btn-nuevo');
btnNewModal.addEventListener('click', showNewModal);

let btnGuardar = document.getElementById('btn-guardar');
btnGuardar.addEventListener('click', guardarProducto);

let txtSearch = document.getElementById('txt-search');
txtSearch.addEventListener('keyup', buscarProducto);

function buscarProducto(){
    let url = BASE_URL + '/AltaProductoServlet';

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
    
    $('#titulo-modal-producto').html("Nuevo producto")

    let inputs = document.querySelectorAll('#modal-editor-producto input');

    for(let i=0; i<inputs.length; i++){
        inputs[i].value = '';
    }

    $('#modal-editor-producto').modal('show');

}

function showEditModal(event){
    
    let idProducto = event.currentTarget.getAttribute('data-producto-id');

    getProductosEdit(idProducto).then(
        json => {
    
            let dataProducto = json.data[0];

            $('#id-producto').val(dataProducto.id);
            $('#nombre').val(dataProducto.nombre);
            $('#precio').val(dataProducto.precio);
            $('#imagen').val(dataProducto.imagen);

            $('#titulo-modal-producto').html("Editar producto")

            $('#modal-editor-producto').modal('show');
        }
    )

}

function eliminarProducto(event){

    let idProducto = event.currentTarget.getAttribute('data-producto-id');

    Swal.fire({
        title: '¿Confirma que desea eliminar el producto?',
        icon: 'question',
        showCancelButton: true,
        confirmButtonText: 'Eliminar',
        cancelButtonText: 'Cancelar'
    }).then(
        result =>{
            if (result.value){
                let url = BASE_URL + '/AltaProductoServlet?id=' + idProductos;

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

                            cargarListadoDeProductos();
                        }
                    )     
            }
        }
        
    )




}

function cargarListadoDeProductos(){
    getProductos().then(
        
        json => {
            generarTabla(json.data);
            //console.log("dta =>",json)
        }
    );
}

async function getProductos(){
    let url = BASE_URL + '/AltaProductoServlet';

    let response = await fetch(url);
    let json     = await response.json();
    console.log("json=> ",json);
    return json;
}

async function getProductosEdit(id){
    let url = BASE_URL + '/AltaProductoServlet?id=' + id;

    let response = await fetch(url);
    let json     = await response.json();

    return json;
}

function generarTabla(data){
    let container = document.getElementById('contenedor');

    let contenidoHTML = '';

    for( producto of data){
        contenidoHTML += `
                            <tr>
                                <td>${producto.id}</td>
                                <td>${producto.nombre}</td>
                                <td>$${producto.precio}</td>
                                <td><img src ='${producto.imagen}' width='100' height ='100'/></td>

                                <td>
                                    <button data-producto-id="${producto.id}" class="btn-editar btn btn-success">
                                        <i class="fa fa-edit"></i>
                                    </button>
                                    <button data-producto-id="${producto.id}" class="btn-eliminar btn btn-danger">
                                        <i class="fa fa-trash"></i>
                                    </button>
                                </td>
                            </tr>
                         `
    }

    container.innerHTML = contenidoHTML;

    $('.btn-editar').click(showEditModal);
    $('.btn-eliminar').click(eliminarProducto);  
}

function guardarProducto(){
    let url = BASE_URL + '/AltaProductoServlet';

    let nombreProducto   = $('#nombre').val();
    let precioProducto = document.getElementById('precio').value;
    let imagenProducto    = document.getElementById('imagen').value;

    let params = `?nombre=${nombreProducto}&precio=${precioProducto}&imagen=${imagenProducto}`;

    let method = 'POST';

    if ( $('#id-producto').val() ){
        method = 'PUT';
        params += '&id=' + $('#id-producto').val();
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

            cargarListadoDeProductos();

            $('#modal-editor-producto').modal('hide');
        }
    )

}


cargarListadoDeProductos();

