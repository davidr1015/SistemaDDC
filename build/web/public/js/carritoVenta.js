// Obtener referencia a los elementos de productos y carrito
const productos = document.getElementById("productos");
const carrito = document.getElementById("carrito");
const carritoItems = carrito.querySelector(".carrito-items");
const totalGeneralSpan = carrito.querySelector(".total"); // Referencia al total general
const botonTerminarCompra = document.getElementById("terminar-compra");

// Agregar evento de clic a los botones de agregar al carrito
productos.addEventListener("click", agregarAlCarrito);
// Agregar evento de cambio de valor para editar la cantidad en el carrito
carrito.addEventListener("change", editarCantidad);
// Agregar evento de clic para eliminar un producto del carrito
carritoItems.addEventListener("click", eliminarProducto);
// Agregar evento de clic para terminar la compra
botonTerminarCompra.addEventListener("click", terminarCompra);

function agregarAlCarrito(event) {
  // Verificar que se haya hecho clic en el botón de agregar al carrito
  if (event.target.classList.contains("agregar")) {
    // Obtener datos del producto seleccionado
    const productoDiv = event.target.closest(".producto");
    const producto = productoDiv.dataset.producto;
    const nombre = productoDiv.dataset.nombre;
    const precio = parseFloat(productoDiv.dataset.precio);
     const cantidadDisponible = parseFloat(productoDiv.dataset.cantidad); // Nueva línea

    // Verificar si el producto ya está en el carrito
    const productosEnCarrito = carritoItems.getElementsByClassName("carrito-item");
    for (const productoEnCarrito of productosEnCarrito) {
      if (productoEnCarrito.dataset.producto === producto) {
        // Si ya existe, actualizar la cantidad y el total
        const cantidadInput = productoEnCarrito.querySelector(".cantidad");
        
        const cantidadEnCarrito = parseFloat(cantidadInput.value);
        
        // Verificar que la nueva cantidad no sea mayor que la cantidad disponible
        if (cantidadEnCarrito + 1 > cantidadDisponible) {
          alert("No hay suficientes unidades disponibles.");
          return;
        }
       
        // Actualizar la cantidad y el total
        const total = precio * (cantidadEnCarrito + 1);
        productoEnCarrito.dataset.cantidad = cantidadEnCarrito + 1;
        cantidadInput.value = cantidadEnCarrito + 1;
        productoEnCarrito.querySelector(".total").textContent = `$${total.toFixed(2)}`;
        
        calcularTotalGeneral();
        return;
      }
    }

    // Si el producto no está en el carrito, agregarlo
    const nuevaFila = document.createElement("li");
    nuevaFila.classList.add("carrito-item");
    nuevaFila.classList.add("list-group-item", "d-flex", "justify-content-between", "align-items-center", "lh-sm");
    nuevaFila.dataset.producto = producto;
    nuevaFila.dataset.nombre = nombre;
    nuevaFila.dataset.precio = precio;
    nuevaFila.dataset.cantidad = 1;
    nuevaFila.dataset.cantidadDisponible = cantidadDisponible;

    const infoProducto = document.createElement("div");

    const columnaProducto = document.createElement("h6");
    columnaProducto.textContent = nombre;
    columnaProducto.style = "width: 200px;, overflow: hidden; text-overflow: ellipsis;";
    columnaProducto.classList.add("my-0");

    const columnaPrecio = document.createElement("small");
    columnaPrecio.textContent = `$${(precio).toFixed(2)}`;
    columnaPrecio.classList.add("precio");
    columnaPrecio.classList.add("text-body-secondary");

    infoProducto.appendChild(columnaProducto);
    infoProducto.appendChild(columnaPrecio);
    infoProducto.classList.add("info-producto");

    const columnaCantidad = document.createElement("input");
    columnaCantidad.type = "number";
    columnaCantidad.value = "1";
    columnaCantidad.classList.add("cantidad", "col-2", "p-2");

    const columnaTotal = document.createElement("span");
    columnaTotal.textContent = `$${precio.toFixed(2)}`;
    columnaTotal.classList.add("total", "text-body-secondary");

    const columnaEliminar = document.createElement("button");
    columnaEliminar.textContent = "Quitar";
    columnaEliminar.classList.add("eliminar", "btn", "bg-gradient-secondary", "mb-0");

    // nuevaFila.appendChild(columnaProducto);
    // nuevaFila.appendChild(columnaPrecio);
    nuevaFila.appendChild(infoProducto);
    nuevaFila.appendChild(columnaCantidad);
    nuevaFila.appendChild(columnaTotal);
    nuevaFila.appendChild(columnaEliminar);
    carritoItems.appendChild(nuevaFila);

    calcularTotalGeneral();
  }
}

