<%@page import="java.sql.*, backendfacts.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        //get post ID from url query and postText from form
        int postID = Integer.parseInt(request.getParameter("postID"));
        String content = "[Post has been deleted by user.]";
        //construct postdao
        PostDAO pd = new PostDAO();
        
        //construct a post object with the altered content
        Post post = pd.getPost(postID);
        post.setContent(content);
        pd.updatePost(post);
        
        //get the thread ID and redirect to that thread page
        int threadID = post.getThreadID();
        String string = "thread.jsp" + "?threadID=" + threadID;
        
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
