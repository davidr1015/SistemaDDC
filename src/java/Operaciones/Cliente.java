package Operaciones;

import java.sql.*;
import java.util.Vector;

public class Cliente {
         private int cedula;
         private String nombre;
         private String correo;
         private String telefono;

    public Cliente(int cedula, String nombre, String correo, String telefono) {
        this.cedula = cedula;
        this.nombre = nombre;
        this.correo = correo;
        this.telefono = telefono;
    }
    
    
     
    public static synchronized boolean insertar(Cliente p) throws SQLException {
        DBManager dbm = new DBManager();
        Connection con = dbm.getConnection();
//
        PreparedStatement st = con.prepareStatement("INSERT INTO productos(descripcion,"
                + "precio,cantidad_minima,foto)"
                + "VALUES(?,?,?,?)");
//        st.setString(1, p.getDescripcion());
//        st.setDouble(2, p.getPrecio());
//        st.setInt(3, p.getCantidad_minima());
//        st.setString(4, p.getFoto());
        int res = st.executeUpdate();
        st.close();
        dbm.closeConnection(con);
        return res == 1;
    }

    public static synchronized boolean actualizar(Cliente p) throws SQLException {
        DBManager dbm = new DBManager();
        Connection con = dbm.getConnection();

        PreparedStatement st = con.prepareStatement("UPDATE productos SET descripcion = ?, precio = ?, cantidad_minima = ?, ubicacion,= ?,  foto = ?  WHERE id = ?");
//        st.setString(1, p.getDescripcion());
//        st.setDouble(2, p.getPrecio());
//        st.setInt(3, p.getCantidad());
//        st.setString(4, p.getFoto());
//        st.setInt(5, p.getId());

        int res = st.executeUpdate();
        st.close();
        dbm.closeConnection(con);
        return res == 1;
    }

    public static synchronized boolean eliminar(String id) throws SQLException {
        DBManager dbm = new DBManager();
        Connection con = dbm.getConnection();

          PreparedStatement st = con.prepareStatement("UPDATE productos SET activo = 0 WHERE id = ?");
        st.setString(1, id);

        int res = st.executeUpdate();
        st.close();
        dbm.closeConnection(con);
        return res == 1;
    }

    public static synchronized Vector consultar() throws SQLException {
        Vector<Producto> productos = new Vector<>();
        DBManager dbm = new DBManager();

        try (Connection con = dbm.getConnection(); PreparedStatement st = con.prepareStatement("SELECT id, descripcion, precio, cantidad_minima, ubicacion, cantidad, foto, activo FROM productos WHERE activo = 1"); 
                ResultSet rs = st.executeQuery()) {
//      int id, String descripcion, double precio, int cantidad_minima, String ubicacion, String foto
            while (rs.next()) {
                Producto mostrar = new Producto(rs.getInt("id"), rs.getString("descripcion"), rs.getDouble("precio"),
                        rs.getInt("cantidad_minima"), rs.getString("ubicacion"), rs.getInt("cantidad"), rs.getString("foto"), rs.getInt("activo"));
                productos.add(mostrar);
            }

        } catch (SQLException e) {
            e.printStackTrace(); // Manejar la excepción adecuadamente en tu aplicación
        }

        return productos;

    }

    public static synchronized Vector consultarPorId(String id) throws SQLException {
        Vector producto = null;
        DBManager dbm = new DBManager();
        Connection con = dbm.getConnection();

        PreparedStatement st = con.prepareStatement("SELECT id, descripcion, precio, cantidad_minima, ubicacion, cantidad, foto, activo FROM productos WHERE id = ?");
        st.setString(1, id);
        ResultSet rs = st.executeQuery();
        producto = new Vector();

        if (rs.next()) {
            producto.add(new Producto(rs.getInt("id"), rs.getString("descripcion"), rs.getDouble("precio"),
                        rs.getInt("cantidad_minima"), rs.getString("ubicacion"), rs.getInt("cantidad"), rs.getString("foto"), rs.getInt("activo")));
        }
        rs.close();
        st.close();
        dbm.closeConnection(con);
        return producto;
    }

    public int getCedula() {
        return cedula;
    }

    public void setCedula(int cedula) {
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
