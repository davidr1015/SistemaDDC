package Operaciones;

import Operaciones.*;
import java.sql.*;

public class Venta {


    private int id;
    private int id_usuario;
    private int id_cliente;
    private double total;
    private String fecha_registro;

    public Venta(int id, int id_usuario, int id_cliente, double total, String fecha_registro) {
        this.id = id;
        this.id_usuario = id_usuario;
        this.id_cliente = id_cliente;
        this.total = total;
        this.fecha_registro = fecha_registro;
    }

 

    public static synchronized int insertar(Venta p) throws SQLException {
        DBManager dbm = new DBManager();
        Connection con = dbm.getConnection();

// Especifica que quieres recuperar las claves generadas
        PreparedStatement st = con.prepareStatement(
                "INSERT INTO ventas(id_cliente, id_usuario, total) VALUES(?,?,?)",
                PreparedStatement.RETURN_GENERATED_KEYS);

        st.setInt(1, p.getId_cliente());
        st.setInt(2, p.getId_usuario());
        st.setDouble(3, p.getTotal());

        int res = st.executeUpdate();
        int idVentaGenerado = -1; // Inicializa con un valor que indique un fallo

        if (res == 1) {
            // Recupera las claves generadas
            ResultSet generatedKeys = st.getGeneratedKeys();

            if (generatedKeys.next()) {
                idVentaGenerado = generatedKeys.getInt(1);
                System.out.println("ID de venta generado: " + idVentaGenerado);

                // Aquí puedes hacer lo que necesites con el ID generado
            } else {
                System.out.println("No se pudo obtener el ID de venta generado");
            }
        }

        st.close();
        dbm.closeConnection(con);

        return idVentaGenerado;
    }

    public static synchronized boolean insertarDetalle(int id_venta, Producto p) throws SQLException {
        DBManager dbm = new DBManager();
        Connection con = dbm.getConnection();

        PreparedStatement st = con.prepareStatement("INSERT INTO detalles_venta(id_venta,"
                + "id_producto, nombre, precio, cantidad, subtotal)"
                + "VALUES(?,?,?,?,?,?)");
        st.setInt(1, id_venta);
        st.setInt(2, p.getId());
        st.setString(3, p.getDescripcion());
        st.setDouble(4, p.getPrecio());
        st.setInt(5, p.getCantidad());
        st.setDouble(6, p.getPrecio() * p.getCantidad());
        int res = st.executeUpdate();
        st.close();
        dbm.closeConnection(con);
        return res == 1;

    }

    public static synchronized boolean actualizar(Venta p) throws SQLException {
        DBManager dbm = new DBManager();
        Connection con = dbm.getConnection();

        PreparedStatement st = con.prepareStatement("INSERT INTO tclientes(cedula,nombres,"
                + "apellidos,direccion,email,celular)"
                + "VALUES(?,?,?,?,?,?)");
//             st.setString(1, p.getId());
//             st.setString(2, p.getId_usuario());
//             st.setString(2, p.getId_cliente());
//             st.setString(3, p.getTotal());
//             st.setString(4, p.getFecha_registro());
        int res = st.executeUpdate();
        st.close();
        dbm.closeConnection(con);
        return res == 1;
    }

    public static synchronized boolean eliminar(Venta p) throws SQLException {
        DBManager dbm = new DBManager();
        Connection con = dbm.getConnection();

        PreparedStatement st = con.prepareStatement("INSERT INTO tclientes(cedula,nombres,"
                + "apellidos,direccion,email,celular)"
                + "VALUES(?,?,?,?,?,?)");
//             st.setString(1, p.getId());
//             st.setString(2, p.getId_usuario());
//             st.setString(2, p.getId_cliente());
//             st.setString(3, p.getTotal());
//             st.setString(4, p.getFecha_registro());
        int res = st.executeUpdate();
        st.close();
        dbm.closeConnection(con);
        return res == 1;
    }

    public static synchronized boolean consultar(Venta p) throws SQLException {
        DBManager dbm = new DBManager();
        Connection con = dbm.getConnection();

        PreparedStatement st = con.prepareStatement("INSERT INTO tclientes(cedula,nombres,"
                + "apellidos,direccion,email,celular)"
                + "VALUES(?,?,?,?,?,?)");
//             st.setString(1, p.getId());
//             st.setString(2, p.getId_usuario());
//             st.setString(2, p.getId_cliente());
//             st.setString(3, p.getTotal());
//             st.setString(4, p.getFecha_registro());
        int res = st.executeUpdate();
        st.close();
        dbm.closeConnection(con);
        return res == 1;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public int getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getFecha_registro() {
        return fecha_registro;
    }

    public void setFecha_registro(String fecha_registro) {
        this.fecha_registro = fecha_registro;
    }

}
