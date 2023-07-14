<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, backendfacts.*, java.util.Objects"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Team Page</title>
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
  tr:hover {background-color: #f5f5f5;}
  
  .button-container {
    display: flex;
    justify-content: center;
    padding-top: 20px;
}
.table-container{
    margin-top: 50px;
}
body {
    font-family: Arial, sans-serif;
}
h1 {
    color: #FF69B4;
}
table th {
    color: #FF69B4;
}
table tr:nth-child(even) {
    background-color: #F5F5F5
        
}
table tr:hover {
    background-color: #FFC0CB;
}
</style>
    </head>
    <%
        ThreadCategoryDAO tcd = new ThreadCategoryDAO();
        ThreadDAO thd = new ThreadDAO();
        ArrayList<backendfacts.Thread> threads = thd.getAllThreadsByCat(3);
        PostDAO pd = new PostDAO();
        TeamDAO td = new TeamDAO();  
    ArrayList<Team> teams = td.getAllTeam();
    for (Team team: teams)
    {
    %>
    <body>
        <h1><center>Explanation about teams</center></h1>
        
<table>
  <tr>
    <th>Teams</th>
    <th>Open Slots</th>
    <th>Sign-up</th>
  </tr>
  <tr>
      <th><%=team.getTeamName()%></th>
    <td>0</td>
    <td>apply</td>
  </tr>
</table>
       <% }%>
       
        <div></div>
        <button>View More</button>
        <div class="table-container">
            <table>
                <% for (backendfacts.Thread thread: threads)
                {
                ArrayList<Post> posts = pd.getAllPostsByThread(thread.getThreadID());
                
                %>
                
  <tr>
    <th>Topic</th>
    <td>Created By</td>
    <td># of Messages</td>
    <td>Date of Last Post</td>
  </tr>
  <tr>
      <th><%=thread.getTitle()%></th>
    <td></td>
    <td></td>
    <td>yyyy-mm-dd</td>
  </tr>
 
</table>
        </table>
    </div>


        
    </body>
</html>
