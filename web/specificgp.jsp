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
                <a href="index.jsp"><img class="logo" src="catfactslogo.png" alt="logo"></a>
            <ul class="nav__links">
                <li id="button"><a class="navlink" href="boards.jsp">Boards</a></li>
                <li id="button"><a class="navlink" href="games.jsp">Games Database</a></li>
                <li id="button"><a class="navlink" href="teams.jsp">Teams</a></li>
                <li id="button"><a class="navlink" href="guidehome.jsp">Guides</a></li>
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
                        <a class="stack2-item">Genre: <%out.println(game.getGenre());%></a> 
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
