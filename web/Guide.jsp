<!DOCTYPE html>
<html lang="en">
<head>
   <style>
    body {
      background: linear-gradient(to right, #ff0066, #b30047);
      margin: 0;
      padding: 0;
    }
    
    .category-container {
        display: flex;
        flex-wrap: wrap;
        font-family: 'Nova Square', cursive;
        color: #ff99ff;
        padding-top: 0px;
    }
    
    .category-container h1:hover,
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

    .logo {
        width: 150px;
        height: auto;
        margin-left: 20px;
        cursor: pointer;
    }
    
    .game-container {
        flex: 1;
        margin-left: 20px;
    }
   
   /* Add the following CSS for fancy pink border */
   body::before,
   body::after {
      content: "";
      position: fixed;
      top: 0;
      bottom: 0;
      width: 40px;
      background-color: #b30047;
      z-index: -1;
   }
   
   body::before {
      left: 0;
   }
   
   body::after {
      right: 0;
   }
   /* End of fancy pink border styling */
   
   </style>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="StyleSheet.css">
</head>
<body>
    
    <div class="button-container">
        <button id="loginButton" onclick="document.getElementById('loginForm').style.display='block'" style="width:auto;">Login</button>
        <div id="loginForm" class="modal">
            <!-- Login form code -->
        </div>

        <button id="signUpButton" onclick="document.getElementById('signUpForm').style.display='block'" style="width:auto;">Sign Up</button>
        <div id="signUpForm" class="modal">
            <!-- Sign up form code -->
        </div>
    </div>

    <header>
        <nav>
            <a href="index.html">
                <img class="logo" src="catfactslogo.png" alt="logo">
            </a>
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
   
    <div class="question-container">
        <button type="button">Ask a question</button>
    </div>
    
    <div class="category-container">
        <div class="game-container">
            <h1 style="padding-left: 150px; padding-top:10px; "><u>Game Details</u></h1>
            <h1 style="padding-left: 150px;">Genre:Action>>Shooting>>Third</h1>
            <h1 style="padding-left: 150px;">Platform:xxxx</h1>
            <h1 style="padding-left: 150px;">Developer:xxxx</h1>
            <h1 style="padding-left: 150px">Publisher:xxxx</h1>
            <h1 style="padding-left: 150px">Posted:July 4, 2024</h1>
        </div>

        <div>
            <h1 style="padding-right: 200px;"><u>-Category 1 Guides-</u></h1>
            <p>Guide Title:</p>
            <p>Guide Title:</p>

            <h1><u>-Category 2 Guides-</u></h1>
            <p>Guide Title:</p>
            <p>Guide Title:</p>

            <h1><u>-Category 3 Guides-</u></h1>
            <p>Guide Title:</p>
            <p>Guide Title:</p>
                <h1>FAQ's</h1>

        </div>
    </div>
</body>
</html>
