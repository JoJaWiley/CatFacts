<%-- 
    Document   : specificgamepagee
    Created on : Jul 6, 2023, 9:57:34 PM
    Author     : ftoyi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, backendfacts.*, java.util.Objects"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Specific Game Page</title>
           <link rel="stylesheet" href="StyleSheet.css">
           
    </head>
    <body>
        
        <% 
            GameDAO gd = new GameDAO();
            int gameID = Integer.parseInt(request.getParameter("gameID"));
            Game game = gd.getGame(gameID);
            
            VideosDAO vd = new VideosDAO();
            int videoID=1;
            Videos video = vd.getVideo(gameID);
            %>
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
        
        <div class="rest">
        <div class="grid-container">
            <div class="grid-item">
                <div class="stack">
                    
                    <%out.println(video.getVideoLink());%>
                </div>
            </div>
            <div class="grid-item">
                <div class="stack2">
                    
                    <div class="stack2-container">
                        
                        <a class="title" href="#"><%=game.getTitle()%></a>
                        <a class ="stack2-item">Release Date: <%out.println(game.getDate());%></a>
                        <a class="stack2-item"> Studio:<%out.println(game.getStudio());%></a>
                        <a class="stack2-item">Gender: <%out.println(game.getGenre());%></a> 
                        <a class="stack2-item">Price: $<%out.println(game.getPrice());%></a>
                        <a class="stack2-item">Score: <%out.println(game.getScore());%> </a>
                    </div>
                </div>
            </div>
            
            <div class="grid-item">
                <div class="stack">
                    <h2 class="grid-item-header-center">Description</h2>
                    <p class="trending-posts">  In "Shadow of the Tomb Raider," join the fearless Lara Croft on her most thrilling and perilous 
                        adventure yet. As she races against time to save the world from an impending apocalypse,
                        Lara must navigate treacherous environments, solve intricate puzzles, and face deadly
                        enemies in her quest for redemption.
                        "Shadow of the Tomb Raider" promises a captivating blend of intense action, breathtaking
                        visuals, and a compelling storyline that will keep players on the edge of their seats. Prepare
                        to uncover the darkness within and become the legendary Tomb Raider. The fate of humanity rests in your hands.
                    </p>
                </div> 
                </div>

        
        
        
         
        
  
            
    </body>
</html>
