<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, backendfacts.*, java.util.Objects"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Team Page</title>
        <style>
  table {
    border-collapse: collapse;
    width: 100%;
  }
  th, td {
    text-align: left;
    padding: 8px;
    border-bottom: 1px solid #ddd;
    color: #FF69B4;
  }
  tr:hover {background-color: #f5f5f5;}
  
  .button-container {
    display: flex;
    justify-content: center;
    padding-top: 20px;
}
.table-container{
    margin-top: 50px;
}
body {
    font-family: Arial, sans-serif;
}
h1 {
    color: #00001a;
}
table th {
    color: #00001a;
}
table tr:nth-child(even) {
    background-color: #F5F5F5
        
}
table tr:hover {
    background-color: #FFC0CB;
}
</style>
<link rel="stylesheet" href="StyleSheet.css">
    </head>
    
    <body class="text-stuff blue-font">
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
        
     <h1><center>Explanation about teams</center></h1>
        <%
        ThreadCategoryDAO tcd = new ThreadCategoryDAO();
        ThreadDAO thd = new ThreadDAO();
        ArrayList<backendfacts.Thread> threads = thd.getAllThreadsByCat(3);
        PostDAO pd = new PostDAO();
        TeamDAO td = new TeamDAO();  
        UserDAO ud = new UserDAO();
        TeamUserDAO tud = new TeamUserDAO();
    ArrayList<Team> teams = td.getAllTeam();
    for (Team team : teams)
    {
    int teamID = team.getTeamID();
    ArrayList<TeamUser> teamMembers = tud.getAllTeamMembers(teamID);
    int openSlots = team.getSlots() - teamMembers.size();
    %>
<table>
  <tr>
    <th>Teams</th>
    <th>Open Slots</th>
    <th>Sign-up</th>
  </tr>
  <tr>
      <th><%=team.getTeamName()%></th>
    <td><%=openSlots%> </td>
    <td><%if(!Objects.isNull(myuser)){%><a href="TeamApply?teamID=<%=teamID%>">apply</a><%} else {%>You must be logged in to apply for a team.<%}%></td>
  </tr>
</table>
       <% }%>
       
        <div></div>
        <button>View More</button>
        <div class="table-container">
            <table>
                <% for (backendfacts.Thread thread: threads)
                {
                int threadID = thread.getThreadID();
                
                Post firstPost = pd.getFirstPostByThread(threadID);
                int creatorID = firstPost.getUserID();
                User creator = ud.getUser(creatorID);
                
                ArrayList<Post> posts = pd.getAllPostsByThread(threadID);
                int numPosts = posts.size();
                
                Post lastPost = pd.getLatestPostByThread(threadID);
                java.sql.Date date = (java.sql.Date)(lastPost.getCreated());
                %>
                <div class="table-container">
                    <table>
                        <tr>
                            <th>Topic</th>
                            <td>Created By</td>
                            <td># of Messages</td>
                            <td>Date of Last Post</td>
                        </tr>
                        <tr>
                            <th><%=thread.getTitle()%></th>
                            <td><%=creator.getUserName()%></td>
                            <td><%=numPosts%></td>
                            <td><%=date%></td>
                        </tr>
                        <%
                            }
                        %>

                    </table>
            </table>
            </div>


        
    </body>
</html>
