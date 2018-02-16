<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="customStyle.css">  
<title>Confirmation Page</title>
 <script>
  function validateForm(){
	  var code = document.forms["verifyForm"]["code"].value;
				if (code.match("[^0-9]{2,7}")) 
				{
					document.getElementById("codeValidation").innerHTML = "Please enter digits only!";
					return false;
				}
				return true;
				
			}
</script>
</head>
<body>
 <jsp:include page="<%= \"topMenu.jsp\" %>" />
   
   <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#"><b><font size="6" color="white">OttawAuction</font></b></a>
    </div>
    <form class="navbar-form navbar-left" action="/action_page.php">
      <div class="input-group">
        <input type="text" class="form-control" placeholder="Search" name="search">
        <div class="input-group-btn">
          <button class="btn btn-default" type="submit">
            <i class="glyphicon glyphicon-search"></i>
          </button>
        </div>
      </div>
    </form>
    <ul class="nav navbar-nav">
      <li><a href="#"><font color="white"><b>Home</b></font></a></li>
      <li><a href="#"><font color="white"><b>Contact Us</b></font></a></li>
      <li><a href="#"><font color="white"><b>Help</b></font></a></li>
    </ul>
<!--     toggle button for  -->
     <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">
           <span class="glyphicon glyphicon-user" style="color:white"></span><font color="white"><b> <%=session.getAttribute("username") != null ? session.getAttribute("username") : ""%></b></font>
            <!-- <span class="caret"></span> -->
          </a>
          <ul class="dropdown-menu">
            <li><a href="edit.jsp"><span class="glyphicon glyphicon-edit"></span> Edit</a></li>
            <li><a href="Logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
      </ul>      
    </div>
</nav>

<jsp:include page="<%= \"leftMenu.jsp\" %>" /> 
 
 <div class="col-sm-8 text-left"> 
		<p>Please verify your email and enter the code to confirm your account!</p>
		<form name="verifyForm" action="verifyEmailServlet" onsubmit="return validateForm()" method="POST"> 
				<div class="form-group">
					<p class="pull-left" style="color:red"id="codeValidation"></p>
				    <label for="verificationCode">Verification code:</label>
					<input type="text" class="form-control input-md" id="code" placeholder="Enter verification code" name="code">
				</div>
				<button type="submit" class="btn btn-primary" id="submitbtn" name="submitbtn">Submit</button>
		</form>
</div>

</body>
<footer>
 <jsp:include page="<%= \"footer.jsp\" %>" />
</footer>
</html>