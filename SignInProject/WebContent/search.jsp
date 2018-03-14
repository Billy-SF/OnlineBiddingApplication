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

	<meta http-equiv="Content-Type" charset="UTF-8" content="text/html">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet"
		href="//cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
	<script src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" href="customStyle.css"> 



	</head>
	<body>

		<body style="background-color:#f4f0f0">
		<!--  <c:forEach var = "i" begin = "1" end = "5">
         Item <c:out value = "${i}"/><p>
      </c:forEach>-->
	<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <c:url value="index.jsp" var="index"> <c:param name="locale" value="${loc}"/></c:url><a class="navbar-brand" href="${index}"><b><font size="6" color="white"> <fmt:message key="ottawAction"/></font></b> </a>
    </div>
    
    <form class="navbar-form navbar-left" action="searchServlet" method="get">
    <input type="hidden" name="locale" value="${locale}">
      <div class="input-group">
						<input type="text" class="form-control"
							placeholder="<fmt:message key="search"/>" name="search">
						<div class="input-group-btn">
							<button class="btn btn-default" type="submit">
								<i class="glyphicon glyphicon-search"></i>
							</button>
						</div>
					</div>
				</form>
	<ul class="nav navbar-nav">
      <li><a href="index.jsp"><font size ="4" color="white"><b><fmt:message key="home"/></b></font></a></li>
     <%=session.getAttribute("username") == null ? "" : "<li><a href='auction.jsp'><font size=4 color='white'><b>Auction</b></font></a></li>"%>
       <li><a href="displayAuction.jsp"><font  size ="4" color="white"><b><fmt:message key="bids"/></b></font></a></li>
      <li><a href="#"><font size ="4" color="white"><b><fmt:message key="contactUs"/></b></font></a></li>
      <li><a href="#"><font  size ="4" color="white"><b><fmt:message key="help"/></b></font></a></li>
    
    
    <li>
    <c:url value="searchServlet" var="englishURL">
    <c:param name="search" value="${keyword}"/>
    <c:param name="locale" value="en_US"/></c:url>
 	<a href="${englishURL}"><font size ="4" color="white"> <b>English</b></font> </a> </li>
 	
 	  <li>
 	<c:url value="searchServlet" var="chineseURL">
 	<c:param name="search" value="${keyword}"/>
 	<c:param name="locale" value="zh_CN"/>
 	</c:url>
 	 <a href="${chineseURL}"><font size ="4" color="white"><b>&#x4E2D;&#x6587;</b></font></a></li>
 	 </ul>
    
   <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">
            <span class="glyphicon glyphicon-log-out"></span><font color="white"><b> <fmt:message key="logout"/></b></font>
            <!-- <span class="caret"></span> -->
          </a>
          <ul class="dropdown-menu">
            <li><a href="edit.jsp"><span class="glyphicon glyphicon-edit"></span> <fmt:message key="edit"/></a></li>
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
					<br>

					<c:if test = "${!keyword.isEmpty()}">
					<h3
						class="a-size-medium a-spacing-base a-spacing-top-small a-color-tertiary a-text-normal">Search
						for: ${keyword}</h3>
					</c:if>
					<c:if test = "${keyword.isEmpty()}">
					<h3
						class="a-size-medium a-spacing-base a-spacing-top-small a-color-tertiary a-text-normal">Search
						for: all items</h3>
					</c:if>
						
						<c:if test = "${productTotal <=0}">
<p>Sorry no items are found for ${keyword}</p>

</c:if>
<c:if test = "${productTotal > 0}">
					<form class="form-inline" action="sortServlet" method="get">
						<input type="hidden" name="search" value="${keyword}" />
						<div class="form-group">
							<label for="email">Sort by:</label> <select name="sortby">
								<option value="name"
									<c:if test="${sortMethod == 'name'}">selected</c:if>>Name</option>
								<option value="lowestprice"
									<c:if test="${sortMethod == 'lowestprice'}">selected</c:if>>Lowest
									Price</option>

								<option value="highestprice"
									<c:if test="${sortMethod == 'highestprice'}">selected</c:if>>
									Highest Price</option>

								<option value="mostbids"
									<c:if test="${sortMethod == 'mostbids'}">selected</c:if>>Most
									Bids</option>
								<option value="leastbids"
									<c:if test="${sortMethod == 'leastbids'}">selected</c:if>>Least
									Bids</option>
								<option value="newestauction"
									<c:if test="${sortMethod == 'newestauction'}">selected</c:if>>Newest
									auction</option>
								<option value="oldestauction"
									<c:if test="${sortMethod == 'oldestauction'}">selected</c:if>>Oldest
									auction</option>
							</select>
						</div>
						<div class="form-group">
							<button type="submit" class="btn btn-default btn-sm">Go</button>
						</div>
					</form>





					<hr>
					<p>${productTotal} items for ${keyword}</p>
					<hr>

					<table id="productitems" class="stripe">
						<thead>
							<tr>
								<th></th>
								<th>Item</th>
								<th>Status</th>
								<th>Detail</th>
								<th>Current Bid</th>
							    <th>Date created</th>
								
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${productItems}" var="productItem">
								<tr>
									<td><div class="gallery">
										<c:if test="${not empty productItem.getAuction().getId()}">	
										<c:set var = "auctionId" scope = "session" value = "${productItem.getAuction().getId()}"/>
										<a 
												href="bidPageDisplayServlet?productitemid=${productItem.productId}">
										</c:if>
										
														<img src="chrome-extension://dhdebllgjlepmfjeignhkcmdklalodmd/${productItem.image}"
														alt="${productItem.itemName}" width="300" height="200"></img>
									
									<c:if test="${not empty productItem.getAuction().getId()}">	</a> </c:if>
											
										
										</div></td>
												
									<td><b>${productItem.itemName}</b></td>
									<c:if test="${not empty productItem.getAuction().getId()}">	
									<c:if test="${productItem.getAuction().getBidstate() =='0'}">	
									<td><b>Bidding Ended</b></td>
									</c:if>
									<c:if test="${productItem.getAuction().getBidstate() =='1'}">
									<td><b>Bidding</b></td>
									</c:if>
									<c:if test="${productItem.getAuction().getBidstate() =='2'}">
									<td><b>Bidding Not Started</b></td>
									</c:if>
									</c:if>
									<c:if test="${empty productItem.getAuction().getId()}">	
									<td><b>No Bidding</b></td>
									</c:if>
							
									<td><b>${productItem.description}</b></td>
									<td><b>$${productItem.highestPrice}</b></td>
									<td><b>${productItem.getAuction().getDateCreated()}</b></td>
									
								</tr>
							</c:forEach>
						</tbody>
					</table>

					<script>
						$(document).ready(
								function() {
									$('#productitems').DataTable(
											{
												"searching" : false,
												"lengthMenu" : [
														[ 5, 10, 30, -1 ],
														[ 5, 10, 30, "All" ] ],
												"ordering" : false
											});
								});
					</script>
					<hr>
					</c:if>
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


</body>
</html>
