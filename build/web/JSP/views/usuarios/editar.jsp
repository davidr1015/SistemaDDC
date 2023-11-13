<%@page import="Operaciones.Usuario"%>
<%@page import="java.util.Vector"%>
<%@page import="Operaciones.Producto"%>
<jsp:include page="/JSP/views/header.jsp" />


<%
    Vector usuario = (Vector) request.getAttribute("usuario");
    request.removeAttribute("usuario");
    Usuario p = (Usuario) usuario.get(0);
%> 

<div class="col-md-12">
    <div class="card card-user">
        <div class="card-header">
            <h5 class="card-title">Editar Usuario</h5>
        </div>
        <div class="card-body">
            <form action="/SistemaDDC/Servlet_peticiones" method="POST" enctype="multipart/form-data" autocomplete="off">


                <input type="hidden" name="cedula" value="<%=p.getId()%>" class="form-control">
                <div class="row">
                    <div class="col-md-4 pr-1">
                        <div class="form-group">
                            <label>Cedula</label>
                            <input type="text" name="id_muestra" class="form-control" value="<%=p.getId()%>" disabled>
                        </div>
                    </div>

                    <div class="col-md-4 pr-1">
                        <div class="form-group">
                            <label>Nombre Completo</label>
                            <input type="text" class="form-control" name="nombres" value="<%=p.getNombre()%>" required>
                        </div>
                    </div>

                </div>


                <div class="row">
                    <div class="col-md-4 pr-1">
                        <div class="form-group">
                            <label>Email</label>
                            <input type="email" name="email" class="form-control" value="<%=p.getEmail()%>" required>
                        </div>
                    </div>

                    <div class="col-md-4 pr-1">
                        <div class="form-group">
                            <label>Rol</label>
                            <input type="text" name="rol" class="form-control" value="<%=p.getRol()%>">
                        </div>
                    </div>


                </div>

                <div class="row">
                    <div class="col-md-4 pr-1">
                        <div class="form-group">
                            <label>Username</label>
                            <input type="text" name="username" class="form-control" value="<%=p.getLogin()%>" required>
                        </div>
                    </div>

                    <div class="col-md-4 pr-1" style="display:none;">
                        <div class="form-group">
                            <label>Contraseña</label>
                            <input type="password" name="contraseña" class="form-control" value="">
                            <input type="hidden"  name="contraseña_actual" value="<%=p.getPwd()%>">
                        </div>
                    </div>

                </div>




                <div class="row">
                    <div class="update ml-auto mr-auto">
                        <button type="submit"  name="actualizarUsuario" class="btn bg-gradient-primary mb-0">Actualizar</button>
                        <a href="/SistemaDDC/Servlet_peticiones?page=usuarios" class="btn btn-outline-secondary mb-0 ">Regresar</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>




<!-- Campo oculto para almacenar el botón presionado -->

<jsp:include page="/JSP/views/footer.jsp" />



