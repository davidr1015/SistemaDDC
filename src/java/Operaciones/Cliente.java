package Operaciones;

import java.sql.*;

import java.util.Vector;

public class Cliente {
         private String cedula;
         private String nombre;
         private String correo;
         private String telefono;
         private String activo;
         private String fecha_registro;

    public Cliente(String cedula, String nombre, String correo, String telefono, String activo, String fecha_registro) {
        this.cedula = cedula;
        this.nombre = nombre;
        this.correo = correo;
        this.telefono = telefono;
        this.activo = activo;
        this.fecha_registro = fecha_registro;
    }

    
    
    
    
     public static synchronized boolean insertar(Cliente p)  throws SQLException
   {                    
              DBManager dbm = new DBManager();
              Connection con = dbm.getConnection();

              PreparedStatement st=con.prepareStatement("INSERT INTO clientes(cedula,nombre,"+
                                                "correo,telefono)"+
                                                "VALUES(?,?,?,?)");
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

              PreparedStatement st=con.prepareStatement("INSERT INTO clientes(cedula,nombres,"+
                                                "correo,telefono,fecha_registro)"+
                                                "VALUES(?,?,?,?,'current_timestamp()')");
             st.setString(1, p.getCedula());
             st.setString(2, p.getNombre());
             st.setString(3, p.getCorreo());
             st.setString(4, p.getTelefono());
             st.setString(4, p.getFecha_registro());
             int res=st.executeUpdate();
             st.close();
             dbm.closeConnection( con );
             return res==1;      
   }
     
     public static synchronized boolean eliminar(Cliente p)  throws SQLException
   {                    
              DBManager dbm = new DBManager();
              Connection con = dbm.getConnection();

              PreparedStatement st=con.prepareStatement("INSERT INTO clientes(cedula,nombres,"+
                                                "correo,telefono,fecha_registro)"+
                                                "VALUES(?,?,?,?,current_timestamp())");
             st.setString(1, p.getCedula());
             st.setString(2, p.getNombre());
             st.setString(3, p.getCorreo());
             st.setString(4, p.getTelefono());
             st.setString(4, p.getFecha_registro());
             int res=st.executeUpdate();
             st.close();
             dbm.closeConnection( con );
             return res==1;      
   }
     
     public static synchronized Vector consultar()  throws SQLException
   {                    
              Vector<Cliente> clientes = new Vector<>();
            DBManager dbm = new DBManager();

            try (Connection con = dbm.getConnection();
                 PreparedStatement st = con.prepareStatement("SELECT cedula,nombre,correo,telefono,activo,fecha_registro FROM clientes");
                 ResultSet rs = st.executeQuery()) {

                while (rs.next()) {
                    Cliente mostrar = new Cliente(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
                            rs.getString(6));
                    clientes.add(mostrar);
                }

            } catch (SQLException e) {
                e.printStackTrace(); // Manejar la excepción adecuadamente en tu aplicación
            } 

            return clientes;      
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

    public String getActivo() {
        return activo;
    }

    public void setActivo(String activo) {
        this.activo = activo;
    }

    public String getFecha_registro() {
        return fecha_registro;
    }

    public void setFecha_registro(String fecha_registro) {
        this.fecha_registro = fecha_registro;
    }

   
    
   
     
}
