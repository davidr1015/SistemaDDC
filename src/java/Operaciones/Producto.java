package Operaciones;

import java.sql.*;
import java.util.Vector;

public class Producto {

    private int id;
    private String descripcion;
    private double precio;
    private int cantidad_minima;
    private String ubicacion;
    private int cantidad;
    private String foto;
    private int activo;

    public Producto(int id, String descripcion, double precio, int cantidad_minima, String ubicacion, String foto) {
        this.id = id;
        this.descripcion = descripcion;
        this.precio = precio;
        this.cantidad_minima = cantidad_minima;
        this.ubicacion = ubicacion;
        this.foto = foto;
    }

    public Producto(int id, String descripcion, double precio, int cantidad) {
        this.id = id;
        this.descripcion = descripcion;
        this.precio = precio;
        this.cantidad = cantidad;
    }

    

    
    
    public Producto(int id, String descripcion, double precio, int cantidad_minima, String ubicacion, int cantidad, String foto, int activo) {
        this.id = id;
        this.descripcion = descripcion;
        this.precio = precio;
        this.cantidad_minima = cantidad_minima;
        this.ubicacion = ubicacion;
        this.cantidad = cantidad;
        this.foto = foto;
        this.activo = activo;
    }
    
    public static synchronized boolean insertar(Producto p) throws SQLException {
        DBManager dbm = new DBManager();
        Connection con = dbm.getConnection();
//
        PreparedStatement st = con.prepareStatement("INSERT INTO productos(descripcion,"
                + "precio,cantidad_minima,ubicacion, foto)"
                + "VALUES(?,?,?,?,?)");
        st.setString(1, p.getDescripcion());
        st.setDouble(2, p.getPrecio());
        st.setInt(3, p.getCantidad_minima());
        st.setString(4, p.getUbicacion());
        st.setString(5, p.getFoto());
        int res = st.executeUpdate();
        st.close();
        dbm.closeConnection(con);
        return res == 1;
    }

    public static synchronized boolean actualizar(Producto p) throws SQLException {
        DBManager dbm = new DBManager();
        Connection con = dbm.getConnection();

        PreparedStatement st = con.prepareStatement("UPDATE productos SET descripcion = ?, precio = ?, cantidad_minima = ?, ubicacion = ?,  foto = ?  WHERE id = ?");
        st.setString(1, p.getDescripcion());
        st.setDouble(2, p.getPrecio());
        st.setInt(3, p.getCantidad_minima());
        st.setString(4, p.getUbicacion());
        st.setString(5, p.getFoto());
        st.setInt(6, p.getId());

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
    
    
    public static synchronized boolean restarProducto(int id, int cantidad) throws SQLException {
        DBManager dbm = new DBManager();
        Connection con = dbm.getConnection();

          PreparedStatement st = con.prepareStatement("UPDATE productos SET cantidad = cantidad - ? WHERE id = ?");
        st.setInt(1, cantidad);
        st.setInt(2, id);

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

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public int getCantidad_minima() {
        return cantidad_minima;
    }

    public void setCantidad_minima(int cantidad_minima) {
        this.cantidad_minima = cantidad_minima;
    }

    public String getUbicacion() {
        return ubicacion;
    }

    public void setUbicacion(String ubicacion) {
        this.ubicacion = ubicacion;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public int getActivo() {
        return activo;
    }

    public void setActivo(int activo) {
        this.activo = activo;
    }

}
