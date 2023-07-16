<%@page import="java.sql.*, backendfacts.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        //get the updated bio from the form on profile.jsp
        String bio = request.getParameter("bio");
        //retrieve the myprofile object
        Profile myprofile = (Profile)request.getSession().getAttribute("myprofile");
        //set myprofile's bio to the updated bio from the form
        myprofile.setBio(bio);
        //create a profiledao object to update the database with the edited bio
        ProfileDAO pd = new ProfileDAO();
        pd.updateProfile(myprofile);
        request.getSession().setAttribute("myprofile", myprofile);
            response.sendRedirect("profile.jsp");
        %>
    </body>
</html>
