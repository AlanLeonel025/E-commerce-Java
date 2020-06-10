<%@page import="ar.com.alan.CarritoWeb.model.DAO.ProductosDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ar.com.alan.CarritoWeb.model.entities.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    ArrayList<Producto> productos = ProductosDAO.getListadoDeProductos();;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CRUD productos</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
        <!-- Material Design Bootstrap -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.18.0/css/mdb.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <!-- Google Fonts -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
        <!-- Bootstrap core CSS -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
        <!-- Material Design Bootstrap -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.18.0/css/mdb.min.css" rel="stylesheet">
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="card">
            <div class="card-body">

                <!-- Shopping Cart table -->
                <div class="table-responsive">

                    <table class="table product-table">

                        <!-- Table head -->
                        <thead class="mdb-color lighten-5">
                            <tr>
                                <th class="font-weight-bold">
                                    <strong>Articulos</strong>
                                </th>
                                <th class="font-weight-bold">
                                    <strong>Producto</strong>
                                </th>
                                <th class="font-weight-bold">
                                    <strong>Precio</strong>
                                </th>
                                <th class="font-weight-bold">

                                    <strong style="margin-left: 50px;">Acciones</strong>
                                </th>

                        </thead>
                        <!-- /.Table head -->

                        <!-- Table body -->
                        <tbody>
                        <button type="button" class="btn btn-success btn-rounded">+Agregar</button>





                        <%                                for (Producto unProducto : productos) {
                        %>
                        <!-- First row -->
                        <tr>

                            <th scope="row">
                                <img src="<%= unProducto.getImagen()%>" alt="" class="img-fluid z-depth-0" style="width: 100px; height: 110px ">
                            </th>
                            <td>
                                <h5 class="mt-3">
                                    <strong><%= unProducto.getNombre()%></strong>
                                </h5>
                                <p class="text-muted"></p>
                            </td>
                            <td class="font-weight-bold">
                                <strong>$<%= unProducto.getPrecio()%></strong>
                            </td>

                            <td>
                                <button type="button" class="btn btn-sm btn-primary" data-toggle="tooltip" data-placement="top"
                                        title="Remove item">MOD
                                </button>
                                <button type="button" class="btn btn-sm btn-danger" data-toggle="tooltip" data-placement="top"
                                        title="Remove item">X
                                </button>
                            </td>
                        </tr>

                        <%
                            }
                        %>
                        <!-- /.First row -->

                        </tbody>
                        <!-- /.Table body -->

                    </table>

                </div>
                <!-- /.Shopping Cart table -->

            </div>

        </div>


        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <!-- Bootstrap tooltips -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
        <!-- Bootstrap core JavaScript -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/js/bootstrap.min.js"></script>
        <!-- MDB core JavaScript -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.18.0/js/mdb.min.js"></script>
    </body>
</html>
