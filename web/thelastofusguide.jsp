<%@page import="java.sql.*, backendfacts.*, java.util.*"%>
<html lang="en">
<head>
    
    <!--Using this body style locally to this page-->
<style>
    body {
      background: linear-gradient(to right, #ff0066, #b30047);
      margin: 0;
      padding: 0;
}
</style>
   
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="StyleSheet.css">
</head>
<body>
    
    <div class="button-container">
        <button id="loginButton" onclick="document.getElementById('loginForm').style.display='block'" style="width:auto;">Login</button>
        <div id="loginForm" class="modal">
            <!-- Login form code -->
        </div>

        <button id="signUpButton" onclick="document.getElementById('signUpForm').style.display='block'" style="width:auto;">Sign Up</button>
        <div id="signUpForm" class="modal">
            <!-- Sign up form code -->
        </div>
    </div>

    <header>
        <nav>
            <a href="index.jsp">
                <img class="logo" src="catfactslogo.png" alt="logo">
            </a>
            <ul class="nav__links">
                <li id="button"><a class="navlink" href="boards.jsp">Boards</a></li>
                <li id="button"><a class="navlink" href="games.jsp">Games Database</a></li>
                <li id="button"><a class="navlink" href="teams.jsp">Teams</a></li>
                <li id="button"><a class="navlink" href="guidehome.jsp">Guides</a></li>
            </ul>
        </nav>
    </header>
   
    <div class="question-container">
        <button type="button">Ask a question</button>
    </div>
    
    <%
        
    int gameID = 1;    
    GameDAO gd = new GameDAO();
    
    Game game = gd.getGame(gameID);
    
    %>

<div class="guide-wrapper">    
<div class="guidepage-container">
 
<div class="guidepage-col">
    
<div class="guidepage-item">
    <a class="guide-link" href ="specificgp.jsp?gameID=<%=game.getGameID()%>">
        <h4><u>Game Details</u></h4>
    </a>
        
    <h4><%out.println(game.getGenre());%></h4>
    <h4>Platform: PS4, PS5</h4>
    <h4>Studio: <%out.println(game.getStudio());%></h4>
    <h4>Release: <%out.println(game.getDate());%></h4>
</div>
    
<div class="guidepage-item">
    <h1><u>-FAQ-</u></h1>
    <a class="textdoc" href="#" onclick="openModal('guides/thelastofus2_faqs.txt')"><%out.println(game.getTitle());%> FAQS</a>
</div>
    
</div>

<div class="guidepage-col">
    
<div id="guide-modal" class="guide-modal">
    <div class="guide-modal-content">
        <span class="close" onclick="closeModal()">&times;</span>
        <pre id="guide-modal-text"></pre>
        
    </div>
    </div>
</div>
            
<div class="guidepage-col">
    
    <div class="guidepage-item">
    <h1><u>-Beginner's Guides-</u></h1>
    <a class="textdoc" href="#" onclick="openModal('guides/thelastofus2_basictips.txt')"><%out.println(game.getTitle());%> Basic Tips & Tricks</a>
    </div>
    
    
    <div class="guidepage-item">
    <h1><u>-Walkthrough Guides-</u></h1>
    <a class="textdoc" href="#" onclick="openModal('guides/thelastofus2_walkthrough.txt')"><%out.println(game.getTitle());%> Walkthrough</a>
    </div>
    
    <div class="guidepage-item">
    <h1><u>-Characters & Background Guides-</u></h1>
    <a class="textdoc" href="#" onclick="openModal('guides/thelastofus2_characters.txt')"><%out.println(game.getTitle());%> Characters</a>
    </div>
    
</div>
</div>
</div>



<script>
function openModal(url) {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById('guide-modal-text').textContent = this.responseText;
            document.getElementById('guide-modal').style.display = 'block';
        }
    };
    xhttp.open('GET', url, true);
    xhttp.send();
}

function closeModal() {
    document.getElementById('guide-modal-text').textContent = '';
    document.getElementById('guide-modal').style.display = 'none';
}

window.onclick = function(event) {
    var modal = document.getElementById('guide-modal');
    if (event.target == modal) {
        closeModal();
    }
};

</script>

</div>
    
</body>
</html>