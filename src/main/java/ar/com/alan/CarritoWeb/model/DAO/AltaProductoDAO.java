package ar.com.alan.CarritoWeb.model.DAO;

import ar.com.alan.CarritoWeb.model.entities.Producto;
import ar.com.alan.CarritoWeb.utils.ConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class AltaProductoDAO {

    public ArrayList<Producto> getListadoDeProducto() {

        ArrayList<Producto> listaProducto = new ArrayList<>();

        try {
            ConnectionManager connectionManager = new ConnectionManager();

            Connection con = connectionManager.getConnection();

            Statement stm;
            ResultSet rs;
            String sql;

            sql = "SELECT * FROM productos";

            stm = con.createStatement();

            rs = stm.executeQuery(sql);

            while (rs.next()) {

                Producto producto = new Producto();

                producto.setId(rs.getInt("prod_id"));
                producto.setNombre(rs.getString("prod_nombre"));
                producto.setPrecio(rs.getFloat("prod_precio"));
                producto.setImagen(rs.getString("prod_imagen"));

                listaProducto.add(producto);
            }

            stm.close();
            rs.close();
            con.close();
        } catch (SQLException ex) {
            System.out.println("Error al obtener el listado de productos");
        }

        return listaProducto;
    }

    public Producto getProducto(int id) {

        Producto producto = new Producto();

        try {
            ConnectionManager connectionManager = new ConnectionManager();

            Connection con = connectionManager.getConnection();

            Statement stm;
            ResultSet rs;
            String sql;

            sql = "SELECT * FROM productos WHERE prod_id = " + id;

            stm = con.createStatement();

            rs = stm.executeQuery(sql);

            if (rs.next()) {

                producto.setId(rs.getInt("prod_id"));
                producto.setNombre(rs.getString("prod_nombre"));
                producto.setPrecio(rs.getFloat("prod_precio"));
                producto.setImagen(rs.getString("prod_imagen"));

            }

            stm.close();
            rs.close();
            con.close();
        } catch (SQLException ex) {
            System.out.println("Error al obtener los datos de los productos");
        }

        return producto;
    }

    public void eliminarProductos(int id) {

        try {
            ConnectionManager connectionManager = new ConnectionManager();

            Connection con = connectionManager.getConnection();

            PreparedStatement stm;
            String sql;

            sql = "DELETE FROM productos "
                    + "WHERE prod_id = ?";

            stm = con.prepareStatement(sql);

            stm.setInt(1, id);

            stm.executeUpdate();

            stm.close();
            con.close();
        } catch (SQLException ex) {
            System.out.println("Error al eliminar el producto");
        }

    }

    public void guardarProducto(Producto producto) {

        try {
            ConnectionManager connectionManager = new ConnectionManager();

            Connection con = connectionManager.getConnection();

            PreparedStatement stm;

            String sql;

            if (producto.getId() == 0) {
                sql = "INSERT INTO productos(prod_nombre, prod_precio, prod_imagen)"
                        + " VALUES(?, ?, ?)";
            } else {
                sql = "UPDATE productos SET prod_nombre=?, prod_precio=?, prod_imagen=?"
                        + " WHERE prod_id=?";
            }

            stm = con.prepareStatement(sql);

            stm.setString(1, producto.getNombre());
            stm.setFloat(2, producto.getPrecio());
            stm.setString(3, producto.getImagen());

            if (producto.getId() != 0) {
                stm.setInt(4, producto.getId());
            }

            stm.executeUpdate();

            stm.close();
            con.close();

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }

    }

    public ArrayList<Producto> buscarProductos(String terminoBuscado) {

        ArrayList<Producto> listaProducto = new ArrayList<>();

        try {

            ConnectionManager connectionManager = new ConnectionManager();

            Connection con = connectionManager.getConnection();

            Statement stm;
            ResultSet rs;
            String sql;

            sql = "SELECT *"
                    + " FROM productos"
                    + " WHERE prod_nombre LIKE '%" + terminoBuscado + "%'"
                    + " OR prod_precio LIKE '%" + terminoBuscado + "%'"
                    + " OR prod_imagen LIKE '%" + terminoBuscado + "%'";

            stm = con.createStatement();

            rs = stm.executeQuery(sql);

            while (rs.next()) {
                Producto producto = new Producto();

                producto.setId(rs.getInt("prod_id"));
                producto.setNombre(rs.getString("prod_nombre"));
                producto.setPrecio(rs.getFloat("prod_precio"));
                producto.setImagen(rs.getString("prod_imagen"));

                listaProducto.add(producto);
            }

            stm.close();
            rs.close();
            con.close();

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }

        return listaProducto;
    }
}
