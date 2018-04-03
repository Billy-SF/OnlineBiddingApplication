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
<title>Contact Us</title>
   <meta http-equiv="Content-Type" charset="UTF-8" content="text/html">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   <link rel="stylesheet" href="customStyle.css">

<style>
body {font-family: Arial, Helvetica, sans-serif;}

input[type=text], select, textarea {
    width: 100%;
    padding: 12px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    margin-top: 6px;
    margin-bottom: 16px;
    resize: vertical;
}

input[type=submit] {
    background-color: #4CAF50;
    color: white;
    padding: 12px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type=submit]:hover {
    background-color: #45a049;
}

.container {
    border-radius: 5px;
    background-color: #f2f2f2;
    padding: 20px;
}
</style>

 

</head>


<body>
<div id="grad1">
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <c:url value="index.jsp" var="index"> <c:param name="locale" value="${loc}"/></c:url><a class="navbar-brand" href="${index}"><b><font size="6" color="white"> <fmt:message key="ottawAction"/></font></b> </a>
    </div>
    
    <form class="navbar-form navbar-left" action="searchServlet">
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
      <li><a href="index.jsp"><font size ="4" color="white"><b><fmt:message key="home"/></b></font></a></li>
     <%=session.getAttribute("username") == null ? "" : "<li><a href='auction.jsp'><font color='white'><b>Auction</b></font></a></li>"%>
       <li><a href="displayAuction.jsp"><font  size ="4" color="white"><b><fmt:message key="bids"/></b></font></a></li>
       <c:if test="${role}">
       		<li><a href="usersServlet"><font  size ="4" color="white"><b><fmt:message key="users"/></b></font></a></li>
       </c:if>
      <li><a href="contactUs.jsp"><font size ="4" color="white"><b><fmt:message key="contactUs"/></b></font></a></li>
      <li><a href="#"><font  size ="4" color="white"><b><fmt:message key="help"/></b></font></a></li>
    
    
    <li>
    <c:url value="registrationForm.jsp" var="englishURL"><c:param name="locale" value="en_US"/></c:url>
 	<a href="${englishURL}"><font size ="4" color="white"> <b>English</b></font> </a> </li>
 	
 	  <li>
 	<c:url value="registrationForm.jsp" var="chineseURL"><c:param name="locale" value="zh_CN"/></c:url>
 	 <a href="${chineseURL}"><font size ="4" color="white"><b>&#x4E2D;&#x6587;</b></font></a></li>
 	 
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


<div  class="col-sm-3">
<div> &nbsp;</div>
<div class= "panel panel-danger">
 <div class= "panel-heading" >  <b> <fmt:message key="contactUs"/></b> </div>
  <div class ="panel-body" > 
  



  <form action="/action_page.php">
    <label class ="pull-left" for="fname">First Name</label>
    <input type="text" id="fname" name="firstname" placeholder="Your name..">

    <label class ="pull-left" for="lname">Last Name</label>
    <input type="text" id="lname" name="lastname" placeholder="Your last name..">

    <label class ="pull-left" for="country">Country</label>
    <select id="country" name="country">
 
      <option value="canada">Canada</option>
      <option value="usa">USA</option>
    </select>

    <label class ="pull-left" for="subject">Brief Description</label>
    <textarea id="subject" name="subject" placeholder="Write something.." style="height:200px"></textarea>

    <input type="submit" value="Submit">
  </form>
</div>


</div>	
 </div>	
  </div>
</div>
</div>

<footer class="container-fluid text-center">
  <div class="navbar-header">
      <a href="#"><b><font size="6" color="white">OttawAuction</font></b></a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="#"><font size ="4" color="white"><b>© OttawAuction</b></font></a></li>
   </ul>
     <ul class="nav navbar-nav"> 
      <li><a href="#"><font size ="4" color="white"><b><fmt:message key="faq"/></b></font></a></li>
      <li><a href="#"><font size ="4" color="white"><b><fmt:message key="privacyPolicy"/></b></font></a></li>
   </ul>
</footer>
</div>
</body>
</fmt:bundle>
</html>