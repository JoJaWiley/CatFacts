<%-- 
    Document   : games
    Created on : Jul 6, 2023, 10:23:22 AM
    Author     : ftoyi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, backendfacts.*, java.util.*"%>

        
        
                
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Games Database Page</title>
        <link rel="stylesheet" href="StyleSheet.css">

    </head>
    <body>
<header>
 
        <nav>
                <img class="logo" src="catfactslogo.png" alt="logo">
            <ul class="nav__links">
                <li><a class="navlink" href="#">Boards</a></li>      
                <li><a class="navlink" href="#">Games Database</a></li>
                <li><a class="navlink" href="#">News</a></li>
                <li><a class="navlink" href="#">Teams</a></li>
                <li><a class="navlink" href="#">Guides</a></li>
                <li><a class="navlink" href="#">Search</a></li>
            </ul>
        </nav>
</header>
        <%
GameDAO gd = new GameDAO();
ArrayList<Game> games = gd.getAllGames();
for (Game game : games)
    {
        %>
        <a href ="specificgp.jsp?gameID=<%=game.getGameID()%>"><div class="grid-container">
            <div class="grid-item">
                <div class="grid-container">
                <div class="grid-image">
	<img class="game-cover" src="game_images/<%=game.getGameID()%>.jpg" width="200">
                </div>
                <div class="grid-item">
                <p><%out.println(game.getTitle());%></p>
                </div>
            </div>
            </div>
            
            <div class="grid-item">
                <div class="grid-container">
                    <div class="grid-item">
                Release Date<br>
                <%out.println(game.getDate());%> 
                    </div>
                    <div class="grid-item">
                        Score<br>
                        <%out.println(game.getScore());%>  
                    </div>
                </div>
            </div>
            </div></a>
               <%
                   }
               %>
            
            
    </body>
</html>
