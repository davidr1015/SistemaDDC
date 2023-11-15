
<%@page import="java.util.Vector"%>
<%@page import="Operaciones.Compra"%>
<jsp:include page="/JSP/views/header.jsp" />


<%
    Vector<Compra> compra = (Vector<Compra>) request.getAttribute("compra");
    request.removeAttribute("compra");
%> 



<div class="col-md-12">
    <div class="card">
        <div class="card-header">
            <h4 class="card-title">Compras</h4>
        </div>
        <div class="card-body">
            <br>
            <div class="card-body px-0 pt-0 pb-2">
                <div class="table-responsive p-0">
                    <form action="/SistemaDDC/Servlet_peticiones">
                        <table class="table align-items-center mb-0" id="table">
                            <thead>
                                <tr>
                                    <th width="150px" class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Id Compra</th>
                                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Nombre</th>
                                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Rol</th>
                                    <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Total</th>
                                    <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Fecha Registro</th>
                                    <th class="text-secondary opacity-7"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (Compra p : compra) {%>
                                <tr>
                                    <td class="align-middle text-center text-sm">
                                        <p class="text-xs font-weight-bold mb-0"><%= p.getId()%> </p>
                                    </td>
                                    <td class="align-middle text-center text-sm">
                                        <p class="text-xs font-weight-bold mb-0"> <%= p.getNombre_usuario()%></p>
                                    </td>
                                    <td class="align-middle text-center text-sm">
                                        <p class="text-xs font-weight-bold mb-0"> <%= p.getRol_usuario()%></p>
                                    </td>
                                    <td class="align-middle text-center text-sm">
                                        <p class="text-xs font-weight-bold mb-0"> <%= p.getTotal()%></p>
                                    </td>
                                    <td class="align-middle text-center text-sm">
                                        <p class="text-xs font-weight-bold mb-0"> <%= p.getFecha_registro()%></p>
                                    </td>
                                    <td class="align-middle text-center">
                                        <!-- Enlace para editar -->
                                        <a href="/SistemaDDC/Servlet_peticiones?mostrarCompra=<%= p.getId()%>">Mostrar</a>
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
