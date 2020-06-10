package ar.com.alan.CarritoWeb.servlets;

import ar.com.alan.CarritoWeb.ajax.RespuestaJson;
import ar.com.alan.CarritoWeb.model.DAO.AltaProductoDAO;
import ar.com.alan.CarritoWeb.model.entities.Producto;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AltaProductoServlet", urlPatterns = {"/AltaProductoServlet"})
public class AltaProductoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter out = response.getWriter();

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        AltaProductoDAO altaProductoDAO = new AltaProductoDAO();

        ArrayList listaProductos;

        if (request.getParameter("id") != null) {
            Producto producto = altaProductoDAO.getProducto(Integer.parseInt(request.getParameter("id")));

            listaProductos = new ArrayList();
            listaProductos.add(producto);
        } else {
            if (request.getParameter("search") != null) {
                listaProductos = altaProductoDAO.buscarProductos(request.getParameter("search"));
            } else {
                listaProductos = altaProductoDAO.getListadoDeProducto();
            }

        }

        Gson gson = new Gson();

        RespuestaJson res = new RespuestaJson("ok", "", listaProductos);

        out.print(gson.toJson(res));
        out.flush();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter out = response.getWriter();

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        System.out.println(request.getParameter("nombre"));
        System.out.println(request.getParameter("precio"));
        System.out.println(request.getParameter("imagen"));

        AltaProductoDAO altaProductoDAO = new AltaProductoDAO();

        Producto producto = new Producto();

        producto.setId(0);
        producto.setNombre(request.getParameter("nombre"));
        producto.setPrecio(Float.parseFloat(request.getParameter("precio")));
        producto.setImagen(request.getParameter("imagen"));

        altaProductoDAO.guardarProducto(producto);

        RespuestaJson res = new RespuestaJson("ok", "El producto ha sido agregado exitosamente", new ArrayList());

        Gson gson = new Gson();

        out.print(gson.toJson(res));
        out.flush();
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter out = response.getWriter();

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        AltaProductoDAO altaProductoDAO = new AltaProductoDAO();

        Producto producto = new Producto();

        producto.setId(0);
        producto.setNombre(request.getParameter("nombre"));
        producto.setPrecio(Float.parseFloat(request.getParameter("precio")));
        producto.setImagen(request.getParameter("imagen"));

        altaProductoDAO.guardarProducto(producto);

        RespuestaJson res = new RespuestaJson("ok", "El producto ha sido modificado correctamente", new ArrayList());

        Gson gson = new Gson();

        out.print(gson.toJson(res));

        out.flush();
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter out = response.getWriter();

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        AltaProductoDAO altaProductoDAO = new AltaProductoDAO();

        altaProductoDAO.eliminarProductos(Integer.parseInt(request.getParameter("id")));

        Gson gson = new Gson();

        RespuestaJson res = new RespuestaJson("ok", "El producto ha sido borrado correctamente", new ArrayList());

        out.print(gson.toJson(res));
        out.flush();
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
