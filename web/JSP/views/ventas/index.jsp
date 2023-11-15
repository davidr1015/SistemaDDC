
<%@page import="java.util.Vector"%>
<%@page import="Operaciones.Venta"%>
<jsp:include page="/JSP/views/header.jsp" />


<%
    Vector<Venta> venta = (Vector<Venta>) request.getAttribute("venta");
    request.removeAttribute("venta");
%> 



<div class="col-md-12">
    <div class="card">
        <div class="card-header">
            <h4 class="card-title">Venta</h4>
        </div>
        <div class="card-body">
            <br>
            <div class="card-body px-0 pt-0 pb-2">
                <div class="table-responsive p-0">
                    <form action="/SistemaDDC/Servlet_peticiones">
                        <table class="table align-items-center mb-0" id="table">
                            <thead>
                                <tr>
                                    <th width="150px" class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Nombre vendedor</th>
                                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Nombre Cliente</th>
                                    <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Total</th>
                                    <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Fecha Registro</th>
                                    <th class="text-secondary opacity-7"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (Venta p : venta) {%>
                                <tr>
                                    <td class="align-middle text-center text-sm">
                                        <p class="text-xs font-weight-bold mb-0"><%= p.getNombre_usuario()%> </p>
                                    </td>
                                    <td class="align-middle text-center text-sm">
                                        <p class="text-xs font-weight-bold mb-0"> <%= p.getNombre_cliente()%></p>
                                    </td>
                                    <td class="align-middle text-center text-sm">
                                        <p class="text-xs font-weight-bold mb-0"> <%= p.getTotal()%></p>
                                    </td>
                                    <td class="align-middle text-center text-sm">
                                        <p class="text-xs font-weight-bold mb-0"> <%= p.getFecha_registro()%></p>
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


<jsp:include page="/JSP/views/footer.jsp" />
