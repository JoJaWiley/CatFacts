<html>
   <head>
      <body style="background-color: grey;">
          <div class="button-container">
          <title>Terms & Rules </title>
      </head>
      
        <h1>Terms & Conditions</h1>
        <button id="mybutton" onclick="myFunction()"></button><script>
            function myFunction() {
            contactus("Security Terms & Conditions");
        }
        document.getElementById("mybutton").onclick=function () {
            location.href="contactus.jsp";
        }
        </script>
        <p>By using this website, you accept that all copyright usage is liable and under the state of law.<br>
            You will abide that all information on this website will not be plagiarized and used unless given consent.<br>
            You accept this agreement to the law's full accountability. If committed with any act of misconduct,<br>
            You will be sentenced to the maximum state sentencing.
            All users are under respectful guidelines when using our website.<br>
            If any suspicious activity is going on, please report immediately.<br>
            Thank you for understanding and if there are any questions or concerns<br>
            please reach out to our customer support team.<br>
            <img src="terms&conditions.gif" alt="https://www.typologycentral.com/threads/lumis-type-emporium-do-you-wanna-get-typed.114917/"/><br>
        <form method="post" action="process.jsp">
         <input type="checkbox" name="accept" id="accept">
         <label for="accept">I agree to the terms and conditions</label>
         <br>
         <input type="submit" value="Submit">
        </form>
        </p>
        </body>
        </html>