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
    
    <%  User myuser = (User)request.getSession().getAttribute("myuser");
        request.getSession().setAttribute("myuser", myuser);
        String loggedIn;
        String mylink;

        if (Objects.isNull(myuser))
            loggedIn = "You are not logged in.";
        else {
            mylink = "profile.jsp?userID=" + myuser.getUserID();
            loggedIn = "Welcome, <a href='" + mylink + "'>" + myuser.getUserName() + ".</a> Not you? <a href='LogoutServlet'>Sign out.</a>";
            ProfileDAO pd = new ProfileDAO();
            Profile myprofile = pd.getProfileByUserID(myuser.getUserID());
            if (Objects.isNull(myprofile)) {
                pd.insertProfile(myuser);
                myprofile = pd.getProfileByUserID(myuser.getUserID());
            }
            request.getSession().setAttribute("myprofile", myprofile);
        }
            
        
    %>
    <!--Login and signup button and their modal forms-->
    <div class="button-container">
        <div class="logged-in-status">
            <%out.println(loggedIn);%>
        </div>
        <button id="loginButton" onclick="document.getElementById('loginForm').style.display='block'" style="width:auto;">Login</button>
        <div id="loginForm" class="modal">
            <form class="modal-content animate" action="login.jsp" method="post">
                <div class="container">
                    <label for="username"><b>Username</b></label>
                    <input id="username" type="text" placeholder="Enter Username" name="username" required>

                    <label for="password"><b>Password</b></label>
                    <input id="password" type="password" placeholder="Enter Password" name="password" required>

                    <button id="loginSubmitButton" type="submit">Login</button>
                </div>
                <div class="container">
                    <button type="button" onclick="document.getElementById('loginForm').style.display='none'" class="cancelbtn">Cancel</button>
                    <span class="password"><a href="#">Forget password?</a></span>
                </div>
            </form>
        </div>


        <button id="signUpButton" onclick="document.getElementById('signUpForm').style.display='block'" style="width:auto;">Sign Up</button>
        <div id="signUpForm" class="modal">
            <form class="modal-content animate" action="signup.jsp" method="post">
                <div class="container">
                    <label for="username"><b>New Username</b></label>
                    <!-- <input type="text" placeholder="Enter your username" name="username" required> -->
                    <input type="text" placeholder="Enter your username" name="createUsername" required>

                    <label for="email"><b>Email Address</b></label>
                    <input type="text" placeholder="Enter your email" name="createEmail" required>

                    <label for="password"><b>New Password</b></label>
                    <input type="password" pattern="(?=.*\d)(?=.*[a-z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" placeholder="Enter your password" name="createPassword" required>
                    <button id="signupSubmitButton" type="submit">Sign Up</button>
                </div>
                <div class="container">
                    <button type="button" onclick="document.getElementById('signUpForm').style.display='none'" class="cancelbtn">Cancel</button>
                </div>
            </form>
        </div>
    </div>

<!--javascript to open login and signup form in a separate window-->            
<script>
  // Get the modal elements
  var loginModal = document.getElementById('loginForm');
  var signUpModal = document.getElementById('signUpForm');

  // When the user clicks anywhere outside of the modal, close it
  window.onclick = function(event) {
    if (event.target == loginModal) {
      loginModal.style.display = "none";
    }
    if (event.target == signUpModal) {
      signUpModal.style.display = "none";
    }
  }
</script>
    
<header>

    <nav>
        <a href="index.jsp"><img class="logo" src="catfactslogo.png" alt="logo"></a>
        <ul class="nav__links">
            <li class="button"><a class="navlink" href="boards.jsp">Boards</a></li>
            <li class="button"><a class="navlink" href="games.jsp">Games Database</a></li>
            <li class="button"><a class="navlink" href="teams.jsp">Teams</a></li>
            <li class="button"><a class="navlink" href="guidehome.jsp">Guides</a></li>
        </ul>
    </nav>

</header>
     
          

     <script>
         document.getElementById("redirectForm").addEventListener("submit", function(event) {
             event.preventDefault(); // Prevent form submission
             var input = document.getElementById("redirectInput").value.toLowerCase(); // Convert input to lowercase
        
             if (input.includes("guides")) {
                 window.location.href = "guidehome.jsp"; // Redirect to Guides.jsp
             } else if (input.includes("teams")) {
                 window.location.href = "teams.jsp"; // Redirect to Teams.jsp
             } else if (input.includes("boards")) {
                 window.location.href = "boards.jsp"; // Redirect to Boards.jsp
             } else if (input.includes("game")) {
                 window.location.href = "games.jsp"; // Redirect to games.jsp
             } else {
                 // Handle other cases or show an error message
             }
         });
     </script>
     
     <form id="redirectForm" action="#">
         <input type="text" id="redirectInput" placeholder="Enter your search query">
     </form>
   
    <div class="question-container">
        <button type="button">Ask a question</button>
    </div>
    
    <%
        
    int gameID = 1;    
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
    <a class="textdoc" href="#" onclick="openModal('guides/thelastofus2_basictips.txt')"><%out.println(game.getTitle());%> Basic Tips & Tricks</a>
    </div>
    
    <div class="guide-item">
    <h1><u>-Walkthrough Guides-</u></h1>
    <a class="textdoc" href="#" onclick="openModal('guides/thelastofus2_walkthrough.txt')"><%out.println(game.getTitle());%> Walkthrough</a>
    </div>
    
    <div class="guide-item">
    <h1><u>-Characters & Background Guides-</u></h1>
    <a class="textdoc" href="#" onclick="openModal('guides/thelastofus2_characters.txt')"><%out.println(game.getTitle());%> Characters</a>
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