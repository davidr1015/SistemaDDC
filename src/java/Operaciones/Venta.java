package Operaciones;

import java.sql.*;

public class Venta {
         private String id;
         private String id_usuario;
         private String id_cliente;
         private String total;
         private String fecha_registro;

    public Venta(String id, String id_usuario, String id_cliente, String total, String fecha_registro) {
        this.id = id;
        this.id_usuario = id_usuario;
        this.id_cliente = id_cliente;
        this.total = total;
        this.fecha_registro = fecha_registro;
    }
    
     public static synchronized boolean insertar(Venta p)  throws SQLException
   {                    
              DBManager dbm = new DBManager();
              Connection con = dbm.getConnection();

              PreparedStatement st=con.prepareStatement("INSERT INTO productos(id,descripcion,"+
                                                "precio,cantidad,foto,activo)"+
                                                "VALUES(?,?,?,?,?,?)");
             st.setString(1, p.getId());
             st.setString(2, p.getId_usuario());
             st.setString(2, p.getId_cliente());
             st.setString(3, p.getTotal());
             st.setString(4, p.getFecha_registro());
             int res=st.executeUpdate();
             st.close();
             dbm.closeConnection( con );
             return res==1;      
   }
     
     public static synchronized boolean actualizar(Venta p)  throws SQLException
   {                    
              DBManager dbm = new DBManager();
              Connection con = dbm.getConnection();

              PreparedStatement st=con.prepareStatement("INSERT INTO tclientes(cedula,nombres,"+
                                                "apellidos,direccion,email,celular)"+
                                                "VALUES(?,?,?,?,?,?)");
             st.setString(1, p.getId());
             st.setString(2, p.getId_usuario());
             st.setString(2, p.getId_cliente());
             st.setString(3, p.getTotal());
             st.setString(4, p.getFecha_registro());
             int res=st.executeUpdate();
             st.close();
             dbm.closeConnection( con );
             return res==1;      
   }
     
     public static synchronized boolean eliminar(Venta p)  throws SQLException
   {                    
              DBManager dbm = new DBManager();
              Connection con = dbm.getConnection();

              PreparedStatement st=con.prepareStatement("INSERT INTO tclientes(cedula,nombres,"+
                                                "apellidos,direccion,email,celular)"+
                                                "VALUES(?,?,?,?,?,?)");
             st.setString(1, p.getId());
             st.setString(2, p.getId_usuario());
             st.setString(2, p.getId_cliente());
             st.setString(3, p.getTotal());
             st.setString(4, p.getFecha_registro());
             int res=st.executeUpdate();
             st.close();
             dbm.closeConnection( con );
             return res==1;      
   }
     
     public static synchronized boolean consultar(Venta p)  throws SQLException
   {                    
              DBManager dbm = new DBManager();
              Connection con = dbm.getConnection();

              PreparedStatement st=con.prepareStatement("INSERT INTO tclientes(cedula,nombres,"+
                                                "apellidos,direccion,email,celular)"+
                                                "VALUES(?,?,?,?,?,?)");
             st.setString(1, p.getId());
             st.setString(2, p.getId_usuario());
             st.setString(2, p.getId_cliente());
             st.setString(3, p.getTotal());
             st.setString(4, p.getFecha_registro());
             int res=st.executeUpdate();
             st.close();
             dbm.closeConnection( con );
             return res==1;      
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

    public String getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(String id_cliente) {
        this.id_cliente = id_cliente;
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
