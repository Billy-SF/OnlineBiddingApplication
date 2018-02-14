<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Confirmation Page</title>
</head>
<body>
Please verify your email and enter the code to confirm your account!
<form action="verifyEmailServlet" method="POST"> 
		<div class="form-group">
		    <label for="verificationCode">Verification code:</label>
			<input type="text" class="form-control input-sm" id="code" placeholder="Enter verification code" name="code">
		</div>
			<button type="submit" class="btn btn-primary" id="submitbtn" name="submitbtn">Submit</button>
</form>
</body>
</html>