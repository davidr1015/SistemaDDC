<%@page import="Operaciones.Cliente"%>
<%@page import="Operaciones.Producto"%>
<%@page import="java.util.Vector"%>
<jsp:include page="/JSP/views/header.jsp" />
<%
 
    Vector<Producto> productos = (Vector<Producto>) request.getAttribute("productos");
    Vector<Cliente> clientes = (Vector<Cliente>) request.getAttribute("clientes");
    String nombre = (String) request.getAttribute("nombre");
    int id = (int) request.getAttribute("id");
      
    request.removeAttribute("productos");
    request.removeAttribute("clientes");
%> 
<div class="container text-center">
    <div class="row">
        <div class="col-md-6 p-4">
            <div class="row">
                <div class="col-md-12 pr-1">
                    <div class="form-group">
                        <input type="text" class="form-control" name="buscador" id="buscador" placeholder="Buscar">
                    </div>
                </div>
            </div>
            <div class="row" id="productos" style="overflow-y: scroll; height: 370px">

                <% for (Producto p : productos) {%>
                <div class="col producto" data-producto="<%=p.getId()%>"
                     data-nombre="<%=p.getDescripcion()%>" data-precio="<%=p.getPrecio()%>" data-cantidad="<%=p.getCantidad()%>">
                    <div class="card shadow-sm ">
                        <svg class="bd-placeholder-img card-img-top"  role="img"  preserveAspectRatio="xMidYMid slice" focusable="false"><img style="width: 100%; height: 150px; object-fit: cover; position:absolute" src="public/uploads/<%= p.getFoto()%>" alt="alt"/></svg>
                        <div class="card-body" style="max-height: 200px;">
                            <p class="card-textc nombre" 
                               style="height: 40px; display: flex; justify-content: center; align-items: center;" >
                                <%=p.getDescripcion()%> 
                            </p>
                            <p class="card-text">$<%=p.getPrecio()%></p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn bg-gradient-primary mb-0 agregar">Agregar</button>
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
        <div class="col-md-6" id="carrito">

            <div class="row bg-body pr-2" >
                <h5 class="text-start">Factura de venta</h5>
                <div class="col-md-6 pr-1">
                    <div class="form-group" style="text-align: left">
                        <label >Vendedor</label>
                        <input type="hidden" id="vendedor" name="vendedor" value="<%=id %>">
                        <input type="text" class="form-control" value="<%=nombre %>"  disabled>
                    </div>
                </div>

                <div class="col-md-6 pr-1">
                    <div class="form-group" style="text-align: left">
                        <label ">Cliente</label>
                        <select id="cliente" name="cliente" class="form-control">
                            <% for (Cliente p : clientes) {%>
                            <option value="<%=p.getCedula()%>"><%=p.getNombre() %></option>
                            <% }%>
                        </select>

                    </div>
                </div>
            </div>

            <div class="row bg-body" style="height: 290px; overflow-y: auto;">
                <ul class="list-group mb-3 carrito-items">
                    <!--- <li class="list-group-item d-flex justify-content-between align-items-center lh-sm">
                         <div>
                             <h6 class="my-0">Product name</h6>
                             <small class="text-body-secondary">Brief description</small>
                         </div>
 
                         <input type="number" class="col-2" name="name" value="0" required>
                         <span class="text-body-secondary">$12</span>
                         <input type="submit" name="name" class="btn bg-gradient-secondary mb-0" value="Quitar">
                     </li> -->
                </ul>

            </div>


            <div class="row">
                <div class="update ml-auto mr-auto ">
                    <button type="submit" name="registrarProducto" class="btn bg-gradient-info mb-0 text-light" id="terminar-compra">Terminar compra <small class="total ml-3">$0</small></button>
                </div>
            </div>



        </div>
    </div>

</div>


<script>
    document.addEventListener("keyup", e => {
        if (e.target.matches("#buscador")) {
            if (e.key === "Escape") {
                e.target.value = "";
            }

            document.querySelectorAll(".producto").forEach(producto => {
                const nombreElement = producto.querySelector(".nombre");
                const nombreTexto = nombreElement.textContent.toLowerCase();

                nombreTexto.includes(e.target.value.toLowerCase()) ?
                        producto.classList.remove("filtro") :
                        producto.classList.add("filtro");
            });
        }
    });

</script>


<script src="public/js/carritoVenta.js"></script>

<jsp:include page="/JSP/views/footer.jsp" />
