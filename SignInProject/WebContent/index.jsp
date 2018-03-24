<%@ page pageEncoding="UTF-8" %>

<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<%-- <jsp:include page="<%= \"topMenu.jsp\" %>" /> --%>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="loc" value="en_US"/>
<c:if test="${!(empty param.locale)}">
  <c:set var="loc" value="${param.locale}"/>
</c:if>
<fmt:setLocale value="${loc}" />
<fmt:bundle basename="MessagesBundle">

<title>OttawaAuction</title>

  <meta http-equiv="Content-Type" charset="UTF-8" content="text/html">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="customStyle.css">

</head>
<body style="background-color:#59b300">

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
      <c:if test="${null != sessionScope.username}">
      <li><a href='auction.jsp'><font color='white'><b><fmt:message key="auction"/></b></font></a></li>
      </c:if>
       <li><a href="displayAuction.jsp"><font  size ="4" color="white"><b><fmt:message key="bids"/></b></font></a></li>
       <c:if test="${role}">
       		<li><a href="usersServlet"><font  size ="4" color="white"><b><fmt:message key="users"/></b></font></a></li>
       </c:if>
      <li><a href="#"><font size ="4" color="white"><b><fmt:message key="contactUs"/></b></font></a></li>
      <li><a href="#"><font  size ="4" color="white"><b><fmt:message key="help"/></b></font></a></li>
    
    
    <li>
    <c:url value="index.jsp" var="englishURL"><c:param name="locale" value="en_US"/></c:url>
 	<a href="${englishURL}"><font size ="4" color="white"> <b>English</b></font> </a> </li>
 	
 	  <li>
 	<c:url value="index.jsp" var="chineseURL"><c:param name="locale" value="zh_CN"/></c:url>
 	 <a href="${chineseURL}"><font size ="4" color="white"><b>&#x4E2D;&#x6587;</b></font></a></li>
 	 </ul>
 	  
 	  
    
    
<!--     toggle button for  -->
     <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">
           <span class="glyphicon glyphicon-user" style="color:white"></span><font color="white"><b> <%=session.getAttribute("username") != null ? session.getAttribute("username") : ""%></b></font>
            <!-- <span class="caret"></span> -->
          </a>
      
            <c:if test="${null != sessionScope.username}">
             <ul class="dropdown-menu">
               <li><a href="edit.jsp"><span class="glyphicon glyphicon-edit"></span> <fmt:message key="edit"/></a></li>
               <li><a href="Logout.jsp"><span class="glyphicon glyphicon-log-out"></span> <fmt:message key="logout"/></a></li>
            </ul> 
            </c:if>
       
      </li>
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
 
 <div class="col-sm-8 text-left"> 
  
  <div  id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
     <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">

      <div style= "height:640px" class="item active">
        <img src="Real_Time_Bidding.png" style="width:100%;">
      
      </div>

      <div style= "height:640px"  class="item">
        <img src="chicago.png" style="width:100%;">
        
      </div>
    
      <div style= "height:640px" class="item">
        <img src="tabs.png" style="width:100%;">
        
      </div>
      
      <div style= "height:640px" class="item">
        <img src="random.png" style="width:100%;">
        
      </div>
  
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
  
</div>

<div class="col-sm-2 sidenav">
  <font size= "6" color=white><b><fmt:message key="WelcomeMessage"/></b></font>
<c:if test="${null == sessionScope.username}">
  <p><button onclick="document.getElementById('id01').style.display='block'" style="width:auto;"><b><font size ="6" ><fmt:message key="login"/></font></b></button></p>
<!-- <center><p class="message">Not registered? <a href="registrationForm.jsp"><b><font size ="6" >Register Now!</a></center> -->
<p class="message"><font size="6" color="white"><b><fmt:message key="notRegistered"/></b></font>  <c:url value="registrationForm.jsp" var="register"><c:param name="locale" value="${loc}"/></c:url>
<p><a href="${register}"><b><font size ="6" > <fmt:message key="registerNow"/> </font></b></a></p>

</c:if>

<c:if test="${null != sessionScope.username}">
<p><font size="4" color="white"><b>${sessionScope.username}</b></font></p>
</c:if>

<div id="id01" class="modal">
  
  <form class="modal-content animate" action="loginServlet" method="post">
    <div class="imgcontainer">
      <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
      <img src="img_avatar2.png" alt="Avatar" class="avatar">
    </div>

    <div class="container">
      <label  for="username"><b><fmt:message key="username"/></b></label><br />
      <input type="text" placeholder="<fmt:message key="enterUsername"/>" name="username" required>

     <br /> <label  for="password"><b><fmt:message key="password"/></b></label><br />
      <input type="password" placeholder="<fmt:message key="enterPassword"/>" name="password" required>
        
      <button type="submit"><fmt:message key="login"/></button>
       <br/>
      <label>
      
        <input type="checkbox" checked="checked" name="remember"> <fmt:message key="rememberMe"/>
      </label>
    </div>

    <div class="container" style="background-color:#ccffcc">
      <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn"><fmt:message key="cancel"/></button>      
      <span class="message"><fmt:message key="notRegistered"/><a href="registrationForm.jsp"><fmt:message key="registerNow"/></a></span>
    </div>
  </form>
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
      <li><a href="#"><font size ="4" color="white"><b><fmt:message key="feedback"/></b></font></a></li>
      <li><a href="#"><font size ="4" color="white"><b><fmt:message key="privacyPolicy"/></b></font></a></li>
   </ul>
</footer>

<script>
// Get the modal
var modal = document.getElementById('id01');
// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>
      

    
</fmt:bundle>

</div>
</body>
</html>