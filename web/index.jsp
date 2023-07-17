<%@page import="java.sql.*, backendfacts.*, java.util.Objects"%>

<html lang="en">
<head>
    
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link rel="stylesheet" href="StyleSheet.css">
</head>
<body>
      
    <%  //get the potentially logged in user's user object from session attribute stored at login/signup
        User myuser = (User)request.getSession().getAttribute("myuser");
        //set it in session again just to be sure?
        request.getSession().setAttribute("myuser", myuser);
        //a string to display logged in status with links to profile and signout
        String loggedIn;
        //link to user's profile
        String mylink;

        //if the user is not logged in, say so
        if (Objects.isNull(myuser))
            loggedIn = "You are not logged in.";
        //otherwise, the user is logged in. Say so, with links to profile and signout
        else {
            mylink = "profile.jsp?userID=" + myuser.getUserID();
            loggedIn = "Welcome, <a href='" + mylink + "'>" + myuser.getUserName() + ".</a> Not you? <a href='LogoutServlet'>Sign out.</a>";
            //get the user's profile to ensure it exists
            ProfileDAO pd = new ProfileDAO();
            Profile myprofile = pd.getProfileByUserID(myuser.getUserID());
            //create a profile for the user if one isn't already created
            if (Objects.isNull(myprofile)) {
                pd.insertProfile(myuser);
                myprofile = pd.getProfileByUserID(myuser.getUserID());
            }
            //set the profile as a session attribute
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
                <a href="index.jsp"><img class="logo" src="catfactslogo.png" alt="logo"></a>
            <ul class="nav__links">
                <li class="button"><a class="navlink" href="boards.jsp">Boards</a></li>
                <li class="button"><a class="navlink" href="games.jsp">Games Database</a></li>
                <li class="button"><a class="navlink" href="teams.jsp">Teams</a></li>
                <li class="button"><a class="navlink" href="guidehome.jsp">Guides</a></li>
            </ul>
        </nav>
 
    </header>

    <%
    GameDAO gd = new GameDAO();
    Game game = gd.getRandomGame();
    %>
    
    <!--Start of components that establishes the elements of the home page-->
    <div class="rest">
        
        <form id="redirectForm" action="#">
            <input type="text" id="redirectInput" placeholder="Enter your search query">
        </form>
        
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
        
        <div class="grid-container">
            <div class="grid-item">
                <div class="stack">
                    <a class="game-link" href ="specificgp.jsp?gameID=<%=game.getGameID()%>">
                        <h2 class="grid-item-header"><%out.println(game.getTitle());%></h2>
                </div>                    
                    <div class="home-gamepic">
                        <img class="home-cover" src="game_images/<%=game.getGameID()%>.jpg"  alt="new game">
                        </div>
                    </a>
            </div>
                
            <div class="grid-item">
                <div class="stack2">
                    <h2 class="first-time">First Time Here</h2>
                    </div>
                    <div class="stack2-container">
                        <a class ="stack2-item" href="#">CatFacts Q & A</a>
                        <p class="stack2-writing">Ask or answer about the game you play</p>
                        <a class="stack2-item" href="boards.jsp">Message Boards</a> 
                        <p class="stack2-writing">A board for every game, interest, and community</p>
                        <a class="stack2-item" href="gamedbhome.jsp">Game Database</a>
                        <p class="stack2-writing">Browse our database</p>
                    </div>
                
            </div>
                
            <div class="grid-item">
                <div class="stack3">
                    <h2 class="grid-item-header">-Gaming Events-</h2>
                    <ul class="event">
                        <li><a class="event-link" href="https://www.comic-con.org/cci">San Diego Comic Con - July 20-23</a></li>
                        <li><a class="event-link" href="https://b2b.gamescom.global/gamescom/the-gamescom/">Gamescom - August 23-27</a></li>
                        <li><a class="event-link" href="https://www.nintendo.com/nintendo-live/">Nintendo Live - September 1-4</a></li>
                        <li><a class="event-link" href="https://west.paxsite.com/">PAX West - September 1-4<</a></li>
                        <li><a class="event-link" href="https://events.nikkeibp.co.jp/tgs/2023/en/exhibitor/">Tokyo Game Show - September 21-24</a></li>
                    </ul>
                </div>
            </div>
                
            <div class="grid-item">
                <div class="stack3">
                    <h2 class="grid-item-header">-Top Games-</h2>
                    <ul class="top-games">
                        <li><a class="topgame-link" href="specificgp.jsp?gameID=5">The Legend of Zelda: Breath of the Wild</a></li>
                        <li><a class="topgame-link" href="specificgp.jsp?gameID=19">Red Dead Redemption 2</a></li>
                        <li><a class="topgame-link" href="specificgp.jsp?gameID=4">Bloodborne</a></li>
                        <li><a class="topgame-link" href="specificgp.jsp?gameID=13">Minecraft</li>
                        <li><a class="topgame-link" href="specificgp.jsp?gameID=20">The Witcher 3: Wild Hunt</a></li>
                    </ul>
                </div>                       
            </div>
                
            <div class="grid-item">
                <div class="stack3">
                    <h2 class="grid-item-header">-Trending Posts-</h2>
                    <p class="trending-posts">  Dive into our immersive gameplay experience,<br>
                        where your choices matter and your actions shape the world around you.<br>
                        Unleash powerful abilities, acquire legendary gear,<br>
                        and customize your character to become the hero you've always envisioned.<br> 
                        Will you be known for your courage, wisdom, or cunning? The choice is yours!
                    </p>
                </div> 
                </div>
                
            <div class="grid-item">
                <div class="stack3">
                    <h2 class="grid-item-header">-Top Teams-</h2>
                    <ul class="top-teams">
                        <li><a class="team-link" href="#">TEAM 1</a></li>
                        <li><a class="team-link" href="#">TEAM 2</a></li>
                        <li><a class="team-link" href="#">TEAM 3</a></li>
                        <li><a class="team-link" href="#">TEAM 4</a></li>
                        <li><a class="team-link" href="#">TEAM 5</a></li>
                    </ul>
                 </div>
            </div>
        </div>
    </div>
</body>
</html>