<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>
      Register Account
    </title>
    <!-- Bootstrap -->
       
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
    

 
	<link href="assets/css/login-register.css" rel="stylesheet" />

	
	
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
	  var firstName = document.forms["registrationForm"]["firstName"].value;
	  var lastName = document.forms["registrationForm"]["lastName"].value;
	  var userName = document.forms["registrationForm"]["userName"].value;
	  var password = document.forms["registrationForm"]["password"].value;
	  var email = document.forms["registrationForm"]["email"].value;
	  
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

    <fmt:bundle basename="MessagesBundle">
 <%@include file="header.jsp" %>
 
  <!-- Contact Section -->
    <section class="contact-form-section section">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-50 text-center contact-title-text wow fadeIn" data-wow-delay="0.3s">
            <h2>Register</h2>
          </div>
          <div  class="col-md-7 col-md-offset-1 contact-form contact-info-section center-div">
           <form name="registrationForm" action="registerServlet" onsubmit="return validateForm()" method="POST"> 
              <div class="form-group">
              	<p class="pull-left" style="color:red" id="firstNameValidation"></p>
                <label for="firstName" class="sr-only">First Name</label>
                <input type="text" placeholder="Your First Name" name="firstName" id="firstName" class="form-control contact-control"  required data-error="Please enter your first name">
                <div class="help-block with-errors"></div>
              </div>

              <div class="form-group">
              <p class="pull-left" style="color:red" id="lastNameValidation"></p>
                <label for="lastName" class="sr-only">Last Name</label>
                <input type="text" placeholder="Your Last Name" id="lastName" class="form-control contact-control" name="lastName" required data-error="Please enter your Last Name">
                <div class="help-block with-errors"></div>
              </div>

              <div class="form-group">
                <p class="pull-left" style="color:red" id="userNameValidation"></p>	
                <label for="userName" class="sr-only">Username</label>
                <input type="text" placeholder="Your Username" id="userName" class="form-control contact-control" name="userName" required data-error="Please enter your Username">
                <div class="help-block with-errors"></div>
              </div>

              <div class="form-group">
              	 <p class="pull-left" style="color:red" id="passwordValidation"></p>	
                <label for="password" class="sr-only">Password</label>
                <input type="password" placeholder="Your Password" id="password" class="form-control contact-control" name="password" required data-error="Please enter your password">
                <div class="help-block with-errors"></div>
              </div>

  			<div class="form-group">
  				<c:if test="${message ne null}">
		  	<h3>${message}</h3>
		</c:if>
                <p class="pull-left" style="color:red" id="emailValidation"></p>	
                <label for="email" class="sr-only">Email Address</label>
                <input type="email" placeholder="Your Email" id="msg_subject" id="email" class="form-control contact-control" name="email" required data-error="Please enter your Email">
                <div class="help-block with-errors"></div>
              </div>
              
	
            		<button type="submit" class="btn btn-primary" id="submitbtn" name="submitbtn">Submit</button>
              <div id="msgSubmit" class="h3 text-center hidden"></div>
              <div class="clearfix"></div>
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
      </fmt:bundle>
  </body>
</html>