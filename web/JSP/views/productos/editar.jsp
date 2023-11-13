<%@page import="java.util.Vector"%>
<%@page import="Operaciones.Producto"%>
<jsp:include page="/JSP/views/header.jsp" />


<%
    Vector producto = (Vector) request.getAttribute("producto");
    request.removeAttribute("producto");
    Producto p = (Producto) producto.get(0);
%> 

<div class="col-md-12">
    <div class="card card-user">
        <div class="card-header">
            <h5 class="card-title">Editar Producto</h5>
        </div>
        <div class="card-body">
            <form action="/SistemaDDC/Servlet_peticiones" method="POST" enctype="multipart/form-data" autocomplete="off">


                <input type="hidden" name="id" value="<%=p.getId()%>" class="form-control">

                <div class="row">
                    <div class="col-md-8 pr-1">
                        <div class="form-group">
                            <label>Foto</label>
                            <input type="file" name="foto" class="form-control" accept="image/*">
                            <input type="hidden"  name="foto_actual" value="<%= p.getFoto()%>">
                        </div>
                    </div>
                    <div class="col-md-3 pr-1">
                        <img class="avatar avatar-xl me-3" src="public/uploads/<%=p.getFoto()%>" alt="">
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-10 pr-1">
                        <div class="form-group">
                            <label>Descripcion</label>
                            <input type="text" class="form-control" name="descripcion" value="<%= p.getDescripcion()%>" required>
                        </div>
                    </div>
                </div>


                <div class="row">
                    <div class="col-md-3 pr-1">
                        <div class="form-group">
                            <label>Precio</label>
                            <input type="number" name="precio" class="form-control" value="<%= p.getPrecio()%>" required>
                        </div>
                    </div>

                    <div class="col-md-3 pr-1">
                        <div class="form-group">
                            <label>Cantidad Minima</label>
                            <input type="number" name="cantidad_minima" class="form-control" value="<%= p.getCantidad()%>" required>
                        </div>
                    </div>

                    <div class="col-md-4 pr-1">
                        <div class="form-group">
                            <label>Ubicación</label>
                            <input type="text" name="ubicacion" class="form-control" value="<%= p.getUbicacion()%>" required>
                        </div>
                    </div>
                </div>

                <div class="row">

                </div>




                <div class="row">
                    <div class="update ml-auto mr-auto">
                        <button type="submit"  name="actualizarProducto" class="btn bg-gradient-primary mb-0">Actualizar</button>
                        <a href="/SistemaDDC/Servlet_peticiones?page=productos" class="btn btn-outline-secondary mb-0 ">Regresar</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>




<!-- Campo oculto para almacenar el botón presionado -->

<jsp:include page="/JSP/views/footer.jsp" />



