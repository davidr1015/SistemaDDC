<jsp:include page="/JSP/views/header.jsp" />


<div class="col-md-12">
  <div class="card">
    <div class="card-header">
      <h4 class="card-title">SistemaDDC</h4>
    </div>
    <div class="card-body">



      <div class="card-body px-0 pt-0 pb-2">
        <div class="table-responsive p-0">
          <table class="table align-items-center mb-0" id="table">
            <thead>
              <tr>
                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Imagen</th>
                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Referencia</th>
                <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Descripcion</th>
                <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Kilos</th>
                <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Bultos</th>
                <th class="text-secondary opacity-7"></th>
              </tr>
            </thead>
            <tbody>

              
                <tr>
                  <td>
                    <div class="d-flex px-1 py-1">
                      <div>
                         <!-- comment -->
                      </div>
                    </div>
                  </td>
                  <td>
                    <p class="text-xs font-weight-bold mb-0"><?php echo $row['codigo']; ?></p>
                  </td>
                  <td>
                    <p class="text-xs font-weight-bold mb-0"><?php echo $row['descripcion']; ?></p>
                  </td>
                  <td class="align-middle text-center text-sm">
                    <p class="text-xs font-weight-bold mb-0"><?php echo number_format( $row['sumKilos'] , 2,".", ","). " Kg"; ?>
                  </td>
                  <td class="align-middle text-center text-sm">
                    <p class="text-xs font-weight-bold mb-0"><?php echo $row['sumBultos']. " Bultos"; ?>
                  </td>



                  <td class="align-middle">
                    <a href="#" data-href="<?php echo constant('URL') . 'productos/eliminarProducto/' . $row['id_producto']; ?>" class="text-primary font-weight-bold text-xs" data-bs-toggle="modal" data-bs-target="#modal-confirma-<?php echo $row['id_producto']; ?>" data-placement="top" title="Eliminar Registro">
                      <i class="far fa-eye me-2"></i>Mostrar</a>
                    </a>
                  </td>
                </tr>
             
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</div>



  <div class="modal fade" id="modal-confirma-<?php echo $row['id_producto']; ?>" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="staticBackdropLabel">Bodegas</h5>
          <button type="button" class="btn btn-outline-secondary mb-0" data-bs-dismiss="modal" aria-label="Close">CERRAR</button>
        </div>
        <div class="modal-body">
          <div class="table-responsive p-0">
            <table class="table align-items-center mb-0">
              <thead>
                <tr>
                  <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Nombre de bodega</th>
                  <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Kilos</th>
                  <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Bultos</th>
                  <th class="text-secondary opacity-7"></th>
                </tr>

              </thead>
              <tbody>

                
                  <tr class="collapsed" data-bs-toggle="collapse" data-bs-target="#flush-collapse<?php echo $i; ?>" aria-expanded="false" aria-controls="flush-collapse<?php echo $i; ?>">

                    <td>
                      <p class="text-xs font-weight-bold mb-0"><?php echo $bodega['nombre']; ?></p>
                    </td>
                    <td class="align-middle text-center text-sm">
                      <p class="text-xs font-weight-bold mb-0"><?php echo number_format( $bodega['sumKilos'] , 2,".", ","). " Kg"; ?></p>
                    </td>
                    <td class="align-middle text-center text-sm">
                      <p class="text-xs font-weight-bold mb-0"><?php echo number_format( $bodega['sumBultos'] , 2,".", ","). " Bultos"; ?></p>
                    </td>
                  </tr>

              <tbody id="flush-collapse" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">

                
                  <tr class="text-black-50">
                    <td class="align-middle text-center text-sm">
                    <p class="text-xs font-weight-bold mb-0"><?php echo "Lote " . $lote['lote']; ?></p>
                    </td>
                    <td class="align-middle text-center text-sm">
                    <p class="text-xs font-weight-bold mb-0"><?php echo number_format( $lote['kilos'] , 2,".", ","). " Kg"; ?></p>
                    </td>
                    <td class="align-middle text-center text-sm">
                    <p class="text-xs font-weight-bold mb-0"><?php echo number_format( $lote['bultos'] , 2,".", ","). " Bultos"; ?></p>
                    </td>
                  </tr>
                
              </tbody>
            
            </tbody>
            </table>
            <br>
          </div>
        </div>

      </div>
    </div>
  </div>




<script src="public/js/evitar-envio.js"></script>

<jsp:include page="/JSP/views/footer.jsp" />

