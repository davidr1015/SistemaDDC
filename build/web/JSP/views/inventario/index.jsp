<%@page import="java.util.Vector"%>
<%@page import="Operaciones.Producto"%>
<jsp:include page="/JSP/views/header.jsp" />


<%
    Vector<Producto> productos = (Vector<Producto>) request.getAttribute("productos");
    request.removeAttribute("productos");
%> 


<div class="col-md-12">
    <div class="card">
        <div class="card-header">
            <h4 class="card-title">Inventario</h4>
        </div>
        <div class="card-body">



            <div class="card-body px-0 pt-0 pb-2">
                <div class="table-responsive p-0">
                    <table class="table align-items-center mb-0" id="table">
                        <thead>
                            <tr>
                                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Imagen</th>
                                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Descripcion</th>
                                <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Cantidad Disponible</th>
                                <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Ubicación</th>
                                <th class="text-secondary opacity-7"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (Producto p : productos) {%>
                            <tr>
                                <td width="150px">
                                    <div class="d-flex px-1 py-1">
                                            <div>
                                                <img src="public/uploads/<%=p.getFoto() %>" class="avatar avatar-xl me-3" alt="user1">
                                            </div>
                                        </div>
                                </td>
                                <td class="align-middle text-center text-sm">
                                    <p class="text-xs font-weight-bold mb-0"> <%= p.getDescripcion()%></p>
                                </td>
                                <td class="align-middle text-center text-sm">
                                    <p class="text-xs font-weight-bold mb-0"> <%= p.getCantidad()%></p>
                                </td>
                                <td class="align-middle text-center text-sm">
                                    <p class="text-xs font-weight-bold mb-0"> <%= p.getUbicacion()%></p>
                                </td>
                               
                            </tr>
                            <% }%> 

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

