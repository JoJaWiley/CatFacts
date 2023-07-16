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
    align-items: center;
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
        
    int gameID = 2;    
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
                    <a class="textdoc" href="#" onclick="openModal('guides/godofwar_faqs.txt')"><%out.println(game.getTitle());%> FAQS</a>
                </div>
            
</div>
            
<!--guide content-->
            
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
    <a class="textdoc" href="#" onclick="openModal('guides/godofwar_basictips.txt')"><%out.println(game.getTitle());%> Basic Tips & Tricks</a>
    </div>
    
    <div class="guidepage-item">
    <h1><u>-Walkthrough Guides-</u></h1>
    <a class="textdoc" href="#" onclick="openModal('guides/godofwar_walkthrough.txt')"><%out.println(game.getTitle());%> Walkthrough</a>
    </div>
    
    <div class="guidepage-item">
    <h1><u>-Characters & Background Guides-</u></h1>
    <a class="textdoc" href="#" onclick="openModal('guides/godofwar_characters.txt')"><%out.println(game.getTitle());%> Characters</a>
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
