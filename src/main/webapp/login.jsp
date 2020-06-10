<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ar.com.alan.CarritoWeb.model.entities.Usuarios"%>
<!DOCTYPE html>
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


        <%
            Usuarios usuario = (Usuarios) request.getAttribute("usuario");
        %>

    </head>
    <body>
        <!-- Navbar -->
        <nav class="navbar fixed-top navbar-expand-lg navbar-dark scrolling-navbar">
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

                    <!-- Right -->

                </div>

            </div>

            <!---------------------LOGIN------------->

            <div class="modal fade" id="modalLRForm" tabindex="-1" role="dialog" data-backdrop="false" aria-labelledby="myModalLabell" aria-hidden="true">
                <div class="modal-dialog cascading-modal" role="document">
                    <!--Content-->
                    <div class="modal-content">

                        <!--Modal cascading tabs-->
                        <div class="modal-c-tabs">

                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs md-tabs tabs-2 light-blue darken-3" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#panel7" role="tab"><i class="fas fa-user mr-1"></i>
                                        Login</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#panel8" role="tab"><i class="fas fa-user-plus mr-1"></i>
                                        Register</a>
                                </li>
                            </ul>

                            <!-- Tab panels -->

                            <div class="tab-content">
                                <!--Panel 7-->

                                <div class="tab-pane fade in show active" id="panel7" role="tabpanel">


                                    <style>
                                        .color{
                                            font: red;
                                        }
                                    </style>

                                    <!--Body-->
                                    <form action="login" method="POST">
                                        <div class="modal-body mb-1">
                                            <div class="md-form form-sm mb-5">
                                                <i class="fas fa-envelope prefix"></i>
                                                <input class ="color" type="email" id="modalLRInput10" name="txtemail" class="form-control form-control-sm validate">
                                                <label data-error="wrong" data-success="right" for="modalLRInput10">Your email</label>
                                            </div>

                                            <div class="md-form form-sm mb-4">
                                                <i class="fas fa-lock prefix"></i>
                                                <input class="color" type="password" id="modalLRInput11" name="txtclave" class="form-control form-control-sm validate">
                                                <label data-error="wrong" data-success="right" for="modalLRInput11">Your password</label>
                                            </div>

                                            <div class="text-center mt-2">
                                                <input class="btn btn-info" type="submit" value="INGRESAR">
                                            </div>

                                        </div>
                                    </form>


                                    <!--Footer-->
                                    <div class="modal-footer">
                                        <div class="options text-center text-md-right mt-1">
                                            <p>Not a member? <a href="#" class="blue-text">Sign Up</a></p>
                                            <p>Forgot <a href="#" class="blue-text">Password?</a></p>
                                        </div>
                                        <button type="button" class="btn btn-outline-info waves-effect ml-auto" data-dismiss="modal">Close</button>
                                    </div>

                                </div>

                                <!--/.Panel 7-->

                                <!--Panel 8-->
                                <div class="tab-pane fade" id="panel8" role="tabpanel">

                                    <!--Body-->
                                    <div class="modal-body">
                                        <div class="md-form form-sm mb-5">
                                            <i class="fas fa-envelope prefix"></i>
                                            <input type="email" id="modalLRInput12" class="form-control form-control-sm validate">
                                            <label data-error="wrong" data-success="right" for="modalLRInput12">Your email</label>
                                        </div>

                                        <div class="md-form form-sm mb-5">
                                            <i class="fas fa-lock prefix"></i>
                                            <input type="password" id="modalLRInput13" class="form-control form-control-sm validate">
                                            <label data-error="wrong" data-success="right" for="modalLRInput13">Your password</label>
                                        </div>

                                        <div class="md-form form-sm mb-4">
                                            <i class="fas fa-lock prefix"></i>
                                            <input type="password" id="modalLRInput14" class="form-control form-control-sm validate">
                                            <label data-error="wrong" data-success="right" for="modalLRInput14">Repeat password</label>
                                        </div>

                                        <div class="text-center form-sm mt-2">
                                            <button class="btn btn-info">Sign up <i class="fas fa-sign-in ml-1"></i></button>
                                        </div>

                                    </div>
                                    <!--Footer-->
                                    <div class="modal-footer">
                                        <div class="options text-right">
                                            <p class="pt-1">Already have an account?</p> <input class="blue-text" type="submit" value="Entrar">
                                        </div>
                                        <button type="button" class="btn btn-outline-info waves-effect ml-auto" data-dismiss="modal">Close</button>
                                    </div>
                                </div>
                                <!--/.Panel 8-->
                            </div>

                        </div>
                    </div>
                    <!--/.Content-->
                </div>
            </div>
            <!--Modal: Login / Register Form-->
            <div class="text-center">
                <a href="" class="btn btn-outline-white" data-toggle="modal" data-target="#modalLRForm">Iniciar Sesion</a>
            </div>

        </nav>

        <!-- Navbar -->

        <!-- Full Page Intro -->
        <!--Carousel Wrapper-->
        <div id="carousel-example-2" class="carousel slide carousel-fade" data-ride="carousel">
            <!--Indicators-->
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-2" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-2" data-slide-to="1"></li>
                <li data-target="#carousel-example-2" data-slide-to="2"></li>
            </ol>
            <!--/.Indicators-->
            <!--Slides-->

            <div class="carousel-inner" role="listbox">
                <div class="carousel-item active">
                    <div class="view">
                        <img class="d-block w-100" src="img/suple5.jpg"
                             alt="First slide">
                        <div class="mask rgba-black-light"></div>
                    </div>
                    <div class="carousel-caption">
                        <h3 class="h3-responsive"></h3>

                    </div>
                </div>
                <div class="carousel-item">
                    <!--Mask color-->
                    <div class="view">
                        <img class="d-block w-100" src="img/suple2.jpg"
                             alt="Second slide">

                    </div>
                    <div class="carousel-caption">

                    </div>
                </div>
                <div class="carousel-item">
                    <!--Mask color-->
                    <div class="view">
                        <img class="d-block w-100" src="img/suple4.jpg"
                             alt="Third slide">

                    </div>
                    <div class="carousel-caption">

                    </div>
                </div>
            </div>
            <!--/.Slides-->
            <!--Controls-->
            <a class="carousel-control-prev" href="#carousel-example-2" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carousel-example-2" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
            <!--/.Controls-->
        </div>
        <!--/.Carousel Wrapper-->


        <!--Main layout-->
        <main>
            <div class="container">

                <!--Section: Main info-->
                <section class="mt-5 wow fadeIn">

                    <!--Grid row-->
                    <div class="row">

                        <!--Grid column-->
                        <div class="col-md-6 mb-4">

                            <img src="img/suple3.jpg" class="img-fluid z-depth-1-half" alt="">

                        </div>
                        <!--Grid column-->

                        <!--Grid column-->
                        <div class="col-md-6 mb-4">

                            <!-- Main heading -->
                            <h3 class="h3 mb-3">NUEVA ADVANCED WHEY PROTEIN</h3>
                            <p>Qué es ADVANCED WHEY PROTEIN?
                                Es el blend de whey protein con mejor calidad y pureza del mercado, gracias a que contiene Whey Protein Isolate (WPI),la proteína de suero de mayor pureza a nivel mundial.

                            <p>Read details below to learn more about MDB.</p>
                            <!-- Main heading -->

                            <hr>

                            <p>
                                <strong>400+</strong> material UI elements,
                                <strong>600+</strong> material icons,
                                <strong>74</strong> CSS animations, SASS files, templates, tutorials and many more.
                                <strong>Free for personal and commercial use.</strong>
                            </p>

                            <!-- CTA -->
                            <a target="_blank" href="https://mdbootstrap.com/getting-started/" class="btn btn-grey btn-md">Download
                                <i class="fas fa-download ml-1"></i>
                            </a>
                            <a target="_blank" href="https://mdbootstrap.com/components/" class="btn btn-grey btn-md">Live demo
                                <i class="fas fa-image ml-1"></i>
                            </a>

                        </div>
                        <!--Grid column-->

                    </div>
                    <!--Grid row-->

                </section>
                <!--Section: Main info-->

                <hr class="my-5">

                <!--Section: Main features & Quick Start-->
                <section>

                    <h3 style="color:#5c2d91" class=" h3 text-center mb-5 ">LLEVAMOS TU RENDIMIENTO AL EXTREMO</h3> 


                    <!--Grid row-->
                    <div class="row wow fadeIn">

                        <!--Grid column-->
                        <div class="col-lg-6 col-md-12 px-4">

                            <!--First row-->
                            <div class="row">
                                <div class="col-1 mr-3">
                                    <i class="far fa-futbol fa-3x blue-text"></i>
                                </div>
                                <div class="col-10">
                                    <h5 class="feature-title">FUTBOL</h5>
                                    <p class="grey-text">Rendí más en los partidos y prevení lesiones musculares.</p>
                                </div>
                            </div>
                            <!--/First row-->

                            <div style="height:30px"></div>

                            <!--Second row-->
                            <div class="row">
                                <div class="col-1 mr-3">
                                    <i class="fas fa-running fa-3x blue-text"></i>

                                </div>
                                <div class="col-10">
                                    <h5 class="feature-title">RUNNING</h5>
                                    <p class="grey-text">Suplementación ideal par cuidar los músculos de tus piernas y mejorar la performance
                                    </p>
                                </div>
                            </div>
                            <!--/Second row-->


                            <div style="height:30px"></div>

                            <!--Third row-->
                            <div class="row">
                                <div class="col-1 mr-3">
                                    <i class="fas fa-bicycle fa-2x cyan-text"></i>

                                </div>
                                <div class="col-10">
                                    <h5 class="feature-title">CICLISMO</h5>
                                    <p class="grey-text">Mejorá la resistencia en tus entrenamientos y carreras.</p>
                                </div>
                            </div>

                            <div style="height:30px"></div>

                            <!--Third row-->
                            <div class="row">
                                <div class="col-1 mr-3">
                                    <i class="fas fa-dumbbell fa-2x cyan-text"></i>

                                </div>
                                <div class="col-10">
                                    <h5 class="feature-title">BODYBUILDING</h5>
                                    <p class="grey-text">Nuestros mejores productos para aumentar tu masa muscular.</p>
                                </div>
                            </div>




                            <!--/Third row-->

                        </div>
                        <!--/Grid column-->

                        <!--Grid column-->
                        <div class="col-lg-6 col-md-12">

                            <p class="h5 text-center mb-4">Mira nuestro video</p>
                            <div class="embed-responsive embed-responsive-16by9">
                                <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/BRamZR_6Ivw" allowfullscreen></iframe>

                            </div>
                        </div>
                        <!--/Grid column-->

                    </div>
                    <!--/Grid row-->

                </section>
                <!--Section: Main features & Quick Start-->

                <hr class="my-5">

                <!--Section: Not enough-->
                <section>

                    <h2 class="my-5 h3 text-center">Not enough?</h2>

                    <!--First row-->
                    <div class="row features-small mb-5 mt-3 wow fadeIn">

                        <!--First column-->
                        <div class="col-md-4">
                            <!--First row-->
                            <div class="row">
                                <div class="col-2">
                                    <i class="fas fa-check-circle fa-2x indigo-text"></i>
                                </div>
                                <div class="col-10">
                                    <h6 class="feature-title">Free for personal and commercial use</h6>
                                    <p class="grey-text">Our license is user-friendly. Feel free to use MDB for both private as well as commercial projects.
                                    </p>
                                    <div style="height:15px"></div>
                                </div>
                            </div>
                            <!--/First row-->

                            <!--Second row-->
                            <div class="row">
                                <div class="col-2">
                                    <i class="fas fa-check-circle fa-2x indigo-text"></i>
                                </div>
                                <div class="col-10">
                                    <h6 class="feature-title">400+ UI elements</h6>
                                    <p class="grey-text">An impressive collection of flexible components allows you to develop any project.
                                    </p>
                                    <div style="height:15px"></div>
                                </div>
                            </div>
                            <!--/Second row-->

                            <!--Third row-->
                            <div class="row">
                                <div class="col-2">
                                    <i class="fas fa-check-circle fa-2x indigo-text"></i>
                                </div>
                                <div class="col-10">
                                    <h6 class="feature-title">600+ icons</h6>
                                    <p class="grey-text">Hundreds of useful, scalable, vector icons at your disposal.</p>
                                    <div style="height:15px"></div>
                                </div>
                            </div>
                            <!--/Third row-->

                            <!--Fourth row-->
                            <div class="row">
                                <div class="col-2">
                                    <i class="fas fa-check-circle fa-2x indigo-text"></i>
                                </div>
                                <div class="col-10">
                                    <h6 class="feature-title">Fully responsive</h6>
                                    <p class="grey-text">It doesn't matter whether your project will be displayed on desktop, laptop, tablet or mobile phone. MDB
                                        looks great on each screen.</p>
                                    <div style="height:15px"></div>
                                </div>
                            </div>
                            <!--/Fourth row-->
                        </div>
                        <!--/First column-->

                        <!--Second column-->
                        <div class="col-md-4 flex-center">
                            <img src="https://mdbootstrap.com/img/Others/screens.png" alt="MDB Magazine Template displayed on iPhone" class="z-depth-0 img-fluid">
                        </div>
                        <!--/Second column-->

                        <!--Third column-->
                        <div class="col-md-4 mt-2">
                            <!--First row-->
                            <div class="row">
                                <div class="col-2">
                                    <i class="fas fa-check-circle fa-2x indigo-text"></i>
                                </div>
                                <div class="col-10">
                                    <h6 class="feature-title">70+ CSS animations</h6>
                                    <p class="grey-text">Neat and easy to use animations, which will increase the interactivity of your project and delight your visitors.
                                    </p>
                                    <div style="height:15px"></div>
                                </div>
                            </div>
                            <!--/First row-->

                            <!--Second row-->
                            <div class="row">
                                <div class="col-2">
                                    <i class="fas fa-check-circle fa-2x indigo-text"></i>
                                </div>
                                <div class="col-10">
                                    <h6 class="feature-title">Plenty of useful templates</h6>
                                    <p class="grey-text">Need inspiration? Use one of our predefined templates for free.</p>
                                    <div style="height:15px"></div>
                                </div>
                            </div>
                            <!--/Second row-->

                            <!--Third row-->
                            <div class="row">
                                <div class="col-2">
                                    <i class="fas fa-check-circle fa-2x indigo-text"></i>
                                </div>
                                <div class="col-10">
                                    <h6 class="feature-title">Easy installation</h6>
                                    <p class="grey-text">5 minutes, a few clicks and... done. You will be surprised at how easy it is.
                                    </p>
                                    <div style="height:15px"></div>
                                </div>
                            </div>
                            <!--/Third row-->

                            <!--Fourth row-->
                            <div class="row">
                                <div class="col-2">
                                    <i class="fas fa-check-circle fa-2x indigo-text"></i>
                                </div>
                                <div class="col-10">
                                    <h6 class="feature-title">Easy to use and customize</h6>
                                    <p class="grey-text">Using MDB is straightforward and pleasant. Components flexibility allows you deep customization. You will
                                        easily adjust each component to suit your needs.</p>
                                    <div style="height:15px"></div>
                                </div>
                            </div>
                            <!--/Fourth row-->
                        </div>
                        <!--/Third column-->

                    </div>
                    <!--/First row-->

                </section>
                <!--Section: Not enough-->

                <hr class="mb-5">

                <!--Section: More-->
                <section>

                    <h2 class="my-5 h3 text-center">...and even more</h2>

                    <!--First row-->
                    <div class="row features-small mt-5 wow fadeIn">

                        <!--Grid column-->
                        <div class="col-xl-3 col-lg-6">
                            <!--Grid row-->
                            <div class="row">
                                <div class="col-2">
                                    <i class="fab fa-firefox fa-2x mb-1 indigo-text" aria-hidden="true"></i>
                                </div>
                                <div class="col-10 mb-2 pl-3">
                                    <h5 class="feature-title font-bold mb-1">Cross-browser compatibility</h5>
                                    <p class="grey-text mt-2">Chrome, Firefox, IE, Safari, Opera, Microsoft Edge - MDB loves all browsers; all browsers love MDB.
                                    </p>
                                </div>
                            </div>
                            <!--/Grid row-->
                        </div>
                        <!--/Grid column-->

                        <!--Grid column-->
                        <div class="col-xl-3 col-lg-6">
                            <!--Grid row-->
                            <div class="row">
                                <div class="col-2">
                                    <i class="fas fa-level-up-alt fa-2x mb-1 indigo-text" aria-hidden="true"></i>
                                </div>
                                <div class="col-10 mb-2">
                                    <h5 class="feature-title font-bold mb-1">Frequent updates</h5>
                                    <p class="grey-text mt-2">MDB becomes better every month. We love the project and enhance as much as possible.
                                    </p>
                                </div>
                            </div>
                            <!--/Grid row-->
                        </div>
                        <!--/Grid column-->

                        <!--Grid column-->
                        <div class="col-xl-3 col-lg-6">
                            <!--Grid row-->
                            <div class="row">
                                <div class="col-2">
                                    <i class="far fa-comments fa-2x mb-1 indigo-text" aria-hidden="true"></i>
                                </div>
                                <div class="col-10 mb-2">
                                    <h5 class="feature-title font-bold mb-1">Active community</h5>
                                    <p class="grey-text mt-2">Our society grows day by day. Visit our forum and check how it is to be a part of our family.
                                    </p>
                                </div>
                            </div>
                            <!--/Grid row-->
                        </div>
                        <!--/Grid column-->

                        <!--Grid column-->
                        <div class="col-xl-3 col-lg-6">
                            <!--Grid row-->
                            <div class="row">
                                <div class="col-2">
                                    <i class="fas fa-code fa-2x mb-1 indigo-text" aria-hidden="true"></i>
                                </div>
                                <div class="col-10 mb-2">
                                    <h5 class="feature-title font-bold mb-1">jQuery 3.x</h5>
                                    <p class="grey-text mt-2">MDB is integrated with newest jQuery. Therefore you can use all the latest features which come along with
                                        it.
                                    </p>
                                </div>
                            </div>
                            <!--/Grid row-->
                        </div>
                        <!--/Grid column-->

                    </div>
                    <!--/First row-->

                    <!--Second row-->
                    <div class="row features-small mt-4 wow fadeIn">

                        <!--Grid column-->
                        <div class="col-xl-3 col-lg-6">
                            <!--Grid row-->
                            <div class="row">
                                <div class="col-2">
                                    <i class="fas fa-cubes fa-2x mb-1 indigo-text" aria-hidden="true"></i>
                                </div>
                                <div class="col-10 mb-2">
                                    <h5 class="feature-title font-bold mb-1">Modularity</h5>
                                    <p class="grey-text mt-2">Material Design for Bootstrap comes with both, compiled, ready to use libraries including all features as
                                        well as modules for CSS (SASS files) and JS.</p>
                                </div>
                            </div>
                            <!--/Grid row-->
                        </div>
                        <!--/Grid column-->

                        <!--Grid column-->
                        <div class="col-xl-3 col-lg-6">
                            <!--Grid row-->
                            <div class="row">
                                <div class="col-2">
                                    <i class="fas fa-question fa-2x mb-1 indigo-text" aria-hidden="true"></i>
                                </div>
                                <div class="col-10 mb-2">
                                    <h5 class="feature-title font-bold mb-1">Technical support</h5>
                                    <p class="grey-text mt-2">We care about reliability. If you have any questions - do not hesitate to contact us.
                                    </p>
                                </div>
                            </div>
                            <!--/Grid row-->
                        </div>
                        <!--/Grid column-->

                        <!--Grid column-->
                        <div class="col-xl-3 col-lg-6">
                            <!--Grid row-->
                            <div class="row">
                                <div class="col-2">
                                    <i class="fas fa-th fa-2x mb-1 indigo-text" aria-hidden="true"></i>
                                </div>
                                <div class="col-10 mb-2">
                                    <h5 class="feature-title font-bold mb-1">Flexbox</h5>
                                    <p class="grey-text mt-2">MDB fully supports Flex Box. You can forget about alignment issues.</p>
                                </div>
                            </div>
                            <!--/Grid row-->
                        </div>
                        <!--/Grid column-->

                        <!--Grid column-->
                        <div class="col-xl-3 col-lg-6">
                            <!--Grid row-->
                            <div class="row">
                                <div class="col-2">
                                    <i class="far fa-file-code fa-2x mb-1 indigo-text" aria-hidden="true"></i>
                                </div>
                                <div class="col-10 mb-2">
                                    <h5 class="feature-title font-bold mb-1">SASS files</h5>
                                    <p class="grey-text mt-2">Arranged and well documented .scss files can't wait until you compile them.</p>
                                </div>
                            </div>
                            <!--/Grid row-->
                        </div>
                        <!--/Grid column-->

                    </div>
                    <!--/Second row-->

                </section>
                <!--Section: More-->

            </div>
        </main>
        <!--Main layout-->

        <!--Footer-->
        <footer class="page-footer text-center font-small mt-4 wow fadeIn">

            <!--Call to action-->
            <div class="pt-4">
                <a class="btn btn-outline-white" href="https://mdbootstrap.com/getting-started/" target="_blank" role="button">Download MDB
                    <i class="fas fa-download ml-2"></i>
                </a>
                <a class="btn btn-outline-white" href="https://mdbootstrap.com/bootstrap-tutorial/" target="_blank" role="button">Start free tutorial
                    <i class="fas fa-graduation-cap ml-2"></i>
                </a>
            </div>
            <!--/.Call to action-->

            <hr class="my-4">

            <!-- Social icons -->
            <div class="pb-4">
                <a href="https://www.facebook.com/mdbootstrap" target="_blank">
                    <i class="fab fa-facebook-f mr-3"></i>
                </a>

                <a href="https://twitter.com/MDBootstrap" target="_blank">
                    <i class="fab fa-twitter mr-3"></i>
                </a>

                <a href="https://www.youtube.com/watch?v=7MUISDJ5ZZ4" target="_blank">
                    <i class="fab fa-youtube mr-3"></i>
                </a>

                <a href="https://plus.google.com/u/0/b/107863090883699620484" target="_blank">
                    <i class="fab fa-google-plus-g mr-3"></i>
                </a>

                <a href="https://dribbble.com/mdbootstrap" target="_blank">
                    <i class="fab fa-dribbble mr-3"></i>
                </a>

                <a href="https://pinterest.com/mdbootstrap" target="_blank">
                    <i class="fab fa-pinterest mr-3"></i>
                </a>

                <a href="https://github.com/mdbootstrap/bootstrap-material-design" target="_blank">
                    <i class="fab fa-github mr-3"></i>
                </a>

                <a href="http://codepen.io/mdbootstrap/" target="_blank">
                    <i class="fab fa-codepen mr-3"></i>
                </a>
            </div>
            <!-- Social icons -->

            <!--Copyright-->
            <div class="footer-copyright py-3">
                © 2019 Copyright:
                <a href="https://mdbootstrap.com/bootstrap-tutorial/" target="_blank"> MDBootstrap.com </a>
            </div>
            <!--/.Copyright-->

        </footer>
        <!-- JQuery -->
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
        <!--/.Footer-->

    </body>
</html>