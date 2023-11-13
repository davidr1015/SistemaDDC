<jsp:include page="/JSP/views/header.jsp" />


<div class="col-md-12">
    <div class="card card-user">
        <div class="card-header">
            <h5 class="card-title">Agregar nuevo usuario</h5>
        </div>
        <div class="card-body">
            <form action="/SistemaDDC/Servlet_peticiones" method="POST" enctype="multipart/form-data" autocomplete="off">

                    <div class="row">
                        <div class="col-md-4 pr-1">
                            <div class="form-group">
                                <label>Cedula</label>
                                <input type="text" name="cedula" class="form-control" required>
                            </div>
                        </div>
                        
                        <div class="col-md-4 pr-1">
                            <div class="form-group">
                                <label>Nombre Completo</label>
                                <input type="text" class="form-control" name="nombres" value="" required>
                            </div>
                        </div>
                        
                        
                    </div>
                

                    <div class="row">
                        <div class="col-md-4 pr-1">
                            <div class="form-group">
                                <label>Email</label>
                                <input type="email" name="email" class="form-control" value="" required>
                            </div>
                        </div>
                        
                        <div class="col-md-4 pr-1">
                            <div class="form-group">
                                <label>Rol</label>
                                <input type="text" name="rol" class="form-control" value="">
                            </div>
                        </div>
                        
                        
                    </div>
                
                <div class="row">
                        <div class="col-md-4 pr-1">
                            <div class="form-group">
                                <label>Username</label>
                                <input type="text" name="username" class="form-control" value="" required>
                            </div>
                        </div>
                        
                        <div class="col-md-4 pr-1">
                            <div class="form-group">
                                <label>Contraseña</label>
                                <input type="password" name="contraseña" class="form-control" value="">
                            </div>
                        </div>
                        
                        
                    </div>
                


                    <div class="row">
                        <div class="update ml-auto mr-auto">
                            <button type="submit" name="registrarUsuario" class="btn bg-gradient-primary mb-0">Agregar</button>
                            <a href="/SistemaDDC/Servlet_peticiones?page=usuarios" class="btn btn-outline-secondary mb-0 ">Regresar</a>
                        </div>
                    </div>
            </form>
        </div>
    </div>
</div>

<jsp:include page="/JSP/views/footer.jsp" />

