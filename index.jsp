
<html lang="en">
<head>
    
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link rel="stylesheet" href="StyleSheet.css">
</head>
<body>
    <%@page import="java.sql.*, backendfacts.*, java.util.Objects"%>
    <%  User myuser = (User)request.getSession().getAttribute("myuser");
        request.getSession().setAttribute("myuser", myuser);
        String loggedIn;
        String mylink;

        if (Objects.isNull(myuser))
            loggedIn = "You are not logged in.";
        else {
            mylink = "profile.jsp?userID=" + myuser.getUserID();
            loggedIn = "Welcome, <a href='" + mylink + "'>" + myuser.getUserName() + "</a>";
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
    
         
         
         
         
         
         
     <!--navbar header-->
    <header>
 
        <nav>
                <img class="logo" src="catfactslogo.png" alt="logo">
            <ul class="nav__links">
                <li id="button"><a class="navlink" href="#">Boards</a></li>
                <li id="button"><a class="navlink" href="#">Games Database</a></li>
                <li id="button"><a class="navlink" href="#">Teams</a></li>
                <li id="button"><a class="navlink" href="Guides.jsp">Guides</a></li>
            </ul>
        </nav>
 
    </header>
   <form id="redirectForm" action="#">
    <input type="text" id="redirectInput" placeholder="Enter your search query">
</form>

<script>
    document.getElementById("redirectForm").addEventListener("submit", function(event) {
        event.preventDefault(); // Prevent form submission
        var input = document.getElementById("redirectInput").value.toLowerCase(); // Convert input to lowercase
        
        if (input.includes("guides")) {
            window.location.href = "Guides.jsp"; // Redirect to Guides.jsp
        } else if (input.includes("teams")) {
            window.location.href = "Teams.jsp"; // Redirect to Teams.jsp
        } else if (input.includes("boards")) {
            window.location.href = "Boards.jsp"; // Redirect to Boards.jsp
        } else if (input.includes("game")) {
            window.location.href = "games.jsp"; // Redirect to games.jsp
        } else {
            // Handle other cases or show an error message
        }
    });
</script>







    <%
    GameDAO gd = new GameDAO();
    Game game = gd.getRandomGame();
    %>
    <!-- Establish the elements of the home page-->
    <div class="rest">
        <div class="grid-container">
            <div class="grid-item">
                <div class="stack center-pic">
                        <div class="card">
                        <h2 class="grid-item-header"><%out.println(game.getTitle());%></h2>
                        <img class="new-game" src="game_images/<%=game.getGameID()%>.jpg" width="400" alt="new game">
                    </div>
                </div>
            </div>
            <div class="grid-item">
                <div class="stack2">
                        <a class="first-time" href="#">First Time Here</a>
                        <div class="stack2-container">
                            <a class ="stack2-item" href="#">CatFacts Q & A</a>
                            <p class="stack2-writing">Ask or answer about the game you play</p>
                            <a class="stack2-item" href="#">Message Boards</a> 
                            <p class="stack2-writing">A board for every game, interest, and community</p>
                            <a class="stack2-item" href="#">Game Database</a>
                            <p class="stack2-writing">Browse our database</p>
                        </div>
                </div>
            </div>
            <div class="grid-item">
                <div class="stack">
                    <h2 class="grid-item-header">Events</h2>
                    <ul class="event text-align-left">
                        <li>The Crimson Eclipse</li>
                        <li>Raiders of the Lost Relic</li>
                        <li>Battle for Eternia: The Realm Divide</li>
                        <li>The Forgotten Prophecy</li>
                        <li>The Great Tournament of Legends</li>
                    </ul>
                </div>
            </div>
            <div class="grid-item">
                <div class="stack">
                    <h2 class="grid-item-header">Top Games</h2>
                    <ul class="top-games text-align-left">
                        <li>The Legend of Zelda: Breath of the Wild</li>
                        <li>Red Dead Redemption 2</li>
                        <li>Fortnite</li>
                        <li>Minecraft</li>
                        <li>The Witcher 3: Wild Hunt</li>
                    </ul>
                </div>                       
            </div>
            <div class="grid-item">
                <div class="stack">
                    <h2 class="grid-item-header">Trending Posts</h2>
                    <p class="trending-posts">  Dive into our immersive gameplay experience,<br>
                        where your choices matter and your actions shape the world around you.<br>
                        Unleash powerful abilities, acquire legendary gear,<br>
                        and customize your character to become the hero you've always envisioned.<br> 
                        Will you be known for your courage, wisdom, or cunning? The choice is yours!
                    </p>
                </div> 
                </div>
            <div class="grid-item">
                <div class="stack">
                    <h2 class="grid-item-header">Top Teams</h2>
                    <ul class="top-teams">
                        <li>Blizzard Entertainment</li>
                        <li>Rockstar Games</li>
                        <li>Valve Corporation</li>
                        <li>Nintendo</li>
                        <li>Epic Games</li>
                    </ul>
                 </div>
        </div>
    </div>
 
</body>
</html>