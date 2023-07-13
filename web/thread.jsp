<%-- 
    Document   : thread
    Created on : Jul 12, 2023, 2:11:43 PM
    Author     : jojaw
--%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*, backendfacts.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <%  User myuser = (User)request.getSession().getAttribute("myuser");
        request.getSession().setAttribute("myuser", myuser);
        String loggedIn;

        if (Objects.isNull(myuser))
            loggedIn = "You are not logged in.";
        else {
            loggedIn = "Welcome, <a href='profile.jsp'>" + myuser.getUserName() + "</a>";
            ProfileDAO pd = new ProfileDAO();
            Profile myprofile = pd.getProfileByUserID(myuser.getUserID());
            if (Objects.isNull(myprofile)) {
                pd.insertProfile(myuser);
                myprofile = pd.getProfileByUserID(myuser.getUserID());
            }
            request.getSession().setAttribute("myprofile", myprofile);
        }
            
        
    %>
    <head>
        <link rel="stylesheet" href="StyleSheet.css">

        <title>Thread</title>
    </head>
    <body>
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
        <input type="text" placeholder="Enter your username" name="username" required>
        <input type="text" placeholder="Enter your username" name="createUsername" required>

        <label for="email"><b>Email Address</b></label>
        <input type="text" placeholder="Enter your email" name="createEmail" required>

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
                <li id="button"><a class="navlink" href="#">News</a></li>
                <li id="button"><a class="navlink" href="#">Teams</a></li>
                <li id="button"><a class="navlink" href="Guides.jsp">Guides</a></li>
                <li id="button"><a class="navlink" href="#">Search</a></li>
            </ul>
        </nav>
 
    </header>
     
        <%
        int threadID = Integer.parseInt(request.getParameter("threadID"));
        UserDAO ud = new UserDAO();
        PostDAO pd = new PostDAO();
        ThreadDAO td = new ThreadDAO();
        
        backendfacts.Thread thread = td.getThread(threadID);
        ArrayList<Post> posts = pd.getAllPostsByThread(threadID);
        
        String title = thread.getTitle();
        String author;
        String content;
        java.sql.Date created;
        %>
        <h1>Thread: <%=title%><h1>
        <%
        int userID;
        for (Post post : posts)
        {
        userID = post.getUserID();
        author = ud.getUser(userID).getUserName();
        created = (java.sql.Date)post.getCreated();
        content = post.getContent();
        %>
        
        <table width=100% cellpadding=3 cellspacing="1" border="1">
            <thead>
                <tr>
                    <th>Author</th>
                    <th>Post</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td width="35%" valign="top"><%=author%><br><%=created%></td>
                    <td width="65%" valign="top"><%=content%><br><br>
            <a href="replytopost.jsp?postID=<%=post.getPostID()%>">REPLY TO POST</a>
                    </td>
                </tr>
            </tbody>
        </table>
        <%
            }
        %>
    </body>
</html>
