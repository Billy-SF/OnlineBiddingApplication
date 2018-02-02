 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 
 <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script> 

<form action="loginServlet" class="login-form" method="post">
	<div class ="form-group row">
		<div class="col-3">
         	<input type="text" name="username" class="form-control form-control-sm" required="required" placeholder="username" />
         	<input type="password" name="userpass"  class="form-control form-control-sm" required="required" placeholder ="password"/>
         </div>
	</div>
	 <button type="login" class="btn btn-primary" id="loginbtn" name="login">Login</button>
     <p class="message">Not registered? <a href="#">Register Now!</a>
</form>
