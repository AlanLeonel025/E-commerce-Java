<%@page import="ar.com.alan.CarritoWeb.model.entities.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Alta Clientes</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

        <link rel="stylesheet" href="css/estilo.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <!-- Google Fonts -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
        <!-- Bootstrap core CSS -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
        <!-- Material Design Bootstrap -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.0/css/mdb.min.css" rel="stylesheet">
    </head>

    <body>
        <%@include file="header.jsp" %>
        <div style="margin-top: 100px" class="row p-2">
            <div class="col">
                <button id="btn-nuevo" class="btn btn-primary">+Agregar</button>
            </div>

            <div class="col mt-3 d-flex justify-content-end">
                <input id="txt-search" class="w-50 pl-2" type="text" placeholder="Buscar cliente...">
            </div>

        </div>

        <table class="table">

            <thead class="mdb-color lighten-5">
                <tr>
                    <th class="font-weight-bold">#</th>
                    <th class="font-weight-bold">Nombre</th>
                    <th class="font-weight-bold">Apellido</th>
                    <th class="font-weight-bold">E-mail</th>
                    <th class="font-weight-bold">Acciones</th>
                </tr>
            </thead>

            <tbody id="contenedor"></tbody>

        </table>

        <!-- Modal Editor Cliente -->
        <div class="modal fade" id="modal-editor-cliente" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">

                        <h5 class="modal-title" id="titulo-modal-cliente">Nuevo cliente</h5>

                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>

                    </div>

                    <div class="modal-body">

                        <form>

                            <input id="id-cliente" type="hidden">

                            <div class="form-group">
                                <label for="nombre">Nombre</label> 
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">
                                            <i class="fa fa-address-book-o"></i>
                                        </div>
                                    </div> 
                                    <input id="nombre" name="nombre" type="text" required="required" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="apellido">Apellido</label> 
                                <input id="apellido" name="apellido" type="text" required="required" class="form-control">
                            </div>

                            <div class="form-group">
                                <label for="email">E-mail</label> 
                                <input id="email" name="email" type="email" required="required" class="form-control">
                            </div>

                        </form>

                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                        <button id="btn-guardar" type="button" class="btn btn-primary">Guardar</button>
                    </div>
                </div>
            </div>
        </div>


        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

        <script src="js/jsonintro.js"></script>
        <!-- JQuery -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <!-- Bootstrap tooltips -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
        <!-- Bootstrap core JavaScript -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <!-- MDB core JavaScript -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.0/js/mdb.min.js"></script>
    </body>

</html>
