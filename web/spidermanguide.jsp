<%@page import="java.sql.*, backendfacts.*, java.util.*"%>
<html lang="en">
<head>
   <style>
    body {
      background: linear-gradient(to right, #ff0066, #b30047);
      margin: 0;
      padding: 0;
    }
    
    .category-container {
        display: flex;
        flex-wrap: wrap;
        font-family: 'Nova Square', cursive;
        color: #ff99ff;
        padding-top: 0px;
    }
    
    .category-container a:hover,
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

    /*.logo {
        width: 150px;
        height: auto;
        margin-left: 20px;
        cursor: pointer;
    }                    uncomment when you have a logo*/
    
    .game-container {
        flex: 1;
        margin-left: 20px;
    }
   
   /* Add the following CSS for fancy pink border */
   body::before,
   body::after {
      content: "";
      position: fixed;
      top: 0;
      bottom: 0;
      width: 40px;
      background-color: #b30047;
      z-index: -1;
   }
   
   body::before {
      left: 0;
   }
   
   body::after {
      right: 0;
   }
   /* End of fancy pink border styling */
   
 .modal {
    display: none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 1500px;
    height: 1000px;
    overflow: auto;
    background-color: rgba(0, 0, 0, 0.4);
}

.modal-content {
    background-color: #fefefe;
    margin: 10% auto;
    padding: 40px;
    border: 1px solid #888;
    width: 90%;
    max-width: 1000px;
    height: 90%;
    max-height: 800px;
    position: relative;
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
                <li id="button"><a class="navlink" href="#">Boards</a></li>
                <li id="button"><a class="navlink" href="#">Games Database</a></li>
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
        
    int gameID = 3;    
    GameDAO gd = new GameDAO();
    
    Game game = gd.getGame(gameID);
    
    %>
    
    <div class="category-container">
        
<div class="game-container">
    
    <h4 style="padding-left: 50px; padding-top:10px; "><u>Game Details</u></h4>
    <h4 style="padding-left: 50px;"><%out.println(game.getGenre());%></h4>
    <h4 style="padding-left: 50px;">Platform: PS4, PS5</h4>
    <h4 style="padding-left: 50px;">Studio: <%out.println(game.getStudio());%></h4>
    <h4 style="padding-left: 50px">Release:<%out.println(game.getDate());%></h4>
            
</div>
            
<!--guide content-->
            
<div class="guide-container">
    
    <div class="guide-item">
    <h1><u>-Beginner's Guides-</u></h1>
    <a class="textdoc" href="#" onclick="openModal('guides/spiderman_basictips.txt')"><%out.println(game.getTitle());%> Basic Tips & Tricks</a>
    </div>
    
    <div class="guide-item">
    <h1><u>-Walkthrough Guides-</u></h1>
    <a class="textdoc" href="#" onclick="openModal('guides/spiderman_walkthrough.txt')"><%out.println(game.getTitle());%> Walkthrough</a>
    </div>
    
    <div class="guide-item">
    <h1><u>-Characters & Background Guides-</u></h1>
    <a class="textdoc" href="#" onclick="openModal('guides/spiderman_characters.txt')"><%out.println(game.getTitle());%> Characters</a>
    </div>
    
</div>

<div id="modal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal()">&times;</span>
        <pre id="modal-text"></pre>
    </div>
</div>

<script>
function openModal(url) {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById('modal-text').textContent = this.responseText;
            document.getElementById('modal').style.display = 'block';
        }
    };
    xhttp.open('GET', url, true);
    xhttp.send();
}

function closeModal() {
    document.getElementById('modal-text').textContent = '';
    document.getElementById('modal').style.display = 'none';
}

window.onclick = function(event) {
    var modal = document.getElementById('modal');
    if (event.target == modal) {
        closeModal();
    }
};

</script>
                     
            

<div class="faq-container">
    <h1>FAQ</h1>
    
<ul class="faq-items">
    <li>
    Q: What is "The Last of Us Part II"?
    A: "The Last of Us Part II" is a highly acclaimed action-adventure game developed by Naughty Dog and published by Sony Interactive Entertainment. It is a sequel to the original "The Last of Us" game, continuing the post-apocalyptic story set in a world ravaged by a fungal infection.
    </li>
    <li>
    Q: What is the gameplay like in "The Last of Us Part II"?
    A: "The Last of Us Part II" combines elements of stealth, exploration, and intense combat. Players control Ellie, the main protagonist, as she navigates hostile environments, solves puzzles, and engages in both stealth and action-packed combat encounters with infected creatures and human enemies.
    </li>
    <li>
    Q: Do I need to play the first game before playing "The Last of Us Part II"?
    A: It is highly recommended to play the first game, "The Last of Us," as it sets the foundation for the story and characters in the sequel. Playing the first game will enhance your understanding and emotional connection to the events in "The Last of Us Part II."
    </li>
    <li>
    Q: What is the story about in "The Last of Us Part II"?
    A: "The Last of Us Part II" continues the story of Ellie, who sets out on a quest for revenge in a deeply divided post-apocalyptic world. The narrative explores themes of loss, morality, and the consequences of one's actions.
    </li>
    <li>
    Q: Are there different difficulty options in the game?
    A: Yes, "The Last of Us Part II" offers multiple difficulty options, allowing players to choose their preferred level of challenge. The options include Easy, Normal, Hard, and the challenging Survivor and Grounded modes.
    </li>
    <li>
    Q: Are there multiplayer modes in "The Last of Us Part II"?
    A: No, "The Last of Us Part II" does not feature a traditional multiplayer mode. However, it offers an engaging single-player campaign with a robust story and immersive gameplay.
    </li>
    <li>
    Q: How long is the gameplay experience in "The Last of Us Part II"?
    A: The length of the game can vary depending on the player's playstyle and exploration. On average, it takes around 25-30 hours to complete the main story. However, engaging in side activities and searching for collectibles can extend the playtime.
    </li>
    <li>
    Q: Is "The Last of Us Part II" suitable for all ages?
    A: No, "The Last of Us Part II" is rated M for Mature by the Entertainment Software Rating Board (ESRB) due to intense violence, strong language, and mature themes. It is recommended for players aged 17 and above.
    </li>
</ul>
    
</div>

        </div>
    </div>
</body>
</html>