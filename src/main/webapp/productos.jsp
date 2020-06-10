<%@page import="ar.com.alan.CarritoWeb.model.entities.Usuarios"%>
<%@page import="ar.com.alan.CarritoWeb.model.entities.Producto"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    ArrayList<Producto> productos = (ArrayList<Producto>) request.getAttribute("productos");

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <!-- Google Fonts -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
        <!-- Bootstrap core CSS -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
        <!-- Material Design Bootstrap -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.18.0/css/mdb.min.css" rel="stylesheet">

        <link rel="stylesheet" type="text/css" href="css/style.css">
        <%            Usuarios usuario = (Usuarios) request.getAttribute("usuario");
        %>
    </head>
    <body>
        <%
            String nombreUsuario = request.getParameter("txtemail");
        %>
        <nav class="navbar fixed-top navbar-expand-lg navbar-dark purple scrolling-navbar">
            <div class="container">

                <!-- Brand -->
                <a class="navbar-brand" href="https://mdbootstrap.com/material-design-for-bootstrap/" target="_blank">
                    <strong>MDB</strong>
                </a>

                <!-- Collapse -->
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <!-- Links -->
                <div class="collapse navbar-collapse" id="navbarSupportedContent">

                    <!-- Left -->
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="#">Iniciar 
                                <span class="sr-only">(current)</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="./productos">Productos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="https://mdbootstrap.com/getting-started/" target="_blank"><i class="fas fa-plus-circle"></i> Ofertas del Dia</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="https://mdbootstrap.com/bootstrap-tutorial/" target="_blank"><i class="fas fa-cart-plus"></i>Carrito</a>
                        </li>

                    </ul>
                    <ul class="navbar-nav nav-flex-icons">

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink-333" data-toggle="dropdown"
                               aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-user"><%=nombreUsuario%></i>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right dropdown-default"
                                 aria-labelledby="navbarDropdownMenuLink-333">
                                <a class="dropdown-item" href="Micuenta">Mi Cuenta</a>
                                <a class="dropdown-item" href="logout">Cerrar Sesion</a>

                            </div>
                        </li>
                    </ul>    
                    </nav>

                    <div class="" style="margin-top: 100px">
                        <div class="container mt-4">

                            <div class="row">
                                <%
                                    for (Producto unProducto : productos) {
                                %>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <div class="card">
                                            <div class="card-header text-center">
                                                <label class="col-sm-12">
                                                    <%= unProducto.getNombre()%>
                                                </label>                                    
                                            </div>
                                            <div class="card-body text-center ">

                                                <img src="<%= unProducto.getImagen()%> width="190" height="180">
                                                <a>
                                                    <div class="mask rgba-white-slight"></div>
                                                </a>
                                            </div>
                                            <div class="card-footer">
                                                <div class="col-sm-12 text-center">
                                                    <h2 class="card-se">$
                                                        <%= unProducto.getPrecio()%>
                                                    </h2>                                   
                                                </div>
                                                <div class=" col-sm-12 text-center">                                
                                                    <a href="#" name="articulos" class="btn btn2 btn-outline-primary">Agregar a Carrito<i class="fas fa-cart-plus"></i></a>
                                                    <a href="#" class="btn btn-green">Comprar</a>
                                                </div>                         
                                            </div>
                                        </div>

                                    </div>

                                </div>
                                <%
                                    }
                                %>
                            </div>
                        </div>
                    </div>

                    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
                    <!-- Bootstrap tooltips -->
                    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
                    <!-- Bootstrap core JavaScript -->
                    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/js/bootstrap.min.js"></script>
                    <!-- MDB core JavaScript -->
                    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.18.0/js/mdb.min.js"></script>

                    <script type="text/javascript">
                        new WOW().init();

                    </script>                            

                    </body>
                    </html>
