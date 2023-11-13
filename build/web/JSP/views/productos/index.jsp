
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
            <h4 class="card-title">Productos</h4>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="update ml-4">
                    <a class="btn bg-gradient-primary mb-0" href="/SistemaDDC/JSP/views/productos/nuevo.jsp">Agregar nuevo producto</a>
                </div>
            </div>
            <br>
            <div class="card-body px-0 pt-0 pb-2">
                <div class="table-responsive p-0">
                    <form action="/SistemaDDC/Servlet_peticiones">
                        <table class="table align-items-center mb-0" id="table">
                            <thead>
                                <tr>
                                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Imagen</th>
                                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Descripcion</th>
                                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Precio</th>
                                    <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Cantidad Minima</th>
                                    <th class="text-secondary opacity-7"></th>
                                    <th class="text-secondary opacity-7"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (Producto p : productos) {%>
                                <tr>
                                    <td>
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
                                        <p class="text-xs font-weight-bold mb-0"> $<%= p.getPrecio()%></p>
                                    </td>
                                    <td class="align-middle text-center text-sm">
                                        <p class="text-xs font-weight-bold mb-0"> <%= p.getCantidad_minima()%></p>
                                    </td>

                                    <td class="align-middle text-center">
                                        <!-- Enlace para editar -->
                                        <a href="/SistemaDDC/Servlet_peticiones?editarProducto=<%= p.getId()%>">Editar</a>

                                    </td>
                                    <td class="align-middle">
                                        <a href="/SistemaDDC/Servlet_peticiones?eliminarProducto=<%= p.getId()%>" onclick="return confirmDelete()">Eliminar</a>
                                    </td>
                                </tr>
                                <% }%> 
                            </tbody>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- ... (resto del código) -->
<script type="text/javascript">
    function confirmDelete() {
//Ingresamos un mensaje a mostrar
        var mensaje = confirm("¿Deseas eliminar este registro?");
//Detectamos si el usuario acepto el mensaje
        return mensaje;
    }
</script>

<jsp:include page="/JSP/views/footer.jsp" />
