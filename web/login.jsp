<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account Login</title>
    </head>
    <body>
        
        <%
            
            String url = "jdbc:mysql://localhost:3306/catfact";
            String dbusername = "root";
            String dbpassword = "admin";
            
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, dbusername, dbpassword);
            
            PreparedStatement pstmt = con.prepareStatement("SELECT * FROM user WHERE UserName=? AND password=?");
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            

            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
            
            response.sendRedirect("index.html");
            
            } else {
            out.println("invalid username and/or password");
            response.sendRedirect("index.html");
            }
            

            con.close();

        %>
        
        
    </body>
</html>
