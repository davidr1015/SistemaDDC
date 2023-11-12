package Operaciones;

import java.sql.*;

public class Cliente {
         private String cedula;
         private String nombre;
         private String correo;
         private String telefono;

    public Cliente(String cedula, String nombre, String correo, String telefono) {
        this.cedula = cedula;
        this.nombre = nombre;
        this.correo = correo;
        this.telefono = telefono;
    }
    
    
    
     public static synchronized boolean insertar(Cliente p)  throws SQLException
   {                    
              DBManager dbm = new DBManager();
              Connection con = dbm.getConnection();

              PreparedStatement st=con.prepareStatement("INSERT INTO productos(id,descripcion,"+
                                                "precio,cantidad,foto)"+
                                                "VALUES(?,?,?,?,?)");
             st.setString(1, p.getCedula());
             st.setString(2, p.getNombre());
             st.setString(3, p.getCorreo());
             st.setString(4, p.getTelefono());
             int res=st.executeUpdate();
             st.close();
             dbm.closeConnection( con );
             return res==1;      
   }
     
     public static synchronized boolean actualizar(Cliente p)  throws SQLException
   {                    
              DBManager dbm = new DBManager();
              Connection con = dbm.getConnection();

              PreparedStatement st=con.prepareStatement("INSERT INTO tclientes(cedula,nombres,"+
                                                "apellidos,direccion,email,celular)"+
                                                "VALUES(?,?,?,?,?,?)");
             st.setString(1, p.getCedula());
             st.setString(2, p.getNombre());
             st.setString(3, p.getCorreo());
             st.setString(4, p.getTelefono());
             int res=st.executeUpdate();
             st.close();
             dbm.closeConnection( con );
             return res==1;      
   }
     
     public static synchronized boolean eliminar(Cliente p)  throws SQLException
   {                    
              DBManager dbm = new DBManager();
              Connection con = dbm.getConnection();

              PreparedStatement st=con.prepareStatement("INSERT INTO tclientes(cedula,nombres,"+
                                                "apellidos,direccion,email,celular)"+
                                                "VALUES(?,?,?,?,?)");
             st.setString(1, p.getCedula());
             st.setString(2, p.getNombre());
             st.setString(3, p.getCorreo());
             st.setString(4, p.getTelefono());
             int res=st.executeUpdate();
             st.close();
             dbm.closeConnection( con );
             return res==1;      
   }
     
     public static synchronized boolean consultar(Producto p)  throws SQLException
   {                    
              DBManager dbm = new DBManager();
              Connection con = dbm.getConnection();

              PreparedStatement st=con.prepareStatement("INSERT INTO tclientes(cedula,nombres,"+
                                                "apellidos,direccion,email,celular)"+
                                                "VALUES(?,?,?,?,?,?)");
             st.setString(1, p.getId());
             st.setString(2, p.getDescripcion());
             st.setString(3, p.getPrecio());
             st.setString(4, p.getCantidad());
              st.setString(5, p.getFoto());
             st.setString(6, p.getActivo());
             int res=st.executeUpdate();
             st.close();
             dbm.closeConnection( con );
             return res==1;      
   }

    public String getCedula() {
        return cedula;
    }

    public void setCedula(String cedula) {
        this.cedula = cedula;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }
    
   
     
}
