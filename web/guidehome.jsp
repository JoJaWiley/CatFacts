<%@page import="java.sql.*, backendfacts.*, java.util.Objects, java.util.*"%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="StyleSheet.css">
    
    

</head>
<body>
    
    <%  User myuser = (User)request.getSession().getAttribute("myuser");
        String loggedIn;

        if (Objects.isNull(myuser))
            loggedIn = "You are not logged in.";
        else 
            loggedIn = "Welcome, " + myuser.getUserName() + "!";
    %>
    
    <!--Login and signup button and their modal forms-->
<div class="button-container">
  <div class="logged-in-status"><%out.println(loggedIn + "    ");%></div>
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
        <input type="text" placeholder="Enter your username" name="createUsername" required>
        
        <label for="email"><b>Email Address</b></label>
        <input type="text" placeholder="Enter your email" name="createEmail" required>

        <label for="password"><b>New Password</b></label>
        <input type="password" placeholder="Enter your password" name="createPassword" required>
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
                <img class="logo" src="catfactslogo" href="index.jsp" alt="logo">
            <ul class="nav__links">
                <li id="button"><a class="navlink" href="#">Boards</a></li>
                <li id="button"><a class="navlink" href="#">Games Database</a></li>
                <li id="button"><a class="navlink" href="#">News</a></li>
                <li id="button"><a class="navlink" href="#">Teams</a></li>
                <li id="button"><a class="navlink" href="guidehome.jsp">Guides</a></li>
                <li id="button"><a class="navlink" href="#">Search</a>
                    
                </li>
            </ul>
        </nav>
 
    </header>
     
         <h1 class="guide-header">Guides and Walkthroughs</h1>
         
        
     
     <div class="guide-container">
         <%
         GuideDAO gd = new GuideDAO();
         ArrayList<Guide> guides = gd.getAllGuides();
         
         for (Guide guide: guides) {
         %>
         
        <div class="guide-item">
                <div class="guide-image">
                    <a href="<%out.println(guide.getGuidePage());%>">
                    <img src="guideimages/<%out.println(guide.getGuideID());%>.jpg" class="cover" alt="Game Guide Cover">
                    </a>
                </div>
                <div class="text-container">
                    <h4><b><%out.println(guide.getGuideTitle());%> Guide</b></h4>
                    <p><%out.println(guide.getGuideInfo());%></p>
                </div>
            </div>
                
        <% } %>
         
     </div>
        
 
</body>


</html>