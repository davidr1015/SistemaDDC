package Servlet;
/**
 *
 * @author Antonio_Borre Barraza
 */
import javax.servlet.*;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;


//@WebServlet(name = "ServletError", urlPatterns = {"/ServletError"})
public class ServletError extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, java.io.IOException {
        response.setContentType("text/html");
        java.io.PrintWriter out = response.getWriter();

        String msg = (String)request.getAttribute("msg");
        String target = (String)request.getAttribute("target");

        //* Construye la p�gina de error que se muestra en la aplicaci�n
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Sistema Web</title>");
        out.println("<body>");
        out.println( "<h1 align=\"center\">");
        out.println("Se ha Producido un Mensaje");
        out.println("</H1>");
        out.println( "<h2 align=\"center\">");
        out.println(msg);
        out.println("</H2>");
        out.println( "<A href=\""+target+"\" >");
        out.println("<h3 align=\"center\"> Haga click aqu� para Regresar... </h3>");
        out.println("</A>");
        out.println("<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>");
        out.println( "<h5 align=\"center\">");
        out.println( "Derechos Reservados 2009");
        out.println("</H5>");
        out.println("</body>");
        out.println("</head>");
        out.println("</html>");
        out.close();
    }
   
    public String getServletInfo() {
        return "Short description";
    }

}
