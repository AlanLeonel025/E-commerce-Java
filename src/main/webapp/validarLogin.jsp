<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Validando Login</title>
    </head>
    <body>
        <%
            String user = "root";
            String password = "";
            String bd = "carrito_suplementos";
            String host = "localhost";
            String port = "3306";
            String timeZone = "UTC";

            String url;

            Connection con = null;

            url = "jdbc:mysql://" + host + ":" + port + "/" + bd + "?user=" + user + "&password=" + password + "&serverTimezone=" + timeZone;

            try {

                Class.forName("com.mysql.cj.jdbc.Driver");

                System.out.println("Driver cargado correctamente!");

                con = DriverManager.getConnection(url);

                System.out.println("Conectado satisfactoriamente");

            } catch (ClassNotFoundException ex) {
                System.out.println("Error al cargar el Driver de MySQL");

            } catch (SQLException ex) {
                System.out.println("Error al conectar con la BD");
                System.out.println(ex.getMessage());
            }
        %>
    </body>
</html>
