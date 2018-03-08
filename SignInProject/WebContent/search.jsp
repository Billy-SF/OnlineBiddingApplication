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


	<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}

/* Full-width input fields */
input[type=text], input[type=password] {
	width: 100%;
	padding: 14px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

/* Set a style for all buttons */
button {
	background-color: #4CAF50;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 100%;
}

button:hover {
	opacity: 0.8;
}

/* Extra styles for the cancel button */
.cancelbtn {
	width: auto;
	padding: 10px 18px;
	background-color: #f44336;
}

/* Center the image and position the close button */
.imgcontainer {
	text-align: center;
	margin: 24px 0 12px 0;
	position: relative;
}

img.avatar {
	width: 40%;
	border-radius: 50%;
}

.container {
	padding: 16px;
}

span.psw {
	float: right;
	padding-top: 16px;
}

/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 100; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
	padding-top: 60px;
}

/* Modal Content/Box */
.modal-content {
	background-color: #ccff99;
	margin: 5% auto 15% auto;
	/* 5% from the top, 15% from the bottom and centered */
	border: 1px solid #888;
	width: 90%; /* Could be more or less, depending on screen size */
}

/* The Close Button (x) */
.close {
	position: absolute;
	right: 25px;
	top: 0;
	color: #000;
	font-size: 35px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: red;
	cursor: pointer;
}

/* Add Zoom Animation */
.animate {
	-webkit-animation: animatezoom 0.6s;
	animation: animatezoom 0.6s
}

@
-webkit-keyframes animatezoom {
	from {-webkit-transform: scale(0)
}

to {
	-webkit-transform: scale(1)
}

}
@
keyframes animatezoom {
	from {transform: scale(0)
}

to {
	transform: scale(1)
}

}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
	span.psw {
		display: block;
		float: none;
	}
	.cancelbtn {
		width: 100%;
	}
}
/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	background-color: #cc0000;
	margin-bottom: 0;
	border-radius: 0;
}

/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
.row.content {
	height: 450px
}

/* Set gray background color and 100% height */
.sidenav {
	padding-top: 20px;
	background-color: #990033;
	height: 110%;
}

.sidenavDiv {
	height: 95%;
	width: 95%;
	position: relative;
	z-index: 1;
	top: 0;
	left: 0;
	background-color: #D8D7D7;
	overflow-x: hidden;
	padding-top: 20px;
	border-radius: 10px;
}

.sidenavDiv a {
	padding: 6px 8px 6px 16px;
	text-decoration: none;
	font-size: 15px;
	color: #818181;
	display: block;
}

.sidenavDiv a:hover {
	color: #f1f1f1;
}

.main {
	margin-left: 160px; /* Same as the width of the sidenav */
	font-size: 28px; /* Increased text to enable scrolling */
	padding: 0px 10px;
}

@media screen and (max-height: 450px) {
	.sidenav {
		padding-top: 15px;
	}
	.sidenav a {
		font-size: 18px;
	}
}
/* Set black background color, white text and some padding */
footer {
	background-color: #cc0000;
	color: white;
	padding: 15px;
}

/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
		height: auto;
	}
}

div.gallery {
	margin: 5px;
	border: 1px solid #ccc;
	float: left;
	width: 180px;
}

div.gallery:hover {
	border: 1px solid #777;
}

div.gallery img {
	width: 100%;
	height: auto;
}

div.desc {
	padding: 15px;
	text-align: center;
}
</style>
	</head>
	<body>

		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header">
					<c:url value="index.jsp" var="index">
						<c:param name="locale" value="${loc}" />
					</c:url>
					<a class="navbar-brand" href="${index}"><b><font size="6"
							color="white"> <fmt:message key="ottawAction" /></font></b> </a>
				</div>

				<ul class="nav navbar-nav">
					<li><a href="#"><font color="white"><b><fmt:message
										key="home" /></b></font></a></li>
					<li><a href="#"><font color="white"><b><fmt:message
										key="contactUs" /></b></font></a></li>
					<li><a href="#"><font color="white"><b><fmt:message
										key="help" /></b></font></a></li>


					<li><c:url value="index.jsp" var="englishURL">
							<c:param name="locale" value="en_US" />
						</c:url> <a href="${englishURL}"> English </a></li>

					<li><c:url value="index.jsp" var="chineseURL">
							<c:param name="locale" value="zh_CN" />
						</c:url> <a href="${chineseURL}">&#x4E2D;&#x6587;</a></li>
				</ul>
				<form class="navbar-form navbar-left" action="searchServlet">
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
						</ul>
				</ul>
			</div>

		</nav>



		<div class="container-fluid text-center">

			<div class="row content">
				<div class="col-sm-2 sidenav">
					<div class="sidenavDiv">
						<h3
							class="a-size-medium a-spacing-base a-spacing-top-small a-color-tertiary a-text-normal">Category</h3>
						<a href="#services">Services</a> <a href="#contact">Coins and
							Bullion</a> <a href="#clients">Computers</a> <a href="#contact">Electronics</a>
						<a href="#clients">Fashion</a> <a href="#contact">Jewelry</a> <a
							href="#contact">Watches</a>
					</div>
				</div>

				<div class="col-sm-8 text-left">

					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
						<li class="breadcrumb-item"><a href="search.jsp">Search</a></li>

					</ol>
					<br>


					<h3
						class="a-size-medium a-spacing-base a-spacing-top-small a-color-tertiary a-text-normal">Search
						for: ${keyword}</h3>

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
					${productTotal} items for ${keyword}
					<hr>

					<table id="productitems" class="stripe">
						<thead>
							<tr>
								<th></th>
								<th>Item</th>
								<th>Detail</th>
								<th>Current Bid</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${productItems}" var="productItem">
								<tr>
									<td><div class="gallery">
											<a target="_blank"
												href="bidServlet?productItemId=${productItem.productId}">
												<img src="${productItem.image}" alt="Fjords" width="300"
												height="200"></img>
											</a>
										</div></td>
									<td><b>${productItem.itemName}</b></td>
									<td><b>${productItem.description}</b></td>
									<td><b>$${productItem.highestPrice}</b></td>
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
				</div>

			</div>

		</div>



		<footer class="container-fluid text-center">




			<div class="navbar-header">
				<a href="#"><b><font size="6" color="white">OttawAuction</font></b></a>
			</div>
			<ul class="nav navbar-nav">
				<li><a href="#"><font color="white"><b>
								OttawAuction</b></font></a></li>
			</ul>
			<ul class="nav navbar-nav">
				<li><a href="#"><font color="white"><b><fmt:message
									key="feedback" /></b></font></a></li>
				<li><a href="#"><font color="white"><b><fmt:message
									key="privacyPolicy" /></b></font></a></li>
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
