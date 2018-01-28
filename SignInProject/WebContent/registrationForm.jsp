<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
 <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script> 
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Registration Form</title></head>
<body>
	<form> 
		<div class="form-group">
		    <label for="firstName">First Name:</label>
			<input type="text" class="form-control input-sm" id="firstName" placeholder="Enter first name" name="firstName">
		    <label for="lastName">Last Name:</label>
			<input type="text" class="form-control input-sm" id="lastName"  placeholder="Enter last name" name="lastName">
		</div>	
			<button type="submit" class="btn btn-primary id="submitbtn" name="submitbtn">Submit</button>

	</form>
</body>
</html>