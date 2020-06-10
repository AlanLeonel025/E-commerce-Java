package ar.com.alan.CarritoWeb.model.DAO;

import ar.com.alan.CarritoWeb.model.entities.Producto;
import ar.com.alan.CarritoWeb.utils.ConnectionManager;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class ProductosDAO {

    public static ArrayList<Producto> getListadoDeProductos() {

        ArrayList<Producto> listaProductos = new ArrayList<>();

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

                listaProductos.add(producto);
            }

            stm.close();
            rs.close();
            con.close();
        } catch (SQLException ex) {
            System.out.println("Error al obtener el listado de productos");
        }

        return listaProductos;
    }

}
