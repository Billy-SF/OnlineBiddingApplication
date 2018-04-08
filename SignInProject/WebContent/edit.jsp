<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Header area wrapper starts -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="loc" value="en_US" />
<c:if test="${!(empty param.locale)}">
	<c:set var="loc" value="${param.locale}" />
</c:if>
<fmt:setLocale value="${loc}" />

<fmt:bundle basename="MessagesBundle">
<head>


<meta charset="utf-8">
    <!-- Viewport Meta Tag -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>
      Edit Account
    </title>
    <!-- Bootstrap -->
     <link rel="stylesheet" type="text/css" href="assets/css/header.css">
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
    <!-- Main Style -->
    <link rel="stylesheet" type="text/css" href="assets/css/main.css">
    <!-- Slicknav Css -->
    <link rel="stylesheet" type="text/css" href="assets/css/slicknav.css">

    <!-- Responsive Style -->
    <link rel="stylesheet" type="text/css" href="assets/css/responsive.css">
    <!--Fonts-->
    <link rel="stylesheet" media="screen" href="assets/fonts/font-awesome/font-awesome.min.css">
    <link rel="stylesheet" media="screen" href="assets/fonts/simple-line-icons.css">    
     
    <!-- Extras -->
    <link rel="stylesheet" type="text/css" href="assets/extras/owl/owl.carousel.css">
    <link rel="stylesheet" type="text/css" href="assets/extras/owl/owl.theme.css">
    <link rel="stylesheet" type="text/css" href="assets/extras/animate.css">
    <link rel="stylesheet" type="text/css" href="assets/extras/normalize.css">
    

    <!-- Color CSS Styles  -->  
    <link rel="stylesheet" type="text/css" href="assets/css/colors/green.css" media="screen" /> 
    
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js">
    </script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js">
    </script>
    <![endif]-->
    <style>
     .center-div
{
     margin: 0 auto;
     width: 100px; 
}

    </style>


   
  <script>
  function validateForm(){
	  var error = null;
	  var firstName = document.forms["editForm"]["firstname"].value;
	  var lastName = document.forms["editForm"]["lastname"].value;
	  var userName = document.forms["editForm"]["username"].value;
	  var password = document.forms["editForm"]["password"].value;
	  var email = document.forms["editForm"]["email"].value;
	  
				if (firstName.length < 2) 
				{
					document.getElementById("firstNameValidation").innerHTML = "Please enter a valid first name";
					error ="Error";
				} else {
					document.getElementById("firstNameValidation").innerHTML = "";
				}
				if (lastName.length < 2) {
					document.getElementById("lastNameValidation").innerHTML = "Please enter a valid last name";
					error ="Error";
				} else {
					document.getElementById("lastNameValidation").innerHTML = "";
				}
				if (userName.length < 2) {
					document.getElementById("userNameValidation").innerHTML = "Please enter a user name with alteast two characters";
					error ="Error";
				} else {
					document.getElementById("userNameValidation").innerHTML = "";
				}
				if (password.length < 4) {
					document.getElementById("passwordValidation").innerHTML = "Please enter a password with atleast 4 characters";
					error ="Error";
				} else {
					document.getElementById("passwordValidation").innerHTML = "";
				}
				if (email.length < 3 || !email.includes("@")
						|| !email.includes(".") || email.length < 3
						&& !email.includes("@")) {
					document.getElementById("emailValidation").innerHTML = "Please enter a valid email address with atleast 3 characters including the @ sybmol";
					error ="Error";
				} else {
					document.getElementById("emailValidation").innerHTML = "";
				}
				
				if(error != null){
					return false;
				}
				return true;
			}
</script>





</head>

  <body>

 <%@include file="header.jsp" %>
 
  <!-- Contact Section -->
    <section class="contact-form-section section">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-50 text-center contact-title-text wow fadeIn" data-wow-delay="0.3s">
            <h2>Edit</h2>
          </div>
          <div  class="col-md-7 col-md-offset-1 contact-form contact-info-section center-div">
  <form name="editForm" action="editServlet" method="POST" onsubmit="return validateForm();"> 
		<div class="form-group">
		    <label class ="pull-left" for="firstName"><fmt:message key="firstName"/></label>
			<input type="text" class="form-control input-sm" id="firstname"  value="<%=session.getAttribute("firstname")%>"name="firstname" required>
			<p class="pull-left" style="color:red" id="firstNameValidation"></p>
		</div>
		
		<div class="form-group">
		   <label class ="pull-left" for="lastName"><fmt:message key="lastName"/></label>
			<input type="text" class="form-control input-sm" id="lastname"  value="<%=session.getAttribute("lastname")%>" name="lastname" required>
			<p class="pull-left" style="color:red" id="lastNameValidation"></p>
	    </div>
	    
	    <div class="form-group">		
			<label class ="pull-left" for="username"><fmt:message key="username"/></label>
			<input type="text" class="form-control input-sm" id="username"  value="<%=session.getAttribute("username")%>" name="username" required>
			<p class="pull-left" style="color:red" id="userNameValidation"></p>
		</div>
			
		<div class="form-group">	
			<label class ="pull-left" for="password"><fmt:message key="password"/></label>
			<input type="password" class="form-control input-sm" id="password"  value="<%=session.getAttribute("password")%>" name="password" required>
			<p class="pull-left" style="color:red" id="passwordValidation"></p>
		</div>
		
		<div class="form-group">	
			<label class ="pull-left" for="emailAddress"><fmt:message key="email"/></label>
			<input type="text" class="form-control input-sm" id="email"  value="<%=session.getAttribute("email")%>" name="email" required> 
			<p class="pull-left" style="color:red" id="emailValidation"></p>   
		</div>	
		
			<button type="submit" class="btn btn-primary" id="submitbtn" name="submitbtn">Submit</button>

	</form>
          </div>
        </div>
      </div>
    </section>
    <!-- Contact Section End -->
    
  
<%@include file="footer.jsp" %>
   
    <!-- Go To Top Link -->
    <a href="#" class="back-to-top">
      <i class="fa fa-angle-up">
      </i>
    </a>
    
    <!-- JavaScript & jQuery Plugins -->
    <script src="assets/js/jquery-min.js"></script>
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/jquery.mixitup.js"></script>
    <script src="assets/js/smoothscroll.js"></script>
    <script src="assets/js/wow.js"></script>
    <script src="assets/js/owl.carousel.js"></script> 
    <script src="assets/js/waypoints.min.js"></script>
    <script src="assets/js/jquery.counterup.min.js"></script>
    <script src="assets/js/jquery.slicknav.js"></script>
    <script src="assets/js/jquery.appear.js"></script>
    <script src="assets/js/form-validator.min.js"></script>
    <script src="assets/js/contact-form-script.min.js"></script>
    <script src="assets/js/main.js"></script> 

  </body>
   </fmt:bundle>
</html>
