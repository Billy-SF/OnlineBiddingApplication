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

<title>Edit</title></head>
<body>
	<form action="editServlet" method="POST"> 
			<label for="firstname">First Name:</label>
			<input type="text" class="form-control input-sm" id="firstname" value="<%=session.getAttribute("firstname")%>" name="firstname">
		    <label for="lastname">Last Name:</label>
			<input type="text" class="form-control input-sm" id="lastname"  value="<%=session.getAttribute("lastname")%>" name="lastname">
			<label for="username">User Name:</label>
			<input type="text" class="form-control input-sm" id="username" value="<%=session.getAttribute("username")%>" name="username">
			<label for="password">Password:</label>
			<input type="password" class="form-control input-sm" id="password" value="<%=session.getAttribute("password")%>" name="password">
			<label for="email">Email Address:</label>
			<input type="text" class="form-control input-sm" id="email" value="<%=session.getAttribute("email")%>" name="email">
			<button type="submit" class="btn btn-primary" id="edit.submit" name="edit.submit">Submit</button>
	</form>
</body>
</html>