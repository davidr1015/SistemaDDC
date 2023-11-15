package Operaciones;

import java.sql.*;
import java.util.Vector;

public class Compra {
         private String id;
         private String id_usuario;
         private String nombre_usuario;
         private String rol_usuario;
         private String total;
         private String fecha_registro;

    public Compra(String id, String id_usuario, String nombre_usuario, String rol_usuario, String total, String fecha_registro) {
        this.id = id;
        this.id_usuario = id_usuario;
        this.nombre_usuario = nombre_usuario;
        this.rol_usuario = rol_usuario;
        this.total = total;
        this.fecha_registro = fecha_registro;
    }

    
         
     public static synchronized boolean insertar(Compra p)  throws SQLException
   {                    
              DBManager dbm = new DBManager();
              Connection con = dbm.getConnection();

              PreparedStatement st=con.prepareStatement("INSERT INTO productos(id,descripcion,"+
                                                "precio,cantidad,foto,activo)"+
                                                "VALUES(?,?,?,?,?,?)");
//             st.setString(1, p.getId());
//             st.setString(2, p.getId_usuario());
//             st.setString(3, p.getTotal());
//             st.setString(4, p.getFecha_registro());
             int res=st.executeUpdate();
             st.close();
             dbm.closeConnection( con );
             return res==1;      
   }
     
     public static synchronized Vector consultar() throws SQLException {
        Vector<Compra> compra = new Vector<>();
        DBManager dbm = new DBManager();

        try (Connection con = dbm.getConnection(); PreparedStatement st = con.prepareStatement("SELECT c.id, u.id, u.nombre, u.rol, c.total, c.fecha_registro FROM compras c JOIN usuarios u ON c.id_usuario=u.id;"); 
                ResultSet rs = st.executeQuery()) {
//      int id, String descripcion, double precio, int cantidad_minima, String ubicacion, String foto
            while (rs.next()) {
                Compra mostrar = new Compra(rs.getString(1), rs.getString(2),
                        rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6));
                compra.add(mostrar);
            }

        } catch (SQLException e) {
            e.printStackTrace(); // Manejar la excepción adecuadamente en tu aplicación
        }

        return compra;

    }
     
     public static synchronized Vector consultarPorId(String id) throws SQLException {
        Vector compra = null;
        DBManager dbm = new DBManager();
        Connection con = dbm.getConnection();

        PreparedStatement st = con.prepareStatement("SELECT c.id, u.id, u.nombre, u.rol, c.total, c.fecha_registro FROM compras c JOIN usuarios u ON c.id_usuario=u.id;");
        st.setString(1, id);
        ResultSet rs = st.executeQuery();
        compra = new Vector();

        if (rs.next()) {
            compra.add(new Compra(rs.getString(1), rs.getString(2),
                        rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6)));
        }
        rs.close();
        st.close();
        dbm.closeConnection(con);
        return compra;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(String id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getNombre_usuario() {
        return nombre_usuario;
    }

    public void setNombre_usuario(String nombre_usuario) {
        this.nombre_usuario = nombre_usuario;
    }

    public String getRol_usuario() {
        return rol_usuario;
    }

    public void setRol_usuario(String rol_usuario) {
        this.rol_usuario = rol_usuario;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }

    public String getFecha_registro() {
        return fecha_registro;
    }

    public void setFecha_registro(String fecha_registro) {
        this.fecha_registro = fecha_registro;
    }


    
   
     
}
