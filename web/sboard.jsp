<html lang="en">
<head>
    
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
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
            border-bottom: 1px solid #b30047;
            color: #00001a;
        }
        </style>
</head>
<body>
    <%@page import="java.sql.*, backendfacts.*, java.util.*"%>
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
                <li id="button"><a class="navlink" href="guidehome.jsp">Guides</a></li>
            </ul>
        </nav>
 
    </header>
        <%
            int threadCatID = Integer.parseInt(request.getParameter("threadCatID"));
            UserDAO ud = new UserDAO();
            PostDAO pd = new PostDAO();
            ThreadDAO td = new ThreadDAO();
            ThreadCategoryDAO tcd = new ThreadCategoryDAO();
            ThreadCategory tc = tcd.getThreadCat(threadCatID);
            ArrayList<backendfacts.Thread> threads = td.getAllThreadsByCat(threadCatID);
            
            String board = tc.getTitle();
            String topic;
            String author;
            int postCount;
            String date;
            String link;
            
            %>
            <h1 class="text-stuff blue-font text-align-center"><%=board%> Board</h1>
            <%
            
            if (Objects.isNull(threads) || threads.size() == 0)
            {
            %>
            There are no threads on this board yet.
            <%
                if (!Objects.isNull(myuser))
                {
        %>
        <br>
            <a href="threadstart.jsp?threadCatID=<%=threadCatID%>">Start a new thread</a>
            <%
                } //end inner if
            } else {
        %>
        <table>
            <tr>
                <th>Topic</th>
                <th>Created By</th>
                <th># of Messages</th>
                <th>Date of Last Post</th>
            </tr>
            <%
                for (backendfacts.Thread thread : threads) {
                    topic = thread.getTitle();
                    int thID = thread.getThreadID();
                    Post firstPost = pd.getFirstPostByThread(thID);
                    author = ud.getUser(firstPost.getUserID()).getUserName();
                    link = "thread.jsp?threadID=" + thID;
                    int numPosts = pd.getAllPostsByThread(thID).size();
                    java.sql.Date postDate = (java.sql.Date)pd.getLatestPostByThread(thID).getCreated();
                
            String table = "<tr><td><a href='" + link + "'>" + topic + "</a></td><td>" + author + "</td><td>" + numPosts + "</td><td>" + postDate + "</td></tr>";
            
            out.print(table);
            %>
        </table>
        <%
                } //end for loop
                if (!Objects.isNull(myuser))
                {
        %>
        <br>
            <a href="threadstart.jsp?threadCatID=<%=threadCatID%>">Start a new thread</a>
        <%
                } //end inner if
            } //end outer if-else
        %>
    </body>
</html>
