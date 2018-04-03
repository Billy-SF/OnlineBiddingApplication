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
<title>FAQ</title>
   <meta http-equiv="Content-Type" charset="UTF-8" content="text/html">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   <link rel="stylesheet" href="customStyle.css">
 

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


<div  class="col-sm-10">
<div> &nbsp;</div>
<div class= "panel panel-danger">
 <div class= "panel-heading" >  <b> <fmt:message key="faq"/></b> </div>
  <div class ="panel-body" > 
  
 <p align="left"><b><font size="4">Login And Registration</font></b></p> 
<p align="left"><b>How do I register to buy?</b></p>

<p align="left">To become a buyer, click "Register" on the Home button. If you choose not to complete your user profile during your initial registration, 
you will not be able to bid, acquire a work, or apply to become a seller until you finish the registration process. 
You can complete this process at any time by filling in your user profile under create Auctions.</p>

<p align="left"><b>How do I sign up as a seller?</b></p>

<p align="left">Once you register, you could both sell or buy items.</p>

<p align="left"><b>Why is my credit card being declined during registration?</b></p>

<p align="left">Credit card validation is done by a third-party service. Occasionally credit cards are declined by the card issuer. In this case, please try another card or call your credit card issuer.</p>

<p align="left"><b>Who are the sellers on ottawAuction?</b></p>

<p align="left"> Anyone who sign up for ottawAuction can create Auctions, bid and buy items.</p>

<p align="left"><b>Is there a fee to get started?</b></p>

<p align="left"> There is no fee to register as a buyer or to apply as a seller. </p>

<p align="left"><b>How do I contact ottawAuction ?</b></p>

<p align="left">Please contact us via email, or call 613-000-000. When contacting us, please provide as many details as possible, such as dates,and username, to help us answer your question.</p>


<p align="left"><b><font size="4">Browsing and Searching</font></b></p>

<p align="left"><b>How do I search?</b></p>

<p align="left">To search on ottawAuction, you may enter keywords into the search bar, or you can browse by category, by selecting options from the dropdown menu, located at the top of any page.

<p align="left"><b>Can I search by auction ID?</b></p>

<p align="left">If you know the unique auction ID of an item, go to the Advanced Search page and use the "Search Bar" on top navigation bar.</p>

<p align="left"><b>What are the options for customizing my search?</b></p>

<p align="left">To customize your search, select the "Category" in the top navigation on every page, and choose from any one of the options in the dropdown menu.</p>
 
<p align="left"><b><font size="4">Bidding And Buying</font></b></p>
<p align="left"><b>How does bidding work?</b></p>

<p align="left">All lots offered on ottawAuction have a reserve price. The reserve price must be met in order for the work to be sold.</p>

<p align="left">Enter an amount that is greater than or equal to the starting or current bid.</p>

<p align="left">You may place a bid at the next increment, or place a maximum bid. If your maximum bid is greater than or equal to the reserve price, we will automatically bid on your behalf up to the reserve price. If there are competing bidders, we will continue to bid by increments up to your maximum bid, but will never exceed your maximum bid amount. </p>
	
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