<jsp:include page="/JSP/views/header.jsp" />


<div class="col-md-12">
    <div class="card card-user">
        <div class="card-header">
            <h5 class="card-title">Agregar nuevo producto</h5>
        </div>
        <div class="card-body">
            <form action="/SistemaDDC/Servlet_peticiones" method="POST" enctype="multipart/form-data">

                    <div class="row">
                        <div class="col-md-8 pr-1">
                            <div class="form-group">
                                <label>Foto</label>
                                <input type="file" name="foto" class="form-control" accept="image/*">
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-4 pr-1">
                            <div class="form-group">
                                <label>Precio</label>
                                <input type="number" name="precio" class="form-control" value="" required>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-4 pr-1">
                            <div class="form-group">
                                <label>Cantidad</label>
                                <input type="number" name="cantidad" class="form-control" value="" required>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 pr-1">
                            <div class="form-group">
                                <label>Descripcion</label>
                                <input type="text" class="form-control" name="descripcion" value="" required>
                            </div>
                        </div>

                    </div>


                    <div class="row">
                        <div class="update ml-auto mr-auto">
                            <button type="submit" name="registrarProducto" class="btn bg-gradient-primary mb-0">Agregar</button>
                            <a href="/SistemaDDC/Servlet_peticiones?page=productos" class="btn btn-outline-secondary mb-0 ">Regresar</a>
                        </div>
                    </div>
            </form>
        </div>
    </div>
</div>

<jsp:include page="/JSP/views/footer.jsp" />

