<%@page import="Operaciones.Producto"%>
<%@page import="java.util.Vector"%>
<jsp:include page="/JSP/views/header.jsp" />
<%
    Vector<Producto> productos = (Vector<Producto>) request.getAttribute("productos");
    request.removeAttribute("productos");
%> 
<div class="container text-center">
    <div class="row">
        <div class="col">
            <div class="row">
                
                <% for (Producto p : productos) {%>
                <div class="col">
                    <div class="card shadow-sm">
                        <svg class="bd-placeholder-img card-img-top" width="100%" height="100" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"></rect><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
                        <div class="card-body">
                            <p class="card-text text-2xl"><%=p.getDescripcion()%> </p>
                            <p class="card-text"><%=p.getPrecio()%></p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary">Agregar</button>
                                </div>
                                <small class="text-body-secondary">9 unidades</small>
                            </div>
                        </div>
                    </div>
                </div>
                
                <% }%>
                
            </div>
        </div>
        <div class="col">
            Column
        </div>
    </div>
</div>

<jsp:include page="/JSP/views/footer.jsp" />
