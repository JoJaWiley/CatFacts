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
