<<<<<<< HEAD
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <jsp:include page="<%= \"topMenu.jsp\" %>" />
=======
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
>>>>>>> branch 'Chi's-branch' of https://github.com/Biller89/OnlineBiddingApplication
<html>
<head>
<title>Select Language</title>
</head>
<body>
<table>
<tr>
<td colspan=4 bgcolor="black">
<br/>
<center><font face="arial" size=+2 color="white">
    <b><i>Select</i> your prefered language to Login Page.</b></font>
    </center>
<br/>
 
</td>
</tr>
 <tr><td>
 
 <c:url value="login.jsp" var="englishURL">
   <c:param name="locale" value="en_US"/>
 </c:url>
 
 <a href="${englishURL}"> English </a>
</td>


<<<<<<< HEAD
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</head>
<body> 
<form action="loginServlet" class="login-form" method="post">
	<div class ="form-group row">
		<div class="col-3">
         	<input type="text" name="username" class="form-control form-control-sm" required="required" placeholder="username" />
         	<input type="password" name="password"  class="form-control form-control-sm" required="required" placeholder ="password"/>
         </div>
	</div>
	 <button type="login" class="btn btn-primary" id="loginbtn" name="login">Login</button>
     <p class="message">Not registered? <a href="registrationForm.jsp">Register Now!</a>
</form>
</body>
</html>
=======
<td>
  <c:url value="login.jsp" var="chineseURL">
     <c:param name="locale" value="zh_CN"/>
  </c:url>
 
  <a href="${chineseURL}"> Chinese </a>
</td>
</tr>
</table>
</body>
</html>
>>>>>>> branch 'Chi's-branch' of https://github.com/Biller89/OnlineBiddingApplication
