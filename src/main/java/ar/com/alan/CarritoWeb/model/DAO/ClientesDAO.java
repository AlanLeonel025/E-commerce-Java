package ar.com.alan.CarritoWeb.model.DAO;

import ar.com.alan.CarritoWeb.model.entities.Cliente;
import ar.com.alan.CarritoWeb.utils.ConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class ClientesDAO {

    public ArrayList<Cliente> getListadoDeClientes() {

        ArrayList<Cliente> listaClientes = new ArrayList<>();

        try {
            ConnectionManager connectionManager = new ConnectionManager();

            Connection con = connectionManager.getConnection();

            Statement stm;
            ResultSet rs;
            String sql;

            sql = "SELECT * FROM clientes";

            stm = con.createStatement();

            rs = stm.executeQuery(sql);

            while (rs.next()) {

                Cliente cliente = new Cliente();

                cliente.setId(rs.getInt("cli_id"));
                cliente.setNombre(rs.getString("cli_nombre"));
                cliente.setApellido(rs.getString("cli_apellido"));
                cliente.setEmail(rs.getString("cli_email"));

                listaClientes.add(cliente);
            }

            stm.close();
            rs.close();
            con.close();
        } catch (SQLException ex) {
            System.out.println("Error al obtener el listado de clientes");
        }

        return listaClientes;
    }

    public Cliente getCliente(int id) {

        Cliente cliente = new Cliente();

        try {
            ConnectionManager connectionManager = new ConnectionManager();

            Connection con = connectionManager.getConnection();

            Statement stm;
            ResultSet rs;
            String sql;

            sql = "SELECT * FROM clientes WHERE cli_id = " + id;

            stm = con.createStatement();

            rs = stm.executeQuery(sql);

            if (rs.next()) {

                cliente.setId(rs.getInt("cli_id"));
                cliente.setNombre(rs.getString("cli_nombre"));
                cliente.setApellido(rs.getString("cli_apellido"));
                cliente.setEmail(rs.getString("cli_email"));

            }

            stm.close();
            rs.close();
            con.close();
        } catch (SQLException ex) {
            System.out.println("Error al obtener los datos del clientes");
        }

        return cliente;
    }

    public void eliminarCliente(int id) {

        try {
            ConnectionManager connectionManager = new ConnectionManager();

            Connection con = connectionManager.getConnection();

            PreparedStatement stm;
            String sql;

            sql = "DELETE FROM clientes "
                    + "WHERE cli_id = ?";

            stm = con.prepareStatement(sql);

            stm.setInt(1, id);

            stm.executeUpdate();

            stm.close();
            con.close();
        } catch (SQLException ex) {
            System.out.println("Error al eliminar el cliente");
        }

    }

    public void guardarCliente(Cliente cliente) {

        try {
            ConnectionManager connectionManager = new ConnectionManager();

            Connection con = connectionManager.getConnection();

            PreparedStatement stm;

            String sql;

            if (cliente.getId() == 0) {
                sql = "INSERT INTO clientes(cli_nombre, cli_apellido, cli_email)"
                        + " VALUES(?, ?, ?)";
            } else {
                sql = "UPDATE clientes SET cli_nombre=?, cli_apellido=?, cli_email=?"
                        + " WHERE cli_id=?";
            }

            stm = con.prepareStatement(sql);

            stm.setString(1, cliente.getNombre());
            stm.setString(2, cliente.getApellido());
            stm.setString(3, cliente.getEmail());

            if (cliente.getId() != 0) {
                stm.setInt(4, cliente.getId());
            }

            stm.executeUpdate();

            stm.close();
            con.close();

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }

    }

    public ArrayList<Cliente> buscarClientes(String terminoBuscado) {

        ArrayList<Cliente> listaClientes = new ArrayList<>();

        try {

            ConnectionManager connectionManager = new ConnectionManager();

            Connection con = connectionManager.getConnection();

            Statement stm;
            ResultSet rs;
            String sql;

            sql = "SELECT *"
                    + " FROM clientes"
                    + " WHERE cli_nombre LIKE '%" + terminoBuscado + "%'"
                    + " OR cli_apellido LIKE '%" + terminoBuscado + "%'"
                    + " OR cli_email LIKE '%" + terminoBuscado + "%'";

            stm = con.createStatement();

            rs = stm.executeQuery(sql);

            while (rs.next()) {
                Cliente cliente = new Cliente();

                cliente.setId(rs.getInt("cli_id"));
                cliente.setNombre(rs.getString("cli_nombre"));
                cliente.setApellido(rs.getString("cli_apellido"));
                cliente.setEmail(rs.getString("cli_email"));

                listaClientes.add(cliente);
            }

            stm.close();
            rs.close();
            con.close();

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }

        return listaClientes;
    }
}
