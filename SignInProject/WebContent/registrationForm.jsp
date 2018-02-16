<!DOCTYPE html>

<html lang="en">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="loc" value="en_US"/>
<c:if test="${!(empty param.locale)}">
  <c:set var="loc" value="${param.locale}"/>
</c:if>
<fmt:setLocale value="${param.locale}" />
<fmt:bundle basename="MessagesBundle">


<head>
<title>Registration Form</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script>
  function validateForm(){
	  var firstName = document.forms["registrationForm"]["firstName"].value;
	  var lastName = document.forms["registrationForm"]["lastName"].value;
	  var userName = document.forms["registrationForm"]["userName"].value;
	  var password = document.forms["registrationForm"]["password"].value;
	  var email = document.forms["registrationForm"]["email"].value;
	  var errorAmount = 0;
	  
				if (firstName.length < 2) 
				{
					document.getElementById("firstNameValidation").innerHTML = "Please enter a valid first name";
					errorAmount++;
				} else {
					document.getElementById("firstNameValidation").innerHTML = "";
					errorAmount++;
				}
				if (lastName.length < 2) {
					document.getElementById("lastNameValidation").innerHTML = "Please enter a valid last name";
					errorAmount++;
				} else {
					document.getElementById("lastNameValidation").innerHTML = "";
				}
				if (userName.length < 2) {
					document.getElementById("userNameValidation").innerHTML = "Please enter a user name with alteast two characters";
					errorAmount++;
				} else {
					document.getElementById("userNameValidation").innerHTML = "";
				}
				if (password.length < 4) {
					document.getElementById("passwordValidation").innerHTML = "Please enter a password with atleast 4 characters";
					errorAmount++;
				} else {
					document.getElementById("passwordValidation").innerHTML = "";
				}
				if (email.length < 3 || !email.includes("@")
						|| !email.includes(".") || email.length < 3
						&& !email.includes("@")) {
					document.getElementById("emailValidation").innerHTML = "Please enter a valid email address with atleast 3 characters including the @ sybmol";
					errorAmount++;
				} else {
					document.getElementById("emailValidation").innerHTML = "";
				}
				if (errorAmount > 0){
					return false;
				}
				else{
					return true;
				}
			}
</script>
<style>
/* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      background-color: #cc0000;
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 450px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      background-color: #990033;
      height: 110%;
    }
    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #cc0000;
      color: white;
      padding: 15px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;} 
    }
  .text-left{
  background-color: #ff6600;
  }

}
</style>
</head>


<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#"><b><font size="6" color="white">OttawAuction</font></b></a>
    </div>
    <form class="navbar-form navbar-left" action="/action_page.php">
      <div class="input-group">
        <input type="text" class="form-control" placeholder="<fmt:message key="search"/>" name="search">
        <div class="input-group-btn">
          <button class="btn btn-default" type="submit">
            <i class="glyphicon glyphicon-search"></i>
          </button>
        </div>
      </div>
    </form>
    <ul class="nav navbar-nav">
      <li><a href="index.jsp"><font color="white"><b><fmt:message key="home"/></b></font></a></li>
      <li><a href="#"><font color="white"><b><fmt:message key="contactUs"/></b></font></a></li>
      <li><a href="#"><font color="white"><b><fmt:message key="help"/></b></font></a></li>
    </ul>
    
   <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">
            <span class="glyphicon glyphicon-log-out"></span><font color="white"><b> <fmt:message key="logout"/></b></font>
            <!-- <span class="caret"></span> -->
          </a>
          <ul class="dropdown-menu">
            <li><a href="#"><span class="glyphicon glyphicon-edit"></span> <fmt:message key="edit"/></a></li>
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
 <div class= "panel-heading" >  <b> <fmt:message key="registrationForm"/></b> </div>
  <div class ="panel-body"> 
	<form name="registrationForm" action="registerServlet" onsubmit="return validateForm()" method="POST"> 
		<div class="form-group">
		    <p class="pull-left" style="color:red" id="firstNameValidation"></p>
		    <label class ="pull-left" for="firstName"><fmt:message key="firstName"/></label>
			<input type="text" class="form-control input-sm" id="firstName" placeholder="<fmt:message key="enterFirstName"/>" name="firstName" required>
		</div>
		<div class="form-group">
		 <p class="pull-left" style="color:red" id="lastNameValidation"></p>
		    <label class ="pull-left" for="lastName"><fmt:message key="lastName"/></label>
			<input type="text" class="form-control input-sm" id="lastName"  placeholder="<fmt:message key="enterLastName"/>" name="lastName" required>
	    </div>
	    <div class="form-group">
	     <p class="pull-left" style="color:red" id="userNameValidation"></p>		
			<label class ="pull-left" for="username"><fmt:message key="username"/></label>
			<input type="text" class="form-control input-sm" id="userName" placeholder="<fmt:message key="enterUsername"/>" name="userName" required>
		</div>
			
		<div class="form-group">
		 <p class="pull-left" style="color:red" id="passwordValidation"></p>	
			<label class ="pull-left" for="password"><fmt:message key="password"/></label>
			<input type="password" class="form-control input-sm" id="password" placeholder="<fmt:message key="enterPassword"/>" name="password" required>
		</div>
		<div class="form-group">
		 <p class="pull-left" style="color:red" id="emailValidation"></p>	
			<label class ="pull-left" for="emailAddress"><fmt:message key="email"/></label>
			<input type="text" class="form-control input-sm" id="emailAddress" placeholder="<fmt:message key="enterEmail"/>" name="email" required>    
		</div>	
			<button type="submit" class="btn btn-primary" id="submitbtn" name="submitbtn"><fmt:message key="submit"/></button>
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
      <li><a href="edit.jsp"><font color="white"><b>© OttawAuction</b></font></a></li>
   </ul>
     <ul class="nav navbar-nav"> 
      <li><a href="#"><font color="white"><b><fmt:message key="feedback"/></b></font></a></li>
      <li><a href="#"><font color="white"><b><fmt:message key="privacyPolicy"/></b></font></a></li>
   </ul>
</footer>

</body>
</fmt:bundle>
</html>