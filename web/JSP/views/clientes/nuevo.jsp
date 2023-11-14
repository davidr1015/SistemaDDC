<jsp:include page="/JSP/views/header.jsp" />


<div class="col-md-12">
    <div class="card card-user">
        <div class="card-header">
            <h5 class="card-title">Agregar nuevo cliente</h5>
        </div>
        <div class="card-body">
            <form action="/SistemaDDC/Servlet_peticiones" method="POST">

                <div class="row">

                    <!--  
                    <div class="alert alert-danger alert-dismissible fade show text-white" role="alert">
                      <strong>Ha ocurrido un error! </strong> <?php echo $this->mensaje; ?>
                      <button type="button" class="close my-auto text-white" data-bs-dismiss="alert" aria-label="Close">x</button>
                    </div>
                    -->


                    <div class="row" style="justify-content: center">
                        <div class="col-md-4 pr-1">
                            <div class="form-group">
                                <label>Cedula</label>
                                <input type="number" name="cedula" class="form-control" accept="image/*">
                            </div>
                        </div>



                        <div class="col-md-4 pr-1">
                            <div class="form-group">
                                <label>Nombres</label>
                                <input type="text" name="nombre" class="form-control" value="" required>
                            </div>
                        </div>
                    </div>

                    <div class="row" style="justify-content: center">
                        <div class="col-md-4 pr-1">
                            <div class="form-group">
                                <label>Correo</label>
                                <input type="email" name="correo" class="form-control" value="" required>
                            </div>
                        </div>




                        <div class="col-md-4 pr-1">
                            <div class="form-group">
                                <label>Telefono</label>
                                <input type="nuber" class="form-control" name="telefono" value="" required>
                            </div>
                        </div>

                    </div>

                </div>   


                <div class="row" style="margin-left: 35%; margin-top: 10px;">
                    <div class="update ml-auto mr-auto">
                        <button type="submit" name="registrarCliente" class="btn bg-gradient-primary mb-0">Agregar</button>
                        <a href="/Inventario/JSP/views/clientes/index.jsp" class="btn btn-outline-secondary mb-0 ">Regresar</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<jsp:include page="/JSP/views/footer.jsp" />

