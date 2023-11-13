
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
                                        <td class="align-middle">
                                            <!-- Enlace para eliminar -->
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


<div class="modal fade" id="modal-confirma" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Eliminar bodegas</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <p>¿Desea eliminar esta bodega?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn bg-gradient-dark mb-0" data-bs-dismiss="modal">Cancelar</button>
        <a class="btn bg-gradient-danger mb-0" id="btn-ok">Eliminar</a>
      </div>
    </div>
  </div>
</div>

<jsp:include page="/JSP/views/footer.jsp" />
