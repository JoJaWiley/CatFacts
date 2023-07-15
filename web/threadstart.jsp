<%@page import="java.sql.*, backendfacts.*, java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
        //get the threadCatID from the URL query
        int threadCatID = Integer.parseInt(request.getParameter("threadCatID"));
        
        ThreadCategoryDAO tcd = new ThreadCategoryDAO();
        ThreadCategory tcat = tcd.getThreadCat(threadCatID);
        String title = tcat.getTitle();
        
    %>
<head>
        <link rel="stylesheet" href="StyleSheet.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Post your thread in <%=title%></title>
        <style>
            .ta-container {
                align-items: center;
                justify-content: center;
                text-align: center;
                padding: 0;
            }

            .text-area {
                resize: none;
                width: 75%;
                height: 200px;
                padding: 0;
            }

            .add-post {
                padding: 7px 25px;
                background-color: #00001a;
                border: none;
                border-radius: 30px;
                cursor: pointer;
                color: white;
                transform: translate(400px, 0);
            }
            
            .title-area {
                width: 75% !important;
                background-color: white !important;
                color: black !important;
                
            }
        </style>
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
                <li id="button"><a class="navlink" href="boards.jsp">Boards</a></li>
                <li id="button"><a class="navlink" href="games.jsp">Games Database</a></li>
                <li id="button"><a class="navlink" href="teams.jsp">Teams</a></li>
                <li id="button"><a class="navlink" href="Guides.jsp">Guides</a></li>
            </ul>
        </nav>
 
    </header>
        <div class="ta-container">
            <h5 class="text-stuff blue-font">Post your thread in <%=title%></h5>
            <form method="post" action="addthreadstart.jsp">
                <label for="threadTitle" class="text-stuff blue-font">Title:</label><br>
                <input class="title-area" type="text" name="threadTitle" size="40" maxlength="250"><br>
                <label for="postText" class="text-stuff blue-font">Post</label><br>
                <textarea class="text-area" name="postText" rows="8" cols="40" wrap="virtual"></textarea>
                <p class="text-stuff blue-font"><input class="add-post" type="submit" name="submit" value="Add Post"></p>
                <p class="text-stuff"><input class="add-post" type="button" value="Cancel" onclick="history.back()"/></p>
            </form>
        </div>
    </body>
</html>
