<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="<?php echo constant('URL'); ?>public/img/logo-ddc.png">
  <link rel="icon" type="image/png" href="<?php echo constant('URL'); ?>public/img/logo-ddc.png">
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

  <link rel="stylesheet" href="/SistemaDDC/public/js/jquery-ui/jquery-ui-min.css">

  <script src="/SistemaDDC/public/js/jquery-3.5.1.min.js"></script>
  <script src="/SistemaDDC/public/js/jquery-ui/jquery-ui.min.js"></script>

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
            <svg xmlns="http://www.w3.org/2000/svg" height="48" viewBox="0 96 960 960" width="48"><path d="M431 922H180q-24 0-42-18t-18-42V280q0-24 15.5-42t26.5-18h202q7-35 34.5-57.5T462 140q36 0 63.5 22.5T560 220h202q24 0 42 18t18 42v203h-60V280H656v130H286V280H180v582h251v60Zm189-25L460 737l43-43 117 117 239-239 43 43-282 282ZM480 276q17 0 28.5-11.5T520 236q0-17-11.5-28.5T480 196q-17 0-28.5 11.5T440 236q0 17 11.5 28.5T480 276Z"/></svg>
                <title>Inventario</title> 
            </div>
            <span class="nav-link-text ms-1">Inventario</span>
          </a>
        </li>

        <li class="nav-item">
          <a href="/SistemaDDC/Servlet_peticiones?page=clientes" class="nav-link border-bottom" id="nav-movimientos">
            <div class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center">
            <svg xmlns="http://www.w3.org/2000/svg" height="48" viewBox="0 96 960 960" width="48"><path d="M322 606V290L202 410l-42-42 193-193 193 193-42 42-122-121v317h-60Zm285 369L414 781l42-41 120 120V544h60v317l122-121 42 42-193 193Z"/></svg>
            </div>
            <span class="nav-link-text ms-1">Clientes</span>
          </a>
        </li>
        
        <li class="nav-item">
          <a href="/SistemaDDC/Servlet_peticiones?page=productos" class="nav-link border-bottom" id="nav-movimientos">
            <div class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center">
            <svg xmlns="http://www.w3.org/2000/svg" height="48" viewBox="0 96 960 960" width="48"><path d="M322 606V290L202 410l-42-42 193-193 193 193-42 42-122-121v317h-60Zm285 369L414 781l42-41 120 120V544h60v317l122-121 42 42-193 193Z"/></svg>
            </div>
            <span class="nav-link-text ms-1">Productos</span>
          </a>
        </li>

        
        <li class="nav-item">
          <a href="/SistemaDDC/Servlet_peticiones?page=compras" class="nav-link border-bottom">
            <div class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center">
            <svg xmlns="http://www.w3.org/2000/svg" height="48" viewBox="0 96 960 960" width="48"><path d="M160 796V276H80v-60h140v520h620v60H160Zm59.115 180Q194 976 177 958.323q-17-17.677-17-42.5t17-42.323q17-17.5 42.115-17.5 25.115 0 43 17.677t17.885 42.5Q280 941 262.115 958.5t-43 17.5ZM290 666V446h220v220H290Zm60-60h100V506H350v100Zm220 60V446h220v220H570Zm60-60h100V506H630v100Zm149.823 370Q755 976 737.5 958.323t-17.5-42.5Q720 891 737.677 873.5t42.5-17.5Q805 856 822.5 873.677t17.5 42.5Q840 941 822.323 958.5t-42.5 17.5ZM350 606h100-100Zm280 0h100-100Z"/></svg>
            </div>
            <span class="nav-link-text ms-1">Compras</span>
          </a>
        </li>
        
        <li class="nav-item">
            <form action="/SistemaDDC/Servlet_peticiones" method="POST">
                <button type="submit" name="productos" class="nav-link border-bottom" id="nav-movimientos">
            <div class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center">
            <svg xmlns="http://www.w3.org/2000/svg" height="48" viewBox="0 96 960 960" width="48"><path d="M160 796V276H80v-60h140v520h620v60H160Zm59.115 180Q194 976 177 958.323q-17-17.677-17-42.5t17-42.323q17-17.5 42.115-17.5 25.115 0 43 17.677t17.885 42.5Q280 941 262.115 958.5t-43 17.5ZM290 666V446h220v220H290Zm60-60h100V506H350v100Zm220 60V446h220v220H570Zm60-60h100V506H630v100Zm149.823 370Q755 976 737.5 958.323t-17.5-42.5Q720 891 737.677 873.5t42.5-17.5Q805 856 822.5 873.677t17.5 42.5Q840 941 822.323 958.5t-42.5 17.5ZM350 606h100-100Zm280 0h100-100Z"/></svg>
            </div>
            <span class="nav-link-text ms-1">Ventas</span>
          </button>
            </form>
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
              </div>
            </div>
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
          <h6 class="font-weight-bolder mb-0">Delicias del Campo</h6>
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