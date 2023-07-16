<%@page import="java.sql.*, backendfacts.*, java.util.*"%>
<html lang="en">
<head>
   <style>
    body {
      background: linear-gradient(to right, #ff0066, #b30047);
      margin: 0;
      padding: 0;
    }
    
    .guide-item a:hover,
    .question-container button:hover {
        color: #333333; /* Change to the desired dark shade color */
        transform: scale(1.1);
            transition: all 0.3s ease 0s;

    }
    
    .question-container button  {
        width: 800px; 
        font-family: 'Nova Square', cursive;
        display: inline-block;
        margin-top: 20px;
        margin-left: 280px;
        transition: all 0.3s ease 0s;
        color: white;
        background-color: #ff99cc;
        border: none;
        border-radius: 5px;
        padding: 10px 20px;
        font-size: 16px;
        cursor: pointer;
    }

    .question-container button:hover {
        background-color: #ff6699;
    }
    
    .question-container {
       align-content: center;
       justify-content: center;
       position: absolute;
    }

    /*.logo {
        width: 150px;
        height: auto;
        margin-left: 20px;
        cursor: pointer;
    }                    uncomment when you have a logo*/
   
 .guide-modal {
    display: none;
    align-content: center;
    justify-content: center;
    z-index: 1;
    width: 80%;
    height: 80%;
    overflow: auto;
    background-color: rgba(0, 0, 0, 0.4);
}

.guide-modal-content {
    background-color: #d1b3ff;
    margin:0;
    padding: 0px;
    border: 1px solid #888;
    width: 80%;
    height: 80%;
    
}

.close {
    color: #aaa;
    position: absolute;
    top: 20px;
    right: 20px;
    font-size: 32px;
    font-weight: bold;
    cursor: pointer;
}

.close:hover,
.close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}

pre {
    white-space: pre-wrap;
    font-size: 18px;
    line-height: 1.5;
}

.guidepage-container {
    display: flex;
    align items: center;
    justify-content: center;
    grid-template-columns: repeat(2, 1fr); /*create three equal-width columns*/
    grid-gap:20px; /*add a 10px gap between each grid item*/
    padding: 20px;
    margin-trim: block-end;

}

.guidepage-col {
  display: flex;
  flex-direction: column;
  padding: 20px;
}

.game-details {
  text-align: center;
}

.guidepage-item {
  margin-top: 20px;
  text-align: center;
  font-family: 'Nova Square', cursive;
  color: #ff99ff;
  padding: 10px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1), 0 5px 15px rgba(0, 0, 0, 0.1);
}

.guide-wrapper {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
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
            <a href="index.html">
                <img class="logo" src="#" href="index.jsp" alt="logo">
            </a>
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
    <h4><u>Game Details</u></h4>
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