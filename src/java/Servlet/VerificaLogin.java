package Servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import Operaciones.*;

public class VerificaLogin extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
         request.getRequestDispatcher("index.jsp").forward( request, response );
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String login, pwd ;
        Usuario usuvo = null;
        Usuario usuvoE = null;
        try {

            login = (String) request.getParameter("login");
            pwd = (String) request.getParameter("pwd");
            if (( login ==null) ||(pwd ==null ))
                throw new NullPointerException("Faltan los datos del usuario...");

            usuvo =  usuvoE.Validar(login, pwd);

            if ( usuvo != null )
            {
               getServletContext().getRequestDispatcher("/JSP/views/inventario/index.jsp").forward(request,response) ;
            } else   throw new NullPointerException("El usuario no existe...");
            } catch( Exception e) {
                request.setAttribute("msg",e.getMessage());
                request.setAttribute("target", "index.jsp");
                request.getRequestDispatcher("ServletError").forward(request, response);
            }
    }
    public String getServletInfo() {
        return "Short description";
    }
    // </editor-fold>


}
