<!DOCTYPE html>
<html>
    <head>
    <body style="background-color:black;">
        <div class="button-container>
        <h1>Check Security</h1>
        <img src="warning.gif" alt="https://bestanimations.com/gifs/Warning-White-Blinking-Retro-Sign.html"/>
        <button Id="mybutton" onclick="myFunction()"></button><script>
function myFunction() {
  alert("Detected Violation. Contact Gaming Services to check your account");
}
document.getElementById("mybutton").onclick=function () {
    location.href="security.jsp";
}
</script>
</body>
</html>
