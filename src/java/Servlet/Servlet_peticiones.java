/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import Operaciones.*;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.SQLException;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author camat
 */
@WebServlet(name = "Servlet_peticiones", urlPatterns = {"/Servlet_peticiones"})
@MultipartConfig
public class Servlet_peticiones extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Servlet_peticiones</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Servlet_peticiones at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        java.io.PrintWriter out = response.getWriter();
        try {

            String page = request.getParameter("page");

//        Inicio Productos
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
            
            if(eliminarProducto != null) {
                if (Producto.eliminar(eliminarProducto)) {
                    response.sendRedirect("/SistemaDDC/Servlet_peticiones?page=productos");
                }
            }
                 
            
//          Fin Productos

            if ("inventario".equals(page)) {
                request.getRequestDispatcher("/JSP/views/inventario/index.jsp").forward(request, response);
            }

            if ("clientes".equals(page)) {
                request.getRequestDispatcher("/JSP/views/clientes/index.jsp").forward(request, response);
            }

            

            if ("compras".equals(page)) {
                request.getRequestDispatcher("/JSP/views/compras/index.jsp").forward(request, response);
            }

            if ("ventas".equals(page)) {
                request.getRequestDispatcher("/JSP/views/ventas/index.jsp").forward(request, response);
            }

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

//            Productos
            String registrarProducto = request.getParameter("registrarProducto");
            String actualizarProducto = request.getParameter("precio");
            
            if (registrarProducto != null) {
                String id = "";
                String descripcion = request.getParameter("descripcion");
                String cantidad = request.getParameter("cantidad");
                String precio = request.getParameter("precio");
                String foto = request.getParameter("foto");
                String activo = "1";
                
                if (Producto.insertar(new Producto(id, descripcion, precio, cantidad, foto, activo))) {
                    response.sendRedirect("/SistemaDDC/Servlet_peticiones?page=productos");
                }
                
            }
            
            if (actualizarProducto != null) {
                
                String id = request.getParameter("id");
                String descripcion = request.getParameter("descripcion");
                String cantidad = request.getParameter("cantidad");
                String precio = request.getParameter("precio");
                String foto = request.getParameter("foto");
                String activo = "1";
                
                if (Producto.actualizar(new Producto(id, descripcion, precio, cantidad, foto, activo))) {
                    response.sendRedirect("/SistemaDDC/Servlet_peticiones?page=productos");    
                }
                
            }
            

//            FIN NAVBAR
          
           
        } catch (Exception e) {
            request.setAttribute("msg", "Verifique Datos :" + e); // la e es el tipo de error
            request.setAttribute("target", "index.jsp");
            request.getRequestDispatcher("ServletError").forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
