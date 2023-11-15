
<%@page import="java.util.Vector"%>
<%@page import="Operaciones.Cliente"%>
<jsp:include page="/JSP/views/header.jsp" />

<%
    Vector<Cliente> clientes = (Vector<Cliente>)request.getAttribute("cliente"); 
    request.removeAttribute("cliente");
%>

<div class="col-md-12">
  <div class="card">
    <div class="card-header">
      <h4 class="card-title">Clientes</h4>
    </div>
    <div class="card-body">


      <div class="row">
        <div class="update ml-4">
          <a class="btn bg-gradient-primary mb-0" href="/SistemaDDC/JSP/views/clientes/nuevo.jsp">Agregar nuevo cliente</a>

        </div>
      </div>

      <br>

      <div class="card-body px-0 pt-0 pb-2">
        <div class="table-responsive p-0">
            <form action="/SistemaDDC/Servlet_peticiones">
                <table class="table align-items-center mb-0" id="table">
                  <thead>
                    <tr>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Cedula</th>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Nombre</th>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Correo</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Telefono</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Fecha registro</th>
                      <th class="text-secondary opacity-7"></th>
                      <th class="text-secondary opacity-7"></th>
                    </tr>

                  </thead>
                  <tbody>

                        <% for (Cliente p : clientes) { %>
                                    <tr>
                                        <td>
                                            <p class="text-xs font-weight-bold mb-0"><%= p.getCedula() %></p>
                                        </td>
                                        <td class="align-middle text-center text-sm">
                                            <p class="text-xs font-weight-bold mb-0"><%= p.getNombre() %></p>
                                        </td>
                                        <td class="align-middle text-center text-sm">
                                            <p class="text-xs font-weight-bold mb-0"><%= p.getCorreo() %></p>
                                        </td>
                                        <td class="align-middle text-center text-sm">
                                            <p class="text-xs font-weight-bold mb-0"><%= p.getTelefono() %></p>
                                        </td>
                                        <td class="align-middle text-center text-sm">
                                            <p class="text-xs font-weight-bold mb-0"><%= p.getFecha_registro() %></p>
                                        </td>
                                        <td class="align-middle text-center">
                                            <!-- Enlace para editar -->
                                        </td>
                                        <td class="align-middle text-center">
                                        <!-- Enlace para editar -->
                                        <a href="/SistemaDDC/Servlet_peticiones?editarCliente=<%= p.getCedula()%>">Editar</a>
                                        </td>
                                        <td class="align-middle">
                                            <a href="/SistemaDDC/Servlet_peticiones?eliminarCliente=<%= p.getCedula()%>" onclick="return confirmDelete()">Eliminar</a>
                                        </td>
                                    </tr>
                        <% } %>

                  </tbody>
                </table>
            </form>
        </div>
      </div>
    </div>
  </div>
</div>


<script type="text/javascript">
    function confirmDelete() {
//Ingresamos un mensaje a mostrar
        var mensaje = confirm("¿Deseas eliminar este registro?");
//Detectamos si el usuario acepto el mensaje
        return mensaje;
    }
</script>   

<jsp:include page="/JSP/views/footer.jsp" />
