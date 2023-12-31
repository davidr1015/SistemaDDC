package Servlet;

import Operaciones.*;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.SQLException;
import java.util.UUID;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet(name = "Servlet_peticiones", urlPatterns = {"/Servlet_peticiones"})
@MultipartConfig
public class Servlet_peticiones extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.setContentType("application/json");
        try (PrintWriter out = response.getWriter()) {

        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        java.io.PrintWriter out = response.getWriter();

        try {
            HttpSession session = request.getSession();
            if (session != null && session.getAttribute("nombreUsuario") != null) {
                String page = request.getParameter("page");

//        ****Inicio Productos****
                String editarProducto = request.getParameter("editarProducto");
                String eliminarProducto = request.getParameter("eliminarProducto");

                if ("productos".equals(page)) {
                    Vector v = Producto.consultar();
                    request.setAttribute("productos", v);
                    request.getRequestDispatcher("/JSP/views/productos/index.jsp").forward(request, response);
                }

                if (editarProducto != null) {
                    Vector v = Producto.consultarPorId(editarProducto);
                    request.setAttribute("producto", v);
                    request.getRequestDispatcher("/JSP/views/productos/editar.jsp").forward(request, response);
                }

                if (eliminarProducto != null) {
                    if (Producto.eliminar(eliminarProducto)) {
                        response.sendRedirect("/SistemaDDC/Servlet_peticiones?page=productos");
                    }
                }

//          ****Fin Productos****
//          ****Inicio Cliente****
                String editarCliente = request.getParameter("editarCliente");
                String eliminarCliente = request.getParameter("eliminarCliente");

                if (editarCliente != null) {
                    Vector v = Cliente.consultarPorId(editarCliente);
                    request.setAttribute("cliente", v);
                    request.getRequestDispatcher("/JSP/views/clientes/editar.jsp").forward(request, response);
                }

                if (eliminarCliente != null) {
                    if (Cliente.eliminar(eliminarCliente)) {
                        response.sendRedirect("/SistemaDDC/Servlet_peticiones?page=clientes");
                    }
                }
//          ****Fin Cliente****

//          ****Inicio Compras****
                String mostrarCompra = request.getParameter("mostrarCompra");

                if (mostrarCompra != null) {
                    Vector v = Compra.consultarPorId(mostrarCompra);
                    request.setAttribute("compra", v);
                    request.getRequestDispatcher("/JSP/views/compras/mostrar.jsp").forward(request, response);
                }

//          ****Fin Compras****
//          ****Inicio Usuarios****
                String editarUsuario = request.getParameter("editarUsuario"); //Boton editarUsuario en vista usuarios/editar, recibe un id
                String eliminarUsuario = request.getParameter("eliminarUsuario"); //Boton eliminarUsuario en vista usuarios/editar, recibe un id

                if ("usuarios".equals(page)) { // Verifica si se selecciona USUARIOS en el menu de navegacion
                    Vector v = Usuario.consultar();
                    request.setAttribute("usuarios", v);
                    request.getRequestDispatcher("/JSP/views/usuarios/index.jsp").forward(request, response);
                }

                if (editarUsuario != null) {
                    Vector v = Usuario.consultarPorId(editarUsuario);
                    request.setAttribute("usuario", v);
                    request.getRequestDispatcher("/JSP/views/usuarios/editar.jsp").forward(request, response);
                }

                if (eliminarUsuario != null) {
                    if (Usuario.eliminar(eliminarUsuario)) {
                        response.sendRedirect("/SistemaDDC/Servlet_peticiones?page=usuarios");
                    }
                }

//          ****Fin Usuarios
//          **** Inicio Inventario****
                if ("inventario".equals(page)) {
                    Vector v = Producto.consultar();
                    request.setAttribute("productos", v);
                    request.getRequestDispatcher("/JSP/views/inventario/index.jsp").forward(request, response);
                }

                if ("clientes".equals(page)) {

                    // Verificar si la sesión existe y contiene la información necesaria
                    Vector v = Cliente.consultar();
                    request.setAttribute("cliente", v);
                    request.getRequestDispatcher("/JSP/views/clientes/index.jsp").forward(request, response);

//                
                }

                if ("compras".equals(page)) {
                    Vector v = Compra.consultar();
                    request.setAttribute("compra", v);
                    request.getRequestDispatcher("/JSP/views/compras/index.jsp").forward(request, response);
                }

                if ("ventas".equals(page)) {
                    Vector v = Venta.consultar();
                    request.setAttribute("venta", v);
                    request.getRequestDispatcher("/JSP/views/ventas/index.jsp").forward(request, response);
                }

                if ("caja".equals(page)) {
                    Vector v = Producto.consultar();
                    Vector v2 = Cliente.consultar();
                    HttpSession session2 = request.getSession(false);
                    String nombreUsuario = (String) session2.getAttribute("nombreUsuario");
                    int idUsuario = (int) session2.getAttribute("idUsuario");
                    request.setAttribute("productos", v);
                    request.setAttribute("clientes", v2);
                    request.setAttribute("id", idUsuario);
                    request.setAttribute("nombre", nombreUsuario);
                    request.getRequestDispatcher("/JSP/views/caja/index.jsp").forward(request, response);
                }

                if ("nueva_compra".equals(page)) {
                    Vector v = Producto.consultar();
                    Vector v2 = Cliente.consultar();
                    HttpSession session2 = request.getSession(false);
                    String nombreUsuario = (String) session2.getAttribute("nombreUsuario");
                    int idUsuario = (int) session2.getAttribute("idUsuario");
                    request.setAttribute("productos", v);
                    request.setAttribute("clientes", v2);
                    request.setAttribute("id", idUsuario);
                    request.setAttribute("nombre", nombreUsuario);
                    request.getRequestDispatcher("/JSP/views/caja_compra/index.jsp").forward(request, response);
                }

                if ("cerrarSesion".equals(page)) {
                    HttpSession session1 = request.getSession(false);

                    if (session1 != null) {
                        // Invalidar y cerrar la sesión
                        session.invalidate();
                    }

                    // Redirigir al usuario al formulario de inicio de sesión o a otra página según sea necesario
                    response.sendRedirect("/SistemaDDC/");
                }

            } else {
                response.sendRedirect("/SistemaDDC/");
            }
//<<<<<<< HEAD
//=======
//            
//            if ("clientes".equals(page)) {
//                Vector v = Cliente.consultar();
//                request.setAttribute("cliente", v);
//                request.getRequestDispatcher("/JSP/views/clientes/index.jsp").forward(request, response);
//            }
//            
//            if ("compras".equals(page)) {
//                Vector v = Compra.consultar();
//                request.setAttribute("compra", v);
//                request.getRequestDispatcher("/JSP/views/compras/index.jsp").forward(request, response);
//            }
//            
//            if ("ventas".equals(page)) {
//                Vector v = Venta.consultar();
//                request.setAttribute("venta", v);
//                request.getRequestDispatcher("/JSP/views/ventas/index.jsp").forward(request, response);
//            }
//            
//            if ("caja".equals(page)) {
//                Vector v = Producto.consultar();
//                request.setAttribute("productos", v);
//                request.getRequestDispatcher("/JSP/views/caja/index.jsp").forward(request, response);
//            }
//            
//>>>>>>> f93b59766f4ded8e8f66390e11b6cd435835a676
        } catch (Exception e) {
            request.setAttribute("msg", "Verifique Datos :" + e); // la e es el tipo de error
            request.setAttribute("target", "index.jsp");
            request.getRequestDispatcher("ServletError").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        java.io.PrintWriter out = response.getWriter();

        try {

            if (request.getParameter("productos") != null) {
                request.getRequestDispatcher("/JSP/views/usuarios/editar.jsp").forward(request, response);
            }

//            Productos
            String registrarProducto = request.getParameter("registrarProducto");
            String actualizarProducto = request.getParameter("actualizarProducto");

            if (registrarProducto != null) {
                int id = 0;
                String descripcion = request.getParameter("descripcion");
                double precio = Double.parseDouble(request.getParameter("precio"));
                int cantidad_minima = Integer.parseInt(request.getParameter("cantidad_minima"));
                String ubicacion = request.getParameter("ubicacion");
                int activo = 1;
                String newFileName;

                Part filePart = request.getPart("foto");
                newFileName = loadFile(filePart);

                if (Producto.insertar(new Producto(id, descripcion, precio, cantidad_minima, ubicacion, newFileName))) {
                    response.sendRedirect("/SistemaDDC/Servlet_peticiones?page=productos");
                }
            }

            String productos = request.getParameter("productos");
            if (productos != null) {
                Vector v = Producto.consultarPorId("1");
                request.setAttribute("producto", v);
                request.getRequestDispatcher("/JSP/views/caja/index.jsp").forward(request, response);
            }
//            if (actualizarProducto != null) {
//                
//                String id = request.getParameter("id");
//                String descripcion = request.getParameter("descripcion");
//                String cantidad = request.getParameter("cantidad");
//                String precio = request.getParameter("precio");
//                String foto = request.getParameter("foto");
//                String activo = "1";
//                
//                if (Producto.actualizar(new Producto(id, descripcion, precio, cantidad, foto, activo))) {
//                    response.sendRedirect("/SistemaDDC/Servlet_peticiones?page=productos");    
//                }
//                
//            }

//          Clientes
            String registrarCliente = request.getParameter("registrarCliente");

            if (registrarCliente != null) {
                String cedula = request.getParameter("cedula");
                String nombre = request.getParameter("nombre");
                String correo = request.getParameter("correo");
                String telefono = request.getParameter("telefono");
                String fecha_registro = request.getParameter("fecha_registro");
                String activo = request.getParameter("activo");

                if (Cliente.insertar(new Cliente(cedula, nombre, correo, telefono, activo, fecha_registro))) {
                    response.sendRedirect("/SistemaDDC/Servlet_peticiones?page=clientes");
                }

            }

            if (actualizarProducto != null) {
                int id = Integer.parseInt(request.getParameter("id"));
                String descripcion = request.getParameter("descripcion");
                double precio = Double.parseDouble(request.getParameter("precio"));
                int cantidad_minima = Integer.parseInt(request.getParameter("cantidad_minima"));
                String ubicacion = request.getParameter("ubicacion");
                String foto_actual = request.getParameter("foto_actual");
                int activo = 1;
                String newFileName;

                Part filePart = request.getPart("foto");
                newFileName = loadFile(filePart);

                if ("".equals(newFileName)) {
                    newFileName = foto_actual;
                }

                if (Producto.actualizar(new Producto(id, descripcion, precio, cantidad_minima, ubicacion, newFileName))) {
                    response.sendRedirect("/SistemaDDC/Servlet_peticiones?page=productos");
                }

            }

//            Fin Productos
//            Usuarios
            String registrarUsuario = request.getParameter("registrarUsuario");
            String actualizarUsuario = request.getParameter("actualizarUsuario");

            if (registrarUsuario != null) {
                int id = Integer.parseInt(request.getParameter("cedula"));
                String nombres = request.getParameter("nombres");
                String email = request.getParameter("email");
                String rol = request.getParameter("rol");
                String login = request.getParameter("username");
                String pwd = request.getParameter("contraseña");

                if (Usuario.insertar(new Usuario(id, nombres, rol, email, login, pwd))) {
                    response.sendRedirect("/SistemaDDC/Servlet_peticiones?page=usuarios");
                }

            }

            if (actualizarUsuario != null) {
                int id = Integer.parseInt(request.getParameter("cedula"));
                String nombres = request.getParameter("nombres");
                String email = request.getParameter("email");
                String rol = request.getParameter("rol");
                String login = request.getParameter("username");
                String contraseña_actual = request.getParameter("contraseña_actual");

                out.print("actualziar");

                if (Usuario.actualizar(new Usuario(id, nombres, rol, email, login, contraseña_actual))) {
                    response.sendRedirect("/SistemaDDC/Servlet_peticiones?page=usuarios");
                }

            }

//            Actualizar Cliente
            String actualizarCliente = request.getParameter("actualizarCliente");
            if (actualizarCliente != null) {
                String cedula = request.getParameter("cedula");
                String nombre = request.getParameter("nombre");
                String correo = request.getParameter("correo");
                String telefono = request.getParameter("telefono");
                String activo = request.getParameter("activo");
                String fecha_registro = request.getParameter("fecha_registro");

                if (Cliente.actualizar(new Cliente(cedula, nombre, correo, telefono, activo, fecha_registro))) {
                    out.print("actualziar");
                    response.sendRedirect("/SistemaDDC/Servlet_peticiones?page=clientes");
                }

            }

            // Leer el cuerpo de la solicitud para obtener el JSON enviado
            BufferedReader reader = request.getReader();
            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }
            String json = sb.toString();

            // Analizar el JSON utilizando Gson
            JsonParser parser = new JsonParser();
            JsonObject jsonData = parser.parse(json).getAsJsonObject();

            String accion = jsonData.get("accion").getAsString();

            

            if ("venta".equals(accion)) {
                int vendedor = Integer.parseInt(jsonData.get("vendedor").getAsString());
            int cliente = Integer.parseInt(jsonData.get("cliente").getAsString());
                JsonArray productosArray = jsonData.getAsJsonArray("productos");
                double totalGeneral = 0;

                out.println("vendedor: " + vendedor);
                out.println("cliente: " + cliente);

                for (int i = 0; i < productosArray.size(); i++) {
                    JsonObject productoJson = productosArray.get(i).getAsJsonObject();
                    double precio = Double.parseDouble(productoJson.get("precio").getAsString());
                    int cantidad = Integer.parseInt(productoJson.get("cantidad").getAsString());
                    double total = precio * cantidad;
                    totalGeneral += total;

                    out.print(totalGeneral);
                }

                int id_venta = Venta.insertar(new Venta(0, vendedor, cliente, totalGeneral, ""));
                if (id_venta != 0) {
                    for (int i = 0; i < productosArray.size(); i++) {
                        JsonObject productoJson = productosArray.get(i).getAsJsonObject();
                        int id = Integer.parseInt(productoJson.get("producto").getAsString());
                        String descripcion = productoJson.get("nombre").getAsString();
                        Double precio = Double.parseDouble(productoJson.get("precio").getAsString());
                        int cantidad = Integer.parseInt(productoJson.get("cantidad").getAsString());

                        Venta.insertarDetalle(id_venta, new Producto(id, descripcion, precio, cantidad));
                        Producto.restarProducto(id, cantidad);
                    }
                } else {
                    response.getWriter().write("Datos de usuario recibidos correctamente");
                }
            }
            
            
            if ("compra".equals(accion)) {
                int vendedor = Integer.parseInt(jsonData.get("vendedor").getAsString());
                JsonArray productosArray = jsonData.getAsJsonArray("productos");
                double totalGeneral = 0;

                for (int i = 0; i < productosArray.size(); i++) {
                    JsonObject productoJson = productosArray.get(i).getAsJsonObject();
                    double precio = Double.parseDouble(productoJson.get("precio").getAsString());
                    int cantidad = Integer.parseInt(productoJson.get("cantidad").getAsString());
                    double total = precio * cantidad;
                    totalGeneral += total;

                    out.print(totalGeneral);
                }

                int id_compra = Compra.insertar(vendedor, totalGeneral);
                if (id_compra != 0) {
                    for (int i = 0; i < productosArray.size(); i++) {
                        JsonObject productoJson = productosArray.get(i).getAsJsonObject();
                        int id = Integer.parseInt(productoJson.get("producto").getAsString());
                        String descripcion = productoJson.get("nombre").getAsString();
                        Double precio = Double.parseDouble(productoJson.get("precio").getAsString());
                        int cantidad = Integer.parseInt(productoJson.get("cantidad").getAsString());

                        Compra.insertarDetalle(id_compra, new Producto(id, descripcion, precio, cantidad));
                        Producto.sumarProducto(id, cantidad);
                    }
                } else {
                    response.getWriter().write("Datos de usuario recibidos correctamente");
                }
            }

            

        } catch (Exception e) {
            request.setAttribute("msg", "Verifique Datos :" + e); // la e es el tipo de error
            request.setAttribute("target", "index.jsp");
//            request.getRequestDispatcher("ServletError").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    public String loadFile(Part filePart) throws IOException {
        String originalFileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String newFileName = "";
        if (!originalFileName.isEmpty()) {
            // Genera un nuevo nombre de archivo único
            String fileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
            newFileName = UUID.randomUUID().toString() + fileExtension;

            // Define la carpeta de destino en el servidor
            String uploadPath = getServletContext().getRealPath("") + "public/uploads";

            // Asegúrate de que la carpeta de destino exista; si no, créala
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            // Ruta completa del nuevo archivo de imagen
            String newFilePath = uploadPath + File.separator + newFileName;

            // Lee el contenido del archivo subido y guárdalo con el nuevo nombre
            try (InputStream input = filePart.getInputStream()) {
                Files.copy(input, Paths.get(newFilePath), StandardCopyOption.REPLACE_EXISTING);
            }

        }

        return newFileName;
    }

}
