<%@page import="java.sql.*, backendfacts.*, java.util.*"%>

<html lang="en">
<head>
    
    <!--using this body style locally to this page-->
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
    
    <%  
        User myuser = (User)request.getSession().getAttribute("myuser");
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
            <a href="index.html">
                <img class="logo" src="catfactslogo.png" href="index.jsp" alt="logo">
            </a>
            <ul class="nav__links">
                <li id="button"><a class="navlink" href="boards.jsp">Boards</a></li>
                <li id="button"><a class="navlink" href="games.jsp">Games Database</a></li>
                <li id="button"><a class="navlink" href="teams.jsp">Teams</a></li>
                <li id="button"><a class="navlink" href="guidehome.jsp">Guides</a></li>
                <li id="button"><a class="navlink" href="#">Search</a></li>
            </ul>
        </nav>
    </header>

<!--Start of search bar functionality-->
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
        
    int gameID = 3;    
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
    <a class="textdoc" href="#" onclick="openModal('guides/spiderman_faqs.txt')"><%out.println(game.getTitle());%> FAQS</a>
</div>
    
</div>
            
<!--start of main guide content-->
            
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
    <a class="textdoc" href="#" onclick="openModal('guides/spiderman_basictips.txt')"><%out.println(game.getTitle());%> Basic Tips & Tricks</a>
    </div>
    
    
    <div class="guidepage-item">
    <h1><u>-Walkthrough Guides-</u></h1>
    <a class="textdoc" href="#" onclick="openModal('guides/spiderman_walkthrough.txt')"><%out.println(game.getTitle());%> Walkthrough</a>
    </div>
    
    <div class="guidepage-item">
    <h1><u>-Characters & Background Guides-</u></h1>
    <a class="textdoc" href="#" onclick="openModal('guides/spiderman_characters.txt')"><%out.println(game.getTitle());%> Characters</a>
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