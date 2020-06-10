package ar.com.alan.CarritoWeb.servlets;

import ar.com.alan.CarritoWeb.model.entities.Producto;
import ar.com.alan.CarritoWeb.model.DAO.ProductosDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ProductosServlet", urlPatterns = {"/productos"})
public class ProductosServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        ProductosDAO productosDAO = new ProductosDAO();

        ArrayList<Producto> listaProductos = productosDAO.getListadoDeProductos();

        request.setAttribute("nombre", session.getAttribute("user"));
        request.setAttribute("productos", listaProductos);

        request.getRequestDispatcher("productos.jsp").forward(request, response);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        processRequest(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        processRequest(request, response);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
