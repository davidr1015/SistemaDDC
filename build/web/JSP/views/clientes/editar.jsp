<%@page import="java.util.Vector"%>
<%@page import="Operaciones.Cliente"%>
<jsp:include page="/JSP/views/header.jsp" />


<%
    Vector cliente = (Vector) request.getAttribute("cliente");
    request.removeAttribute("cliente");
    Cliente p = (Cliente) cliente.get(0);
%> 

<div class="col-md-12">
    <div class="card card-user">
        <div class="card-header">
            <h5 class="card-title">Editar Cliente</h5>
        </div>
        <div class="card-body">
            <form action="/SistemaDDC/Servlet_peticiones" method="POST" enctype="multipart/form-data" autocomplete="off">


                <div class="row">
                    <div class="col-md-4 pr-1">
                        <div class="form-group">
                            <label>Cedula</label>
                            <input type="text" name="" class="form-control" value="<%=p.getCedula()%>" disabled>
                            <input type="hidden" id="id" name="cedula" value="<%=p.getCedula()%>">
                        </div>
                    </div>

                
                    <div class="col-md-4 pr-1">
                        <div class="form-group">
                            <label>Nombres</label>
                            <input type="text" class="form-control" name="nombre" value="<%= p.getNombre()%>" required>
                        </div>
                    </div>
                </div>


                <div class="row">
                    <div class="col-md-3 pr-1">
                        <div class="form-group">
                            <label>Correo</label>
                            <input type="email" name="correo" class="form-control" value="<%= p.getCorreo()%>" required>
                        </div>
                    </div>

                    <div class="col-md-3 pr-1">
                        <div class="form-group">
                            <label>Telefono</label>
                            <input type="number" name="telefono" class="form-control" value="<%= p.getTelefono()%>" required>
                        </div>
                    </div>

                    <div class="col-md-4 pr-1">
                        <div class="form-group">
                            <label>Fecha registro</label>
                            <input type="text" name="fecha_registro" class="form-control" value="<%= p.getFecha_registro()%>" required>
                        </div>
                    </div>
                </div>

                <div class="row">

                </div>




                <div class="row">
                    <div class="update ml-auto mr-auto">
                        <button type="submit"  name="actualizarCliente" class="btn bg-gradient-primary mb-0">Actualizar</button>
                        <a href="/SistemaDDC/Servlet_peticiones?page=clientes" class="btn btn-outline-secondary mb-0 ">Regresar</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>




<!-- Campo oculto para almacenar el botón presionado -->

<jsp:include page="/JSP/views/footer.jsp" />



