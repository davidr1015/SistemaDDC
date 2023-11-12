package Operaciones;

import java.sql.*;
import java.util.Vector;

public class Producto {

    private String id;
    private String descripcion;
    private String precio;
    private String cantidad;
    private String foto;
    private String activo;

    public Producto(String id, String descripcion, String precio, String cantidad, String foto, String activo) {
        this.id = id;
        this.descripcion = descripcion;
        this.precio = precio;
        this.cantidad = cantidad;
        this.foto = foto;
        this.activo = activo;
    }

    public static synchronized boolean insertar(Producto p) throws SQLException {
        DBManager dbm = new DBManager();
        Connection con = dbm.getConnection();

        PreparedStatement st = con.prepareStatement("INSERT INTO productos(descripcion,"
                + "precio,cantidad,foto)"
                + "VALUES(?,?,?,?)");
        st.setString(1, p.getDescripcion());
        st.setString(2, p.getPrecio());
        st.setString(3, p.getCantidad());
        st.setString(4, p.getFoto());
        int res = st.executeUpdate();
        st.close();
        dbm.closeConnection(con);
        return res == 1;
    }

    public static synchronized boolean actualizar(Producto p) throws SQLException {
        DBManager dbm = new DBManager();
        Connection con = dbm.getConnection();

        PreparedStatement st = con.prepareStatement("UPDATE productos SET descripcion = ?, precio = ?, cantidad = ?, foto = ?  WHERE id = ?");
        st.setString(1, p.getDescripcion());
        st.setString(2, p.getPrecio());
        st.setString(3, p.getCantidad());
        st.setString(4, p.getFoto());
        st.setString(5, p.getId());

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

        try (Connection con = dbm.getConnection(); PreparedStatement st = con.prepareStatement("SELECT id, descripcion, precio, cantidad, foto, activo FROM productos WHERE activo = 1"); 
                ResultSet rs = st.executeQuery()) {

            while (rs.next()) {
                Producto mostrar = new Producto(rs.getString(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6));
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

        PreparedStatement st = con.prepareStatement("SELECT id, descripcion, precio, cantidad, foto, activo FROM productos WHERE id = ?");
        st.setString(1, id);
        ResultSet rs = st.executeQuery();
        producto = new Vector();

        if (rs.next()) {
            producto.add(new Producto(rs.getString(1), rs.getString(2), rs.getString(3),
                    rs.getString(4), rs.getString(5), rs.getString(6)));
        }
        rs.close();
        st.close();
        dbm.closeConnection(con);
        return producto;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getPrecio() {
        return precio;
    }

    public void setPrecio(String precio) {
        this.precio = precio;
    }

    public String getCantidad() {
        return cantidad;
    }

    public void setCantidad(String cantidad) {
        this.cantidad = cantidad;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public String getActivo() {
        return activo;
    }

    public void setActivo(String activo) {
        this.activo = activo;
    }

}
