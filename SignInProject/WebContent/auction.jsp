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
<title>Registration Form</title>
   <meta http-equiv="Content-Type" charset="UTF-8" content="text/html">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="customStyle.css">
  <script type="text/javascript">
  
 

$( document ).ready(function() { 
	//alert("Helllo!");
	jQuery("#itemNameValidationMessage").hide();
	jQuery("#descriptionValidationMessage").hide();
	jQuery("#bidStartValidationMessage").hide();
	jQuery("#bidEndValidationMessage").hide();
	jQuery("#datesValidationMessage").hide();
	jQuery("#initialPriceValidationMessage").hide();
});

function validateAuctionForm(){
	var error = true;
	var itemName = document.forms["auction"]["itemName"].value;
	var description = document.forms["auction"]["description"].value;
	var bidStart = document.forms["auction"]["bidStart"].value;
	var bidEnd = document.forms["auction"]["bidEnd"].value;
	var initialPrice = document.forms["auction"]["initialPrice"].value;
	  
	//alert("In submit" + bidStart + "Hi");

	if (itemName.length == 0) 
	{
		$("#itemNameValidationMessage").slideDown();
		//alert("ItemNnaem"+ itemName.length);
		error = false;
	}
	if (description.length == 0) {
		$("#descriptionValidationMessage").slideDown();
		error = false;
	}
	if (bidStart.length == 0) {
		$("#bidStartValidationMessage").slideDown();
		error = false;
	}
	if (bidEnd.length == 0) {
		$("#bidEndValidationMessage").slideDown();
		error = false;
	}
	if (initialPrice.length == 0) {
		$("#initialPriceValidationMessage").slideDown();
		error = false;
	}
/* 	if () {
		$("#datesValidationMessage").slideDown();
		error = true;
	}		
 */
	return error;
}

function hideErrorMessage(elementId){
	//alert (elementId);
	//var id = "#" + elementId; 
	//alert("Here" + elementId);
	
	document.getElementById(elementId).next("div").style.background = "yellow";
	
	return function() { // the function to return
				alert("showing "+ elementId);
				document.getElementById(elementId).slideUp();
				$(elementId).slideUp(); // use the variable from the parameter
			};
	
	//$(paramId).slideUp();
	
}

</script>
  
<title>Create Auction</title>
</head>
<body style="background-color:#ccff99">



<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <c:url value="index.jsp" var="index"> <c:param name="locale" value="${loc}"/></c:url><a class="navbar-brand" href="${index}"><b><font size="6" color="white"> <fmt:message key="ottawAction"/></font></b> </a>
    </div>
    <form class="navbar-form navbar-left" action="/action_page.php">
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
      <li> <c:url value="index.jsp" var="index"> <c:param name="locale" value="${loc}"/></c:url><a href="${index}"> <fmt:message key="home"/> </a></li>
      <li><a href="#"><font color="white"><b><fmt:message key="contactUs"/></b></font></a></li>
      <li><a href="#"><font color="white"><b><fmt:message key="help"/></b></font></a></li>
      
       <li>
    <c:url value="registrationForm.jsp" var="englishURL"><c:param name="locale" value="en_US"/></c:url>
 	<a href="${englishURL}"> English </a> </li>
 	
 	  <li>
 	<c:url value="registrationForm.jsp" var="chineseURL"><c:param name="locale" value="zh_CN"/></c:url>
 	 <a href="${chineseURL}">&#x4E2D;&#x6587;</a></li>
 	 
    </ul>
    
   <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">
            <span class="glyphicon glyphicon-log-out"></span><font color="white"><b> <fmt:message key="logout"/></b></font>
            <!-- <span class="caret"></span> -->
          </a>
          <ul class="dropdown-menu">
            <li><a href="#"><span class="glyphicon glyphicon-edit"></span> <fmt:message key="edit"/></a></li>
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

<div class="col-sm-3">
<div> &nbsp;</div>
<div class= "panel panel-danger">
 <div class= "panel-heading" >  <b> <fmt:message key="auctionForm"/></b> </div>
  <div class ="panel-body"> 
	<form action="auctionServlet" method="POST" enctype="multipart/form-data" name="auction" onsubmit="return validateAuctionForm()"> 
		<div class="form-group">
		    <label class ="pull-left" for="itemName">Item Name:</label>
			<input type="text" class="form-control input-sm" id="itemName"  placeholder="Please Enter item name" name="itemName" onfocus="hideErrorMessage(this.id)">
			<div id="itemNameValidationMessage" Style="color: red">Item Name is required</div>
		</div>
		
		<div class="form-group">
		    <label class ="pull-left" for="description">Description:</label>
			<input type="text" class="form-control input-sm" id="description"  placeholder="Please Enter Description"  name="description">
			<div id="descriptionValidationMessage" Style="color: red">Description is required</div>
	    </div>
	    
	    <div class="form-group">		
			<label class ="pull-left" for="bidStart">Bidding Starts at :</label>
			<input type="datetime-local" class="form-control input-sm" id="bidStart" name="bidStart">
			<div id="bidStartValidationMessage" Style="color: red">Bidding Start Date and Time are required</div>
		</div>
			
		<div class="form-group">	
			<label class ="pull-left" for="bidEnd">Bidding Ends at:</label>
			<input type="datetime-local" class="form-control input-sm" id="bidEnd" name="bidEnd">
			<div id="bidEndValidationMessage" Style="color: red">Bidding End Date and Time are required</div>
			<div id="datesValidationMessage" Style="color: red">Bidding Start Time should be before End Time</div>
		</div>
		
		<div class="form-group">	
			<label class ="pull-left" for="initialPrice">Initial Price</label>
			<input type="text" class="form-control input-sm" id="initialPrice" placeholder="Please Enter Initial Price" name="initialPrice" >
			<div id="initialPriceValidationMessage" Style="color: red">Initial Price is required</div>    
		</div>	
		
		<div class="form-group">	
			<label class ="pull-left" for="image">Image:</label>
			<input type="file" class="form-control input-sm" id="image" placeholder="Please Upload image of the item" name="image" accept="image/*">    
		</div>	

			<button type="submit" class="btn btn-primary" id="submitAuctionbtn" name="submitAuctionbtn">Submit Auction</button>

	</form>
	
	</div>
</div>	
 </div>	
 </div>
</div>
 
 <footer class="container-fluid text-center">
  <div class="navbar-header">
      <a class="navbar-brand" href="#"><b><font size="6" color="white">OttawAuction</font></b></a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="edit.jsp"><font color="white"><b>© OttawAuction</b></font></a></li>
   </ul>
     <ul class="nav navbar-nav"> 
      <li><a href="#"><font color="white"><b><fmt:message key="feedback"/></b></font></a></li>
      <li><a href="#"><font color="white"><b><fmt:message key="privacyPolicy"/></b></font></a></li>
   </ul>
</footer>

</body>
</fmt:bundle>
</html>

