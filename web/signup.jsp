<%@page import="java.util.Objects"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.*, backendfacts.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account Login</title>
    </head>
    <body>

        <%
            try {
            
            String username = request.getParameter("createUsername");
            String email = request.getParameter("createEmail");
            String password = request.getParameter("createPassword");
            
            User user = new User(username, email, password);
            UserDAO ud = new UserDAO();
            ud.insertUser(user);
            
            user = ud.getUserByUsernameAndPassword(username, password);
            
            request.getSession().setAttribute("myuser", user);
            
            if (Objects.isNull(user)) {
                out.println("invalid login");
                response.sendRedirect("index.jsp");
            } else {
            String referer = request.getHeader("Referer");
            response.sendRedirect(referer);
            }
            
            
            
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>


    </body>
</html>