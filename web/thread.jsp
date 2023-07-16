
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
        <style>
            table {
                border-collapse: collapse;
                width: 100%;
            }
            
            th {
                text-align: left;
                padding: 8px;
                border-bottom: 1px solid #ddd;
                color: #00001a;
                background-color: #ff66a3;
            }
            td {
                text-align: left;
                padding: 8px;
                border-bottom: 1px solid #ddd;
                color: #00001a;
            }
            
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
            
            .small-text {
                font-size: 15px;
            }
            
            .post {
                font-size:20px;
            }
        </style>

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
                <li id="button"><a class="navlink" href="boards.jsp">Boards</a></li>
                <li id="button"><a class="navlink" href="games.jsp">Games Database</a></li>
                <li id="button"><a class="navlink" href="teams.jsp">Teams</a></li>
                <li id="button"><a class="navlink" href="guidehome.jsp">Guides</a></li>
            </ul>
        </nav>
 
    </header>
     
        <%
        int threadID = Integer.parseInt(request.getParameter("threadID"));
        UserDAO ud = new UserDAO();
        PostDAO pd = new PostDAO();
        ThreadDAO td = new ThreadDAO();
        ThreadCategoryDAO tcd = new ThreadCategoryDAO();
        ProfileDAO prod = new ProfileDAO();        
        
        backendfacts.Thread thread = td.getThread(threadID);
        int threadCatID = thread.getCategoryID();
        
        ThreadCategory tcat = tcd.getThreadCat(threadCatID);
        String catName = tcat.getTitle();
        
        ArrayList<Post> posts = pd.getAllPostsByThread(threadID);
        
        String title = thread.getTitle();
        String author;
        String content;
        java.sql.Date created;
        %>
        <h1 class="text-stuff blue-font text-align-center">Thread: <%=title%> in Board: <a href="sboard.jsp?threadCatID=<%=threadCatID%>"><%=catName%></a><h1>
        <%
        int userID;
        for (Post post : posts)
        {
        userID = post.getUserID();
        author = ud.getUser(userID).getUserName();
        Profile profile = prod.getProfileByUserID(userID);
        created = (java.sql.Date)post.getCreated();
        content = post.getContent();
        %>
        
        <table width=100% cellpadding=3 cellspacing="1" border="1" class="text-stuff">
            <thead>
                <tr>
                    <th class="small-text">Author</th>
                    <th class="small-text">Post</th>
                </tr>
            </thead>
            
            <tbody>
                <tr>
                    <td width="35%" valign="top"><a href="profile.jsp?userID=<%=userID%>"><%=author%><br><img class="profile-pic" src="uploadFiles/<%=profile.getUserID()%>.jpg"  width="100"/></a><br><p class="small-text"><%=created%></p></td>
                    <td class="post" width="65%" valign="top">
                        <div class="post">
                            <div class="post-text">
                                <%=content%><br><br>
                            </div>
    <%  if (!Objects.isNull(myuser))
        {
            if (userID == myuser.getUserID())
            {
    %>
                                <div class="edit-container">
                                    <a class="edit-post text-stuff text-align-center" href="editpost.jsp?postID=<%=post.getPostID()%>">Edit</a>
                                    <br>
                                    <a class="edit-post text-stuff text-align-center" href="deletepost.jsp?postID=<%=post.getPostID()%>">Delete</a>
                                </div>
                        </div>
    <%
            } //end inner if
        } //end outer if
    %>
                    </td>
                </tr>
            </tbody>
        </table>
        <%
            } //end for loop
        %>
        
        <%
            if (!Objects.isNull(myuser))
            {
        %>
        
        <div class="ta-container">
        <h5 class="text-stuff">Post your reply</h5>
        <form method="post" action="AddReplyServlet?threadID=<%=threadID%>">
            <textarea class="text-area" name="postText" rows="8" cols="40" wrap="virtual" width="100%"></textarea>
            <p class="text-stuff"><input class="add-post" type="submit" name="submit" value="Add Post"></p>
        </form>
        </div>
        <%
            }
        %>
    </body>
</html>
