<!DOCTYPE html>

<html lang="en">
<head>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="loc" value="en_US"/>
<c:if test="${!(empty param.locale)}">
  <c:set var="loc" value="${param.locale}"/>
</c:if>
<fmt:setLocale value="${param.locale}" />

<meta charset="utf-8">
    <!-- Viewport Meta Tag -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>
      Register Account
    </title>
    <!-- Bootstrap -->
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

 <%@include file="header.jsp" %>
 
  <!-- Contact Section -->
    <section class="contact-form-section section">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-50 text-center contact-title-text wow fadeIn" data-wow-delay="0.3s">
            <h2>Register</h2>
          </div>
          <div  class="col-md-7 col-md-offset-1 contact-form contact-info-section center-div">
          	<form name="verifyForm" action="verifyEmailServlet" onsubmit="return validateForm()" method="POST"> 
		<div class="form-group">
			<p class="pull-left" style="color:red"id="codeValidation"></p>
		    <label for="verificationCode">Verify Code</label>
			<input type="text" class="form-control input-md" id="code" placeholder="Enter Verification Code" name="code">
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
</html>