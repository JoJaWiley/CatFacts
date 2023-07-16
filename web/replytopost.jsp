<%@page import="java.sql.*, backendfacts.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        //get the postID from the URL query
        int postID = Integer.parseInt(request.getParameter("postID"));
        //construct post object from PostDAO and get threadID
        PostDAO pd = new PostDAO();
        Post post = pd.getPost(postID);
        int threadID = post.getThreadID();
        //construct thread object from ThreadDAO
        ThreadDAO td = new ThreadDAO();
        backendfacts.Thread thread = td.getThread(threadID);
        
        String title = thread.getTitle();
        
        request.getSession().setAttribute("threadID", threadID);
        
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Post your reply in <%=title%></title>
    </head>
    <body>
        <h1>Post your reply in <%=title%></h1>
        <form method="post" action="addreply.jsp">
            <textarea name="postText" rows="8" cols="40" wrap="virtual"></textarea>
            <p><input type="submit" name="submit" value="Add Post"></p>
        </form>
    </body>
</html>
