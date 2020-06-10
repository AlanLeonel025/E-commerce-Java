package ar.com.alan.CarritoWeb.model.DAO;

import ar.com.alan.CarritoWeb.model.entities.Usuarios;
import ar.com.alan.CarritoWeb.utils.ConnectionManager;
import java.sql.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class UsuarioDAO {

    public boolean getUserLogin(String email, String password) {

        Usuarios usuario = new Usuarios();

        try {

            ConnectionManager connectionManager = new ConnectionManager();
            Connection con = connectionManager.getConnection();
            PreparedStatement stm;
            ResultSet rs;
            String sql;

            sql = "SELECT * FROM `usuarios` WHERE email_usuario = ? and pass_usuario = ? ";

            stm = con.prepareStatement(sql);

            stm.setString(1, email);
            stm.setString(2, password);

            rs = stm.executeQuery();

            if (rs.next()) {
                usuario.setUsuario_id(rs.getInt("id_usuario"));
                usuario.setNom_usuario(rs.getString("nom_usuario"));
                usuario.setApell_usuario(rs.getString("apell_usuario"));
                usuario.setEmail_usuario(rs.getString("pass_usuario"));
                usuario.setPerfilUsuario(rs.getString("perfil"));
                stm.close();
                rs.close();
                return true;
            } else {
                return false;
            }

        } catch (SQLException ex) {
            System.out.println("Error al obtener user");
        }

        return false;
    }

    public String getTypePermiso(String email, String password) {

        try {

            ConnectionManager connectionManager = new ConnectionManager();
            Connection con = connectionManager.getConnection();
            PreparedStatement stm;
            ResultSet rs;
            String sql;

            sql = "SELECT perfil FROM `usuarios` WHERE email_usuario = ? and pass_usuario = ? ";

            stm = con.prepareStatement(sql);

            stm.setString(1, email);
            stm.setString(2, password);

            rs = stm.executeQuery();

            if (rs.next()) {
                return "" + rs.getString(1);
            }

        } catch (SQLException ex) {
            System.out.println("Error al obtener user");
        }

        return "";
    }

}
