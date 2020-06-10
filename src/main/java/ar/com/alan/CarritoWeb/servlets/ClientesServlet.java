package ar.com.alan.CarritoWeb.servlets;

import ar.com.alan.CarritoWeb.ajax.RespuestaJson;
import ar.com.alan.CarritoWeb.model.DAO.ClientesDAO;
import ar.com.alan.CarritoWeb.model.entities.Cliente;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ClientesServlet", urlPatterns = {"/clientes"})
public class ClientesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter out = response.getWriter();

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        ClientesDAO clientesDAO = new ClientesDAO();

        ArrayList listaClientes;

        if (request.getParameter("id") != null) {
            Cliente cliente = clientesDAO.getCliente(Integer.parseInt(request.getParameter("id")));

            listaClientes = new ArrayList();
            listaClientes.add(cliente);
        } else {
            if (request.getParameter("search") != null) {
                listaClientes = clientesDAO.buscarClientes(request.getParameter("search"));
            } else {
                listaClientes = clientesDAO.getListadoDeClientes();
            }

        }

        Gson gson = new Gson();

        RespuestaJson res = new RespuestaJson("ok", "", listaClientes);

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
        System.out.println(request.getParameter("apellido"));
        System.out.println(request.getParameter("email"));

        ClientesDAO clientesDAO = new ClientesDAO();

        Cliente cliente = new Cliente();

        cliente.setId(0);
        cliente.setNombre(request.getParameter("nombre"));
        cliente.setApellido(request.getParameter("apellido"));
        cliente.setEmail(request.getParameter("email"));

        clientesDAO.guardarCliente(cliente);

        RespuestaJson res = new RespuestaJson("ok", "El cliente ha sido agregado exitosamente", new ArrayList());

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

        ClientesDAO clientesDAO = new ClientesDAO();

        Cliente cliente = new Cliente();

        cliente.setId(Integer.parseInt(request.getParameter("id")));
        cliente.setNombre(request.getParameter("nombre"));
        cliente.setApellido(request.getParameter("apellido"));
        cliente.setEmail(request.getParameter("email"));

        clientesDAO.guardarCliente(cliente);

        RespuestaJson res = new RespuestaJson("ok", "El cliente ha sido modificado correctamente", new ArrayList());

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

        ClientesDAO clientesDAO = new ClientesDAO();

        clientesDAO.eliminarCliente(Integer.parseInt(request.getParameter("id")));

        Gson gson = new Gson();

        RespuestaJson res = new RespuestaJson("ok", "El cliente ha sido borrado correctamente", new ArrayList());

        out.print(gson.toJson(res));
        out.flush();
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
