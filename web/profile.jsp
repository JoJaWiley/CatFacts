 
<html lang="en">
<head>
    
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile</title>
    <link rel="stylesheet" href="StyleSheet.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
    <%@page import="java.sql.*, backendfacts.*, java.util.Objects"%>
        
    <%  int profileID = Integer.parseInt(request.getParameter("userID"));
        User myuser = (User)request.getSession().getAttribute("myuser");
        request.getSession().setAttribute("myuser", myuser);
        String loggedIn;
        String mylink;
        
        if (Objects.isNull(myuser))
            loggedIn = "You are not logged in.";
        else {
            mylink = "profile.jsp?userID=" + myuser.getUserID();
            loggedIn = "Welcome, <a href='" + mylink + "'>" + myuser.getUserName() + "</a>";
        }
    %>
    
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
    <form class="modal-content animate" action="/validate.js" method="post">
      <div class="container">
        <label for="username"><b>New Username</b></label>
        <input type="text" placeholder="Enter your username" name="username" required>

        <label for="password"><b>New Password</b></label>
        <input type="password" pattern="(?=.*\d)(?=.*[a-z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" placeholder="Enter your password" name="password" required>
        <button id="signupSubmitButton" type="submit">Sign Up</button>
      </div>
      <div class="container">
        <button type="button" onclick="document.getElementById('signUpForm').style.display='none'" class="cancelbtn">Cancel</button>
      </div>
    </form>
  </div>
  </div>

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
                <img class="logo" src="catfactslogo.png" alt="logo">
            <ul class="nav__links">
                <li id="button"><a class="navlink" href="boards.jsp">Boards</a></li>
                <li id="button"><a class="navlink" href="games.jsp">Games Database</a></li>
                <li id="button"><a class="navlink" href="teams.jsp">Teams</a></li>
                <li id="button"><a class="navlink" href="guidehome.jsp">Guides</a></li>
            </ul>
        </nav>
 
    </header>

    <div class="rest">
        <div class="grid-container">
            <div class="grid-item stack center-pic">
                
                <%
                ProfileDAO pd = new ProfileDAO();
                Profile profile = pd.getProfileByUserID(profileID);
                int myUserID;
                if (!Objects.isNull(myuser))
                {
                myUserID = myuser.getUserID();
                }
                else {
                myUserID = 0;
                }
                UserDAO ud = new UserDAO();
                User thisUser = ud.getUser(profileID);
                
                %>
                
                    <h1 class="grid-item-header"><%out.println(thisUser.getUserName() + "'s");%> Profile</h1>
                    <img class="profile-pic" src="uploadFiles/<%=profile.getUserID()%>.jpg"  width="200"/>
                    <% 
                if (myUserID == profileID)
                {
                %>
                    <div>
                        <form action="UploadServlet" method = "post" enctype = "multipart/form-data">
                            <label class="custom-file-upload text-stuff" for="file-upload">Upload Photo
                            <input id="file-upload" type ="file" name = "photo" size="50" onchange="this.form.submit()"/>
                            
                            <i class="fa fa-camera"></i>
                            </label>
                        </form>
                    </div>
                    <%
                        }
                    %>
            </div>
            <div class="grid-item stack text-stuff">
                <%out.println(thisUser.getEmail());%>
                <h2> Bio </h2>
                <p><%out.println(profile.getBio());%></p>
                
                <% 
                if (myUserID == profileID)
                {
                %>
                <button id="bioButton" class="bio-btn text-stuff" onclick="document.getElementById('bioForm').style.display='block'">Edit Bio</button>
                <div id="bioForm" class="modal">
                    <form class="modal-content1 animate" action="editbio.jsp" method="post">
                        <div class="container">
                            <textarea id="bio" name="bio" rows="4" cols="50"><%out.println(profile.getBio());%></textarea>

                            <button id="bioSubmitButton" type="submit">Submit</button>
                        </div>
                        <div class="container">
                            <button type="button" onclick="document.getElementById('bioForm').style.display='none'" class="cancelbtn">Cancel</button>
                        </div>
                    </form>
                </div>
                    <script>
                        // Get the modal elements
                        var bioModal = document.getElementById('bioForm');

                        // When the user clicks anywhere outside of the modal, close it
                        window.onclick = function(event) {
                          if (event.target == bioModal) {
                            loginModal.style.display = "none";
                          }
                        }
                    </script>
                    <%
                        }
                    %>
            </div>
        </div>
    </div>
    </body>
</html>

