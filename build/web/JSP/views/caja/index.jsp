<%@page import="Operaciones.Producto"%>
<%@page import="java.util.Vector"%>
<jsp:include page="/JSP/views/header.jsp" />
<%
    Vector<Producto> productos = (Vector<Producto>) request.getAttribute("productos");
    request.removeAttribute("productos");
%> 
<div class="container text-center">
    <div class="row">
        <div class="col-md-6 p-4">
            <div class="row">
                <div class="col-md-12 pr-1">
                    <div class="form-group">
                        <input type="text" class="form-control" name="descripcion" value="" placeholder="Buscar">
                    </div>
                </div>
            </div>
            <div class="row" style="overflow-y: scroll; height: 390px">

                <% for (Producto p : productos) {%>
                <div class="col">
                    <div class="card shadow-sm">
                        <svg class="bd-placeholder-img card-img-top"  role="img"  preserveAspectRatio="xMidYMid slice" focusable="false"><img style="width: 100%; height: 150px; object-fit: cover; position:absolute" src="public/uploads/<%= p.getFoto()%>" alt="alt"/></svg>
                        <div class="card-body" style="max-height: 200px;">
                            <p class="card-text" 
                               style="height: 40px; display: flex; justify-content: center; align-items: center;" >
                                <%=p.getDescripcion()%> 
                            </p>
                            <p class="card-text">$<%=p.getPrecio()%></p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn bg-gradient-primary mb-0">Agregar</button>
                                </div>
                                <small class="text-body-secondary"><%=p.getCantidad()%> unidades</small>
                            </div>
                        </div>
                    </div>
                    <br>
                </div>

                <% }%>

            </div>
        </div>
        <div class="col-md-6 p-3 bg-body">
            <h5 class="text-start">Factura de venta</h5>
            <div class="row">
                <div class="col-md-6 pr-1">
                    <div class="form-group" style="text-align: left">
                        <label ">Vendedor</label>
                        <input type="text" class="form-control" name="vendedor"  required>
                    </div>
                </div>

                <div class="col-md-6 pr-1">
                    <div class="form-group" style="text-align: left">
                        <label ">Cliente</label>
                        <input type="text" class="form-control" name="cliente" value="" required>
                    </div>
                </div>
            </div>

            <div class="row" style="height: 280px; overflow-y: auto; background: red">
                <ul class="list-group mb-3">
                    <li class="list-group-item d-flex justify-content-between align-items-center lh-sm">
                        <div>
                            <h6 class="my-0">Product name</h6>
                            <small class="text-body-secondary">Brief description</small>
                        </div>
                        
                        <input type="number" class="col-2" name="name" value="0" required>
                        <span class="text-body-secondary">$12</span>
                        <input type="submit" name="name" class="btn bg-gradient-secondary mb-0" value="Quitar">
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/JSP/views/footer.jsp" />
