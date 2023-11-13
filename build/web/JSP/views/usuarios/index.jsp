
<%@page import="Operaciones.Usuario"%>
<%@page import="java.util.Vector"%>
<jsp:include page="/JSP/views/header.jsp" />


<%
    Vector<Usuario> usuarios = (Vector<Usuario>) request.getAttribute("usuarios");
    request.removeAttribute("usuarios");
%> 



<div class="col-md-12">
    <div class="card">
        <div class="card-header">
            <h4 class="card-title">Usuarios</h4>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="update ml-4">
                    <a class="btn bg-gradient-primary mb-0" href="/SistemaDDC/JSP/views/usuarios/nuevo.jsp">Agregar nuevo usuario</a>
                </div>
            </div>
            <br>
            <div class="card-body px-0 pt-0 pb-2">
                <div class="table-responsive p-0">
                    <form action="/SistemaDDC/Servlet_peticiones">
                        <table class="table align-items-center mb-0" id="table">
                            <thead>
                                <tr>
                                    <th width="150px" class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Id</th>
                                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Nombre</th>
                                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Rol</th>
                                    <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Username</th>
                                    <th class="text-secondary opacity-7"></th>
                                    <th class="text-secondary opacity-7"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (Usuario p : usuarios) {%>
                                <tr>

                                    <td class="align-middle text-center text-sm">
                                        <p class="text-xs font-weight-bold mb-0"> <%= p.getId()%></p>
                                    </td>
                                    <td class="align-middle text-center text-sm">
                                        <p class="text-xs font-weight-bold mb-0"> <%= p.getNombre()%></p>
                                    </td>
                                    <td class="align-middle text-center text-sm">
                                        <p class="text-xs font-weight-bold mb-0"> <%= p.getRol()%></p>
                                    </td>
                                    <td class="align-middle text-center text-sm">
                                        <p class="text-xs font-weight-bold mb-0"> <%= p.getLogin()%></p>
                                    </td>

                                    <td class="align-middle text-center">
                                        <!-- Enlace para editar -->
                                        <a href="/SistemaDDC/Servlet_peticiones?editarUsuario=<%= p.getId()%>">Editar</a>

                                    </td>
                                    <td class="align-middle">
                                        <a href="/SistemaDDC/Servlet_peticiones?eliminarUsuario=<%= p.getId()%>" onclick="return confirmDelete()">Eliminar</a>
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
