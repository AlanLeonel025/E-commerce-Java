package ar.com.alan.CarritoWeb.servlets;

import ar.com.alan.CarritoWeb.model.DAO.UsuarioDAO;
import ar.com.alan.CarritoWeb.model.entities.Usuarios;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Boolean.TRUE;
import static java.lang.System.out;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    private Usuarios usuarios;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        if (session.getAttribute("usuario") != null) {
            request.getRequestDispatcher("/productos").forward(request, response);
        } else {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("Entramos al servlet");
        String nombreEmail = request.getParameter("txtemail");
        String password = request.getParameter("txtclave");

        System.out.println("Email ---> " + nombreEmail);
        System.out.println("Password ---> " + password);
        // HttpSession session = request.getSession();

        UsuarioDAO usuarioDAO = new UsuarioDAO();

        if (usuarioDAO.getUserLogin(nombreEmail, password) == TRUE) {
            if (usuarioDAO.getTypePermiso(nombreEmail, password).equalsIgnoreCase("cliente")) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("/Usuario.jsp");
                dispatcher.forward(request, response);
            } else if (usuarioDAO.getTypePermiso(nombreEmail, password).equalsIgnoreCase("admin")) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("/Administrador.jsp");

                dispatcher.forward(request, response);
            }

        } else {
            System.out.println("Eror xxxx");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/login.jsp");
            dispatcher.forward(request, response);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
