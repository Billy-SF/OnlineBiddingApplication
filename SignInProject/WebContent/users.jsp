<%@ page pageEncoding="UTF-8"%> 
  
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<%-- <jsp:include page="<%= \"topMenu.jsp\" %>" /> --%>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="loc" value="en_US" />
<c:if test="${!(empty param.locale)}">
	<c:set var="loc" value="${param.locale}" />
</c:if>
<fmt:setLocale value="${loc}" />
<fmt:bundle basename="MessagesBundle">

	<title>OttawaAuction</title>
<head>
	<meta http-equiv="Content-Type" charset="UTF-8" content="text/html">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="//cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
	<script src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<link rel="stylesheet" href="customStyle.css"> 
</head>
<body>
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
      <li><a href='auction.jsp'><font size="4" color='white'><b><fmt:message key="auction"/></b></font></a></li>
      </c:if>
       <li><a href="displayAuctionServlet"><font  size ="4" color="white"><b><fmt:message key="bids"/></b></font></a></li>
       <c:if test="${role}">
       		<li><a href="usersServlet"><font  size ="4" color="white"><b><fmt:message key="users"/></b></font></a></li>
       </c:if>
       <c:if test="${role}">
     	 	 <li><a href="closedBidsServlet"><font  size ="4" color="white"><b><fmt:message key="closedBids"/></b></font></a></li>
       </c:if>
      <li><a href="#"><font size ="4" color="white"><b><fmt:message key="contactUs"/></b></font></a></li>
      <li><a href="#"><font  size ="4" color="white"><b><fmt:message key="help"/></b></font></a></li>
      <li>
    	<c:url value="users.jsp" var="englishURL"><c:param name="locale" value="en_US"/></c:url>
 		<a href="${englishURL}"><font size ="4" color="white"> <b>English</b></font> </a> 
 	  </li>
 	  <li>
 		<c:url value="users.jsp" var="chineseURL"><c:param name="locale" value="zh_CN"/></c:url>
 	 	<a href="${chineseURL}"><font size ="4" color="white"><b>&#x4E2D;&#x6587;</b></font></a>
 	 	</li>
 	 </ul>
 	  
 	  
    
    
<!--     toggle button for  -->
  	<c:if test="${null != sessionScope.username}">
					<!--     toggle button for  -->
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#"> <span
								class="glyphicon glyphicon-user" style="color: white"></span><font
								color="white"><b> <%=session.getAttribute("username") != null ? session.getAttribute("username") : ""%></b></font>
								<!-- <span class="caret"></span> -->
						</a>
							<ul class="dropdown-menu">
								<li><a href="edit.jsp"><span
										class="glyphicon glyphicon-edit"></span> <fmt:message
											key="edit" /></a></li>
								<li><a href="Logout.jsp"><span
										class="glyphicon glyphicon-log-out"></span> <fmt:message
											key="logout" /></a></li>
							</ul></li>
					</ul>
				</c:if>    
    </div>
      
</nav>



<div class="container-fluid text-center">    
  <div class="row content">
    <div class="col-sm-2 sidenav">
      <p><a href="#"><img src="Real_Time_Bidding.png" height=100% width=100%></a></p>
      <p><a href="#"><img src="chicago.png" height=100% width=100%></a></p>
      <p><a href="#"><img src="bids.png" height=100% width=100%></a></p>
    </div>
 
	 <!-- middle part of the page -->
	 <div class="col-sm-10 text-left"> 

		<div class="text-center">
			<p><h3><b>Users List</b></h3></p>
		</div>
		<div>&nbsp;</div>
	  
		<table id="users" class="stripe table-striped" style="width:100%">
			<thead>
				<tr>
					<th>User Id</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Username</th>
				    <th>Email Address</th>
				    <th>Role</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${users}" var="user">
					<tr>
						<td>${user.userId}</td>
						<td>${user.firstname}</td>
						<td>${user.lastname}</td>
						<td>${user.username}</td>
						<td>${user.email}</td>
						<c:choose>
							<c:when test="${user.role == true}">
								<td>Administrator</td>
							</c:when>
							<c:otherwise>
								<td>Client</td>
							</c:otherwise>
						</c:choose>
						<td>
							<form  action="deleteAuctionServlet">
								<a href="deleteUserServlet?userId=${user.userId}" class="glyphicon glyphicon-remove" type="submit"></a>
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	<script>

		$(document).ready(function() {
			$('#users').DataTable({
				searching : false,
				lengthMenu : [ [ 10, 15, 30, -1 ], [ 10, 15, 30, "All" ] ],
				ordering : true,
				bServerSide : false
			});
		});
	</script>
	  
	  
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

</body>
</fmt:bundle>
</html>