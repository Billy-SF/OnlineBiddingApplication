<!DOCTYPE html>

<html lang="en">
<head>
<title>Confirmation Page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   <link rel="stylesheet" href="customStyle.css"> 

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
      <li><a href="index.jsp"><font color="white"><b>Home</b></font></a></li>
      <li><a href="#"><font color="white"><b>Contact Us</b></font></a></li>
      <li><a href="#"><font color="white"><b>Help</b></font></a></li>
    </ul>
    
   <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">
            <span class="glyphicon glyphicon-log-out"></span><font color="white"><b> Logout</b></font>
            <!-- <span class="caret"></span> -->
          </a>
          <ul class="dropdown-menu">
            <li><a href="edit.jsp"><span class="glyphicon glyphicon-edit"></span> Edit</a></li>
      </ul>      
    </div>
</nav> 




<div class="container-fluid text-center">    
  <div class="row content">
    <div class="col-sm-2 sidenav">
      <p><a href="#"><img src="Real_Time_Bidding.png" height=100% width=100%></a></p>
      <p><a href="#"><img src="chicago.png" height=100% width=100%></a></p>
      <p><a href="#"><img src="bids.png" height=100% width=100%></a></p>
    </div>

<div class="col-sm-3"></div>

<div class="col-sm-3">
<div> &nbsp;</div>
<div class= "panel panel-danger">
 <div class= "panel-heading" >  <b> Registration Form</b> </div>
  <div class ="panel-body"> 
	<form name="verifyForm" action="verifyEmailServlet" onsubmit="return validateForm()" method="POST"> 
		<div class="form-group">
			<p class="pull-left" style="color:red"id="codeValidation"></p>
		    <label for="verificationCode">Verification code:</label>
			<input type="text" class="form-control input-lg" id="code" placeholder="Enter verification code" name="code">
		</div>
			<button type="submit" class="btn btn-primary" id="submitbtn" name="submitbtn">Submit</button>
</form>
	</div>
</div>	
 </div>	
  </div>
</div>

<footer class="container-fluid text-center">
  <div class="navbar-header">
      <a class="navbar-brand" href="#"><b><font size="6" color="white">OttawAuction</font></b></a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="#"><font color="white"><b>© OttawAuction</b></font></a></li>
   </ul>
     <ul class="nav navbar-nav"> 
      <li><a href="#"><font color="white"><b>Feedback</b></font></a></li>
      <li><a href="#"><font color="white"><b>Privacy Policy</b></font></a></li>
   </ul>
</footer>
	
</body>
</html>













