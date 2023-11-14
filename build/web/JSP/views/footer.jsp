</div>
</div>
<footer class="footer pt-3  ">
  <div class="container-fluid">
    <div class="row align-items-center justify-content-lg-between">
      <div class="col-lg-6 mb-lg-0 mb-4">
        <div class="copyright text-center text-sm text-muted text-lg-start">
          © <script>
            document.write(new Date().getFullYear())
          </script>,
          creado por Carlos Tirado & David Delgado
        </div>
      </div>
   
    </div>
  </div>
</footer>
</div>
</main>

<!--   Core JS Files   -->
<script src="/SistemaDDC/public/js/core/popper.min.js"></script>
<script src="/SistemaDDC/public/js/core/bootstrap.min.js"></script>
<script src="/SistemaDDC/public/js/plugins/perfect-scrollbar.min.js"></script>
<script src="/SistemaDDC/public/js/plugins/smooth-scrollbar.min.js"></script>


<script>
  var win = navigator.platform.indexOf('Win') > -1;
  if (win && document.querySelector('#sidenav-scrollbar')) {
    var options = {
      damping: '0.5'
    }
    Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
  }
</script>
<!-- Github buttons -->
<script async defer src="https://buttons.github.io/buttons.js"></script>
<!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
<script src="/SistemaDDC/public/js/soft-ui-dashboard.min.js?v=1.0.6"></script>

<script>
  var tabla = document.querySelector("#table");

  var dataTable = new DataTable(tabla, {
    "language": {
      "url": "//cdn.datatables.net/plug-ins/1.10.15/i18n/Spanish.json"
    },
    perPage: 5,
    perPageSelect: [5, 10, 15, 30]
    
  });


  
</script>



</body>

</html>