function editarCantidad(event) {
  // Verificar que se haya cambiado la cantidad de un producto en el carrito
  if (event.target.classList.contains("cantidad")) {
    const cantidadInput = event.target;
    const nuevaCantidad = parseFloat(cantidadInput.value);
    if (isNaN(nuevaCantidad) || nuevaCantidad <= 0) {
      cantidadInput.value = cantidadInput.parentNode.dataset.cantidad;
      return;
    }

     // Obtener la cantidad disponible del producto
    const filaProducto = cantidadInput.parentNode;
    const cantidadDisponible = parseFloat(filaProducto.dataset.cantidadDisponible);

    // Verificar que la nueva cantidad no sea mayor que la cantidad disponible
    if (nuevaCantidad > cantidadDisponible) {
      cantidadInput.value = cantidadDisponible;
      return;
    }
    const precio = parseFloat(filaProducto.dataset.precio);
    filaProducto.dataset.cantidad = nuevaCantidad;
    const total = precio * nuevaCantidad;
    filaProducto.querySelector(".total").textContent = `$${total.toFixed(2)}`;

    calcularTotalGeneral();
  }
}

function calcularTotalGeneral() {
  let totalGeneral = 0;
  const productosEnCarrito =
    carritoItems.getElementsByClassName("carrito-item");
  for (const productoEnCarrito of productosEnCarrito) {
    const precio = parseFloat(productoEnCarrito.dataset.precio);
    const cantidad = parseFloat(productoEnCarrito.dataset.cantidad);
    const total = precio * cantidad;
    totalGeneral += total;
  }
  totalGeneralSpan.textContent = `$${totalGeneral.toFixed(2)}`; // Actualizar el total general
}

function eliminarProducto(event) {
  // Verificar que se haya hecho clic en el botón de eliminar
  if (event.target.classList.contains("eliminar")) {
    const filaProducto = event.target.parentNode;
    carritoItems.removeChild(filaProducto);
    calcularTotalGeneral();
  }
}

function terminarCompra() {
  const productosEnCarrito =
    carritoItems.getElementsByClassName("carrito-item");
  const productosArray = [];
  
   if (productosEnCarrito.length === 0) {
    alert("El carrito esta vacio. Agregue productos antes de terminar la compra.");
    return;
  }

  for (const productoEnCarrito of productosEnCarrito) {
    const producto = productoEnCarrito.dataset.producto;
    const nombre = productoEnCarrito.dataset.nombre;
    const precio = parseFloat(productoEnCarrito.dataset.precio);
    const cantidad = parseFloat(productoEnCarrito.dataset.cantidad);
    productosArray.push({ producto, nombre, precio, cantidad });
  }

   const vendedor = document.getElementById("vendedor").value;
   const cliente = document.getElementById("cliente").value;

  const jsonData = {
    productos: productosArray,
   vendedor: vendedor,
   cliente: cliente
  };
fetch('Servlet_peticiones', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(jsonData)
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('Error en la solicitud al servidor');
        }
        return response.text();
    })
    .then(data => {
        // Manejar la respuesta del servidor si es necesario
        console.log(data);
    })
    .catch(error => {
        // Manejar errores de la solicitud
        console.error(error);
    });

  carritoItems.innerHTML = "";
  calcularTotalGeneral();
}
