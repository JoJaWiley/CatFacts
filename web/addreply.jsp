<%@page import="java.util.Calendar"%>
<%@page import="java.sql.*, backendfacts.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        java.sql.Date date = new Date(Calendar.getInstance().getTimeInMillis()); 
        
        String content = request.getParameter("postText");
        
        User myuser = (User)request.getSession().getAttribute("myuser");
        int threadID = (int)request.getSession().getAttribute("threadID");
        String string = "thread.jsp" + "?threadID=" + threadID;
        
        PostDAO pd = new PostDAO();
        
        Post post = new Post();
        post.setThreadID(threadID);
        post.setUserID(myuser.getUserID());
        post.setTitle("blah");
        post.setCreated(date);
        post.setContent(content);
        
        pd.insertPost(post);
        
        response.sendRedirect(string);
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
