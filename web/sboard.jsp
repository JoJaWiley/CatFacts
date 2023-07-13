<%@page import="java.util.*,java.sql.*,backendfacts.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            table {
                border-collapse: collapse;
                width: 100%;
            }
            th, td {
                text-align: left;
                padding: 8px;
                border-bottom: 1px solid #ddd;
                color: #FF69B4;
            }
        </style>
    </head>
    <body>
        <%
            int threadCatID = Integer.parseInt(request.getParameter("threadCatID"));
            UserDAO ud = new UserDAO();
            PostDAO pd = new PostDAO();
            ThreadDAO td = new ThreadDAO();
            ThreadCategoryDAO tcd = new ThreadCategoryDAO();
            ThreadCategory tc = tcd.getThreadCat(threadCatID);
            ArrayList<backendfacts.Thread> threads = td.getAllThreadsByCat(threadCatID);

            String topic;
            String author;
            int postCount;
            String date;
            Post post = new Post();
            String link;

            for (backendfacts.Thread thread : threads) {
                topic = thread.getTitle();
                author = ud.getUser(pd.getFirstPostByThread(thread.getThreadID()).getUserID()).getUserName();
                link = "thread.jsp?threadID=" + thread.getThreadID();
        %>
        <table>
            <tr>
                <th>Topic</th>
                <th>Created By</th>
                <th># of Messages</th>
                <th>Date of Last Post</th>
            </tr>
            <tr>
                <td><a href="<%= link %>"><%= topic %></a></td>
                <td><%= author %></td>
                <td>0</td>
                <td>yyyy-mm-dd</td>
            </tr>
        </table>
        <%
            }
        %>
    </body>
</html>
