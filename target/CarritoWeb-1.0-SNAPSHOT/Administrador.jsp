<%@page import="ar.com.alan.CarritoWeb.model.entities.Usuarios"%>

<%
    Usuarios usuario = null;

    try {
        usuario = (Usuarios) session.getAttribute("usuario");

    } catch (NullPointerException ex) {
        System.out.println("No hay usuario");
    }
%>

<%             String nombreUsuario = request.getParameter("txtemail");
%>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<!-- Google Fonts -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.18.0/css/mdb.min.css" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="css/style.css">
<header>
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
                    <li class="nav-item active">
                        <a class="nav-link" href="./login">Inicio
                            <span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./productos">Productos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="NuevoProducto.jsp"><i class="fas fa-plus-circle"></i> Alta de Productos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="clientes.jsp"><i class="fas fa-plus-circle"></i></i>Alta de Clientes</a>
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
                
            </div>

        </div>
    </nav>
</header>

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