
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="apple-touch-icon" sizes="76x76" href="/SistemaDDC/public/img/logo-ddc.png">
        <link rel="icon" type="image/png" href="/SistemaDDC/public/img/logo-ddc.png">
        <title>
            Control de inventario DDC
        </title>
        <!--     Fonts and icons     -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
        <!-- Nucleo Icons -->
        <link href="/SistemaDDC/public/css/nucleo-icons.css" rel="stylesheet" />
        <link href="/SistemaDDC/public/css/nucleo-svg.css" rel="stylesheet" />
        <!-- Font Awesome Icons -->
        <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
        <link href="/SistemaDDC/public/css/nucleo-svg.css" rel="stylesheet" />
        <!-- CSS Files -->
        <link id="pagestyle" href="/SistemaDDC/public/css/soft-ui-dashboard.css?v=1.0.6" rel="stylesheet" />
        <!-- Datatables -->
        <link href="https://unpkg.com/vanilla-datatables@latest/dist/vanilla-dataTables.min.css" rel="stylesheet" type="text/css">
        <script src="https://unpkg.com/vanilla-datatables@latest/dist/vanilla-dataTables.min.js" type="text/javascript"></script>
        <link rel="stylesheet" href="/SistemaDDC/public/css/estilo.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">



    </head>

    <body class="g-sidenav-show  bg-gray-100">
        <aside class="sidenav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-3 " id="sidenav-main">
            <div class="sidenav-header">
                <!-- <i class="fas fa-times p-3 cursor-pointer text-secondary opacity-5 position-absolute end-0 top-0 d-none d-xl-none" aria-hidden="true" id="iconSidenav"></i> -->
                <a class="navbar-brand m-0" href="#">
                    <img class="navbar-brand-img" src="/SistemaDDC/public/img/logo-ddc.png">
                </a>
            </div>

            <br>

            <hr class="horizontal dark mt-0">
            <div class="collapse navbar-collapse  w-auto " id="sidenav-collapse-main">
                <ul class="navbar-nav">

                    <li class="nav-item " >
                        <a href="/SistemaDDC/Servlet_peticiones?page=inventario" id="nav-inventario"  class="nav-link">
                            <div class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center">
                                <img width="23" height="23" src="https://img.icons8.com/wired/64/clipboard-list.png" alt="clipboard-list"/>
                                <title>Inventario</title> 
                            </div>
                            <span class="nav-link-text ms-1">Inventario</span>
                        </a>
                    </li>

                    <li class="nav-item">
                        <a href="/SistemaDDC/Servlet_peticiones?page=clientes" class="nav-link border-bottom" id="nav-movimientos">
                            <div class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center">
                                <img width="23" height="23" src="https://img.icons8.com/ios/50/crowd.png" alt="crowd"/>
                            </div>
                            <span class="nav-link-text ms-1">Clientes</span>
                        </a>
                    </li>

                    <li class="nav-item">
                        <a href="/SistemaDDC/Servlet_peticiones?page=usuarios" class="nav-link border-bottom" id="nav-movimientos">
                            <div class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center">
                                <img width="25" height="25" src="https://img.icons8.com/pastel-glyph/64/gender-neutral-user.png" alt="gender-neutral-user"/>
                            </div>
                            <span class="nav-link-text ms-1">Usuarios</span>
                        </a>
                    </li>

                    <li class="nav-item">
                        <a href="/SistemaDDC/Servlet_peticiones?page=productos" class="nav-link border-bottom" id="nav-movimientos">
                            <div class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center">
                                <img width="25" height="25" src="https://img.icons8.com/dotty/80/new-product.png" alt="new-product"/>
                            </div>
                            <span class="nav-link-text ms-1">Productos</span>
                        </a>
                    </li>


                    <li class="nav-item">
                        <a href="/SistemaDDC/Servlet_peticiones?page=compras" class="nav-link border-bottom">
                            <div class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center">
                                <img width="20" height="20" src="https://img.icons8.com/ios/50/buy--v1.png" alt="buy--v1"/>
                            </div>
                            <span class="nav-link-text ms-1">Compras</span>
                        </a>
                    </li>

                    <li class="nav-item">
                        <a href="/SistemaDDC/Servlet_peticiones?page=caja" class="nav-link border-bottom">
                            <div class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center">
                                <img width="20" height="20" src="https://img.icons8.com/ios/50/cash-register.png" alt="cash-register"/>
                            </div>
                            <span class="nav-link-text ms-1">Caja</span>
                        </a>
                    </li>

                    <li class="nav-item">
                        <a href="/SistemaDDC/Servlet_peticiones?page=ventas" class="nav-link border-bottom">
                            <div class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center">
                                <img width="20" height="20" src="https://img.icons8.com/ios/50/cash-register.png" alt="cash-register"/>
                            </div>
                            <span class="nav-link-text ms-1">Ventas</span>
                        </a>
                    </li>


                    <li class="nav-item">
                        <a href="/SistemaDDC/Servlet_peticiones?page=cerrarSesion" class="nav-link border-bottom">
                            <div class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center">
                                <img width="20" height="20" src="https://img.icons8.com/ios/50/cash-register.png" alt="cash-register"/>
                            </div>
                            <span class="nav-link-text ms-1">Cerrar Sesion</span>
                        </a>
                    </li>

                </ul>
            </div>




            <!-- <div class="sidenav-footer mx-3 ">
              <div class="card card-background shadow-none card-background-mask-secondary" id="sidenavCard">
                <div class="full-background" style="background-image: url('<?php echo constant('URL') ?>public/img/curved-images/white-curved.jpg')"></div>
        
        
            <!-- <div class="card-body text-start p-3 w-100">
    
              <div class="docs-info">
                <div class="d-flex">
                  <div>
                    <img src="<?php //echo constant('URL'); ?>public/img/qr.png" class="img-thumbnail me-3" alt="user1">
    >>>>>>> f93b59766f4ded8e8f66390e11b6cd435835a676
                  </div>
                </div> -->
        </div>

    </div>
</aside>
<main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">
    <!-- Navbar -->
    <nav class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl" id="navbarBlur" navbar-scroll="true">
        <div class="container-fluid py-1 px-3">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
                    <!-- <li class="breadcrumb-item text-sm"><a class="opacity-5 text-dark" href="javascript:;">Pages</a></li>
                    <li class="breadcrumb-item text-sm text-dark active" aria-current="page">Tables</li> -->
                </ol>
                <h6 class="font-weight-bolder mb-0">

                    Delicias del campo
                </h6>
            </nav>
            <div class="collapse navbar-collapse mt-sm-0 mt-2 me-md-0 me-sm-4" id="navbar">
                <div class="ms-md-auto pe-md-3 d-flex align-items-center">

                </div>
                <ul class="navbar-nav  justify-content-end">

                    <li class="nav-item d-xl-none ps-3 d-flex align-items-center">
                        <a href="javascript:;" class="nav-link text-body p-0" id="iconNavbarSidenav">
                            <div class="sidenav-toggler-inner">
                                <i class="sidenav-toggler-line"></i>
                                <i class="sidenav-toggler-line"></i>
                                <i class="sidenav-toggler-line"></i>
                            </div>
                        </a>
                    </li>
                    <!-- <li class="nav-item px-3 d-flex align-items-center">
                      <a href="javascript:;" class="nav-link text-body p-0">
                        <i class="fa fa-cog fixed-plugin-button-nav cursor-pointer"></i>
                      </a>
                    </li> -->

                </ul>
            </div>
        </div>
    </nav>
    <!-- End Navbar -->
    <div class="container-fluid py-4">
        <div class="row">