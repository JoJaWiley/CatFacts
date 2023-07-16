<%@page import="java.sql.*, backendfacts.*, java.util.Objects, java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Games Database Page</title>
        <link rel="stylesheet" href="StyleSheet.css">

    </head>
    <body>
<header>
 
        <nav>
                <img class="logo" src="#" alt="logo">
            <ul class="nav__links">
                <li id="button"><a class="navlink" href="boards.jsp">Boards</a></li>
                <li id="button"><a class="navlink" href="gamedbhome.jsp">Games Database</a></li>
                <li id="button"><a class="navlink" href="#">News</a></li>
                <li id="button"><a class="navlink" href="#">Teams</a></li>
                <li id="button"><a class="navlink" href="guidehome.jsp">Guides</a></li>
                <li id="button"><a class="navlink" href="#">Search</a></li>
            </ul>
        </nav>
</header>
        
        
        <div class="grid-container">
            
            <%
            GameDAO gd = new GameDAO();

            ArrayList<Game> games = gd.getAllGames();

            for (Game game: games) {
            
            %>
            
            
            <div class="grid-item">
            <div class="grid-container">
                <div class="grid-item">
                    <img class="gamepic" src="game_images/<%=game.getGameID()%>.jpg" alt="game cover"> 
                </div>
                <div class="grid-item">
                <h3><%out.println(game.getTitle());%></h3>
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
                <%
                    }
                %>
        </div>
    </body>
</html>
