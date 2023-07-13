
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Board Page</title>
  <style>
    nav {
      font-size: 40px;
      align-items: center;
      padding-left: 20px;
      transition: all 0.3s ease-in-out;
      background-color: #b30047;
    }

    nav ul {
      list-style: none;
      margin: 0;
      padding: 0;
      display: flex;
      font-family: 'Nova Square', cursive;
      color: #000;
      justify-content: space-evenly; /* Added to evenly distribute navbar items */
    }

    nav li {
      margin-right: 30px;
    }

    nav a {
      color: white;
    }

    nav a:hover {
      color: pink;
      transition: all 0.3s ease-in-out;
    }

    body {
      background-color: pink;
    }

    .boardtitle-container {
      width: 400px;
      height: 600px;
      font-family: 'Nova Square', cursive;
      display: inline-block;
      margin-top: 40px;
      margin-left: 40px;
      transition: all 0.3s ease 0s;
      color: white;
      background-color: #ff99cc;
      border: none;
      border-radius: 5px;
      padding: 5px 5px;
      font-size: 10px;
      cursor: pointer;
      align-items: center;
      text-align: center;
    }

    .boardtitle-container button {
      margin-bottom: 100px; /* Adjust the margin to increase or decrease the spacing between buttons */
      width: 100%; /* Set the button width to 100% */
      background-color: pink; /* Set the button background color */
      color: #b30047; /* Set the button text color */
      border: none; /* Remove the button border */
      padding: 10px 20px;
      border-radius: 5px;
      cursor: pointer;
      transition: all 0.3s ease-in-out;
      position: relative;
      overflow: hidden;
      z-index: 1;
      font-family: 'Nova Square';
    }

    .boardtitle-container button:hover {
      color: white;
      background-color: #b30047; /* Change background color on hover */
    }

    .boardtitle-container button:before {
      content: "";
      position: absolute;
      z-index: -1;
      top: 0;
      left: 0;
      width: 0;
      height: 100%;
      background-color: #ff99cc;
      transition: all 0.3s ease-in-out;
    }
    .boardtitle-container button:hover:before {
      width: 100%;
    }

    .board-title {
      background-color: pink;
      color: black;
      padding: 10px;
      font-size: 30px;
      border: none;
      cursor: pointer;
      display: inline-block;
      margin-top: 20px;
    }

    /* Updated styles for buttons */
    nav button {
      background-color: pink;
      color: #b30047;
      font-size: 20px; /* Increase button size */
      border: none;
      padding: 10px 20px;
      border-radius: 5px;
      cursor: pointer;
      transition: all 0.3s ease-in-out;
      position: relative;
      overflow: hidden;
      z-index: 1;
    }

    nav button:before {
      content: "";
      position: absolute;
      z-index: -1;
      top: 0;
      left: 0;
      width: 0;
      height: 100%;
      background-color: #ff99cc;
      transition: all 0.3s ease-in-out;
    }

    nav button:hover {
      color: white;
      background-color: #b30047; /* Change background color on hover */
    }

    nav button:hover:before {
      width: 100%;
    }

    .last-post {
      width: 300px;
      height: 600px;
      background-color: #ff99cc;
      color: white;
      font-family: 'Nova Square', cursive;
      text-align: center;
      position: absolute;
      top: 20px;
      right: 20px;
      padding: 10px;
      border-radius: 5px;
      margin-top: 80px;
      margin-left:100px;
    }

    .last-post h2 {
      font-size: 20px;
      margin-bottom: 20px;
    }

    .date-block {
      display: flex;
      flex-direction: column;
      align-items: center;
    }

    .date {
      font-size: 25px;
      margin-bottom: 5px;
    }
  </style>
</head>
<body>
  <header>
    <nav>
      <ul>
        <li><a href="gameboards.html"><button>Game Boards</button></a></li>
        <li><a href="communityboards.html"><button>Community Boards</button></a></li>
        <li><a href="teamboards.html"><button>Team Boards</button></a></li>
        <li><a href="socialboards.html"><button>Social Boards</button></a></li>
        <li><a href="technicalboards.html"><button>Technical Boards</button></a></li>
        <li><a href="other.html"><button>Other</button></a></li>
      </ul>
    </nav>
  </header>

  <div class="boardtitle-container">
    <h1 class="board-title">Board Title</h1>
    <a href=""><button>Board Title</button></a>
    <br>
    <a href=""><button>Board Title</button></a>
    <br>
    <a href=""><button>Board Title</button></a>
    <br>
    <a href=""><button>Board Title</button></a>
  </div>

  <div class="last-post">
    <h2>Last post</h2>
    <div class="date-block">
      <div class="date">yyyy-mm-dd</div>
      <div class="date">yyyy-mm-dd</div>
      <div class="date">yyyy-mm-dd</div>
      <div class="date">yyyy-mm-dd</div>
    </div>
  </div>
</body>
</html>
