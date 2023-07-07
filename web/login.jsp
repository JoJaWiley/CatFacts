<%@page import="java.util.Objects"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, backendfacts.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account Login</title>
    </head>
    <body>
        
        <%
            
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            
            UserDAO ud = new UserDAO();
            User user = ud.getUserByUsernameAndPassword(username, password);
            
            if (Objects.isNull(user)) {
                out.println("invalid login");
                response.sendRedirect("index.html");
            } else {
            
            request.getSession().setAttribute("myuser", user);
            response.sendRedirect("index.jsp");
            }
            
        %>
        
        
    </body>
</html>
