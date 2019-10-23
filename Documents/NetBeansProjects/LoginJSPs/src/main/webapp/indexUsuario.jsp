<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP USUARIO</title>
    </head>
    <body>
        <h1>Hola Usuario!</h1>
        <% 
          session = request.getSession();
          String user = String.valueOf(session.getAttribute("user"));
          String pass = String.valueOf(session.getAttribute("pass"));
          
          if(user != null || pass != null){
              out.print("<script>location.replace('login.jsp');</script>");
          }else{
             out.println("Bienvenido" + user + pass); 
          } 
        %>
    </body>
</html>
