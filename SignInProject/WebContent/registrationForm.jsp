<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<c:set var="loc" value="en_US"/>
<c:if test="${!(empty param.locale)}">
  <c:set var="loc" value="${param.locale}"/>
</c:if>
<fmt:setLocale value="${param.locale}" />
 
 
<fmt:bundle basename="MessagesBundle">

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
	<form action="registerServlet" method="POST"> 
		<div class="form-group">

		    <label for="firstName"><fmt:message key="firstName"/>:</label>
			<input type="text" class="form-control input-sm" id="firstName" placeholder="<fmt:message key="enterFirstName"/>" name="firstName">
		    <label for="lastName"><fmt:message key="lastName"/>:</label>
			<input type="text" class="form-control input-sm" id="lastName"  placeholder="<fmt:message key="enterLastName"/>" name="lastName">
			<label for="username"><fmt:message key="username"/>:</label>
			<input type="text" class="form-control input-sm" id="userName" placeholder="<fmt:message key="enterUsername"/>" name="userName">
			<label for="password"><fmt:message key="password"/>:</label>
			<input type="password" class="form-control input-sm" id="password" placeholder="<fmt:message key="enterPassword"/>" name="password">
			<label for="emailAddress"><fmt:message key="email"/>:</label>
			<input type="text" class="form-control input-sm" id="emailAddress" placeholder="<fmt:message key="enterEmail"/>" name="emailAddress">
		</div>	

			<button type="submit" class="btn btn-primary id="submitbtn" name="submitbtn"><fmt:message key="submit"/></button>
	</form>
</body>
</html>
</fmt:bundle>