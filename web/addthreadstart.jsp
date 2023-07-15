<%@page import="java.util.*"%>
<%@page import="java.sql.*, backendfacts.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        java.sql.Date date = new java.sql.Date(Calendar.getInstance().getTimeInMillis()); 
        
        int threadCatID = Integer.parseInt(request.getParameter("postID"));
        String title = request.getParameter("threadTitle");
        String content = request.getParameter("postText");
        
        User myuser = (User)request.getSession().getAttribute("myuser");
    
        String string = "sboard.jsp" + "?threadCatID=" + threadCatID;
        
        ThreadDAO td = new ThreadDAO();
        backendfacts.Thread thread = new backendfacts.Thread();
        
        thread.setCategoryID(threadCatID);
        thread.setCreated(date);
        thread.setTitle(title);
        
        td.insertThread(thread);
        
        int threadID = td.getMaxThreadID();
        
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
