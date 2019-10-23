<%@page import="paqueteJava.*"%>
<%@page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="recursos/login.css">
        <title>JSP Login</title>
    </head>
    <body>
        <h1>Login con JSP!</h1>


        <div class="formulario">
            <h2>Iniciar Sesion</h2>
            <form action="login.jsp" method="post">
                Username: <input type="text" name="username"><br>
                Password: <input type="password" name="password">  
                <input type="submit" name="enviar" value="Iniciar Sesion">
            </form>
        </div>

        <%
            if (request.getParameter("enviar") != null) {

                Persona p = null;
                ConexionJDBC conn = new ConexionJDBC();
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                p = conn.logear(username, password);

                if (p.getEstado().equals("administrador")) {
                    session = request.getSession();
                    session.setAttribute("user", p.getUser());
                    session.setAttribute("pass", p.getPass());
                    response.sendRedirect("indexUsuario.jsp");
                } else if (p.getEstado().equals("usuario")) {
                    session = request.getSession();
                    session.setAttribute("user", p.getUser());
                    session.setAttribute("pass", p.getPass());
                    response.sendRedirect("indexAdministrador.jsp");
                }
            }

        %>
    </body>
</html>
