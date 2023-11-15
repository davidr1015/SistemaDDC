package Operaciones;

import java.sql.*;
import java.util.*;

public class Usuario {

    private int id;
    private String nombre;
    private String rol;
    private String email;
    private String login;
    private String pwd;

    public Usuario(String nombre, String rol, String login, String pwd) {
        this.nombre = nombre;
        this.rol = rol;
        this.login = login == null ? "" : login.trim();
        this.pwd = pwd == null ? "" : pwd.trim();
    }

    public Usuario(int id, String nombre, String rol, String login, String pwd) {
        this.id = id;
        this.nombre = nombre;
        this.rol = rol;
        this.login = login;
        this.pwd = pwd;
    }
    
    

    public Usuario(int id, String nombre, String rol, String email, String login, String pwd) {
        this.id = id;
        this.nombre = nombre;
        this.rol = rol;
        this.email = email;
        this.login = login;
        this.pwd = pwd;
    }

    public static synchronized Usuario Validar(String s_login, String s_pwd) throws SQLException {
        DBManager dbm = new DBManager();//cargar driver
        Connection con = dbm.getConnection();  //abres la conexion
        Usuario obj = null;
        Statement st = con.createStatement();//crear un objeto sentencia, es el que puede ejecutar acciones en la base de datos
        ResultSet rs = st.executeQuery("Select id, nombre, rol, login, pwd from usuarios  "
                + " where login = '" + s_login + "' and pwd= '" + s_pwd + "' ");
        while (rs.next()) {
            obj = new Usuario(rs.getInt("id"),rs.getString("nombre"), rs.getString("rol"), rs.getString("login"), rs.getString("pwd"));
        }
        rs.close();
        st.close();
        dbm.closeConnection(con);
        return obj;
    }

    public static synchronized Vector consultar() throws SQLException {
        Vector<Usuario> usuarios = new Vector<>();
        DBManager dbm = new DBManager();

        try (Connection con = dbm.getConnection(); PreparedStatement st = con.prepareStatement("SELECT * FROM usuarios WHERE activo = 1"); ResultSet rs = st.executeQuery()) {

            while (rs.next()) {
                Usuario mostrar = new Usuario(rs.getInt("id"), rs.getString("nombre"), rs.getString("rol"), rs.getString("email"), rs.getString("login"), rs.getString("pwd"));
                usuarios.add(mostrar);
            }

        } catch (SQLException e) {
            e.printStackTrace(); // Manejar la excepción adecuadamente en tu aplicación
        }

        return usuarios;

    }

    public static synchronized Vector consultarPorId(String id) throws SQLException {
        Vector usuario = null;
        DBManager dbm = new DBManager();
        Connection con = dbm.getConnection();

        PreparedStatement st = con.prepareStatement("SELECT * FROM usuarios WHERE id = ?");
        st.setString(1, id);
        ResultSet rs = st.executeQuery();
        usuario = new Vector();

        if (rs.next()) {
            usuario.add(new Usuario(rs.getInt("id"), rs.getString("nombre"), rs.getString("rol"), rs.getString("email"), rs.getString("login"), rs.getString("pwd")));
        }
        rs.close();
        st.close();
        dbm.closeConnection(con);
        return usuario;
    }

    public static synchronized boolean insertar(Usuario p) throws SQLException {
        DBManager dbm = new DBManager();
        Connection con = dbm.getConnection();
//
        PreparedStatement st = con.prepareStatement("INSERT INTO usuarios(id,"
                + "nombre,rol,email,login, pwd)"
                + "VALUES(?,?,?,?,?, ?)");
        st.setInt(1, p.getId());
        st.setString(2, p.getNombre());
        st.setString(3, p.getRol());
        st.setString(4, p.getEmail());
        st.setString(5, p.getLogin());
        st.setString(6, p.getPwd());
        int res = st.executeUpdate();
        st.close();
        dbm.closeConnection(con);
        return res == 1;
    }

    public static synchronized boolean actualizar(Usuario p) throws SQLException {
        DBManager dbm = new DBManager();
        Connection con = dbm.getConnection();

        PreparedStatement st = con.prepareStatement("UPDATE usuarios SET nombre = ?, rol = ?, email = ?, login = ?,  pwd = ?  WHERE id = ?");
        st.setString(1, p.getNombre());
        st.setString(2, p.getRol());
        st.setString(3, p.getEmail());
        st.setString(4, p.getLogin());
        st.setString(5, p.getPwd());
        st.setInt(6, p.getId());

        int res = st.executeUpdate();
        st.close();
        dbm.closeConnection(con);
        return res == 1;
    }

    public static synchronized boolean eliminar(String id) throws SQLException {
        DBManager dbm = new DBManager();
        Connection con = dbm.getConnection();

        PreparedStatement st = con.prepareStatement("UPDATE usuarios SET activo = 0 WHERE id = ?");
        st.setString(1, id);

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

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

}
