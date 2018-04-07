<!DOCTYPE html>

<html lang="en">
<head>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="loc" value="en_US" />
<c:if test="${!(empty param.locale)}">
	<c:set var="loc" value="${param.locale}" />
</c:if>
<fmt:setLocale value="${param.locale}" />

<meta charset="utf-8">
<title>Search</title>
	<script src="assets/js/jquery-min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Viewport Meta Tag -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" type="text/css"
	href="assets/css/bootstrap.min.css">
<!-- Main Style -->
<link rel="stylesheet" type="text/css" href="assets/css/main.css">
<!-- Slicknav Css -->
<link rel="stylesheet" type="text/css" href="assets/css/slicknav.css">

<!-- Responsive Style -->
<link rel="stylesheet" type="text/css" href="assets/css/responsive.css">
<!--Fonts-->
<link rel="stylesheet" media="screen"
	href="assets/fonts/font-awesome/font-awesome.min.css">
<link rel="stylesheet" media="screen"
	href="assets/fonts/simple-line-icons.css">

<!-- Extras -->
<link rel="stylesheet" type="text/css"
	href="assets/extras/owl/owl.carousel.css">
<link rel="stylesheet" type="text/css"
	href="assets/extras/owl/owl.theme.css">
<link rel="stylesheet" type="text/css" href="assets/extras/animate.css">
<link rel="stylesheet" type="text/css"
	href="assets/extras/normalize.css">


<!-- Color CSS Styles  -->
<link rel="stylesheet" type="text/css"
	href="assets/css/colors/green.css" media="screen" />

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js">
    </script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js">
    </script>
    <![endif]-->
<style>
.center-div {
	margin: 0 auto;
	width: 100px;
}
</style>


<script>
	function validateForm() {
		var code = document.forms["verifyForm"]["code"].value;
		if (code.match("[^0-9]{2,7}")) {
			document.getElementById("codeValidation").innerHTML = "Please enter digits only!";
			return false;
		}
		return true;

	}
</script>

</head>

<body>
<fmt:bundle basename="MessagesBundle">
	<%@include file="header.jsp"%>
	<!-- Contact Section -->
	<section class="contact-form-section section">
		<div class="container">
			<div class="row">
				  <div class="col-md-12 mb-50 text-center contact-title-text wow fadeIn" data-wow-delay="0.3s">
            <h2><fmt:message key="search" /></h2>
          </div>
				<div
					class="col-lg-11 contact-form contact-info-section ">


					<c:if test="${!keyword.isEmpty()}">
						<h2 class="small-title mb-30">Search for: ${keyword}</h2>
					</c:if>
					<c:if test="${keyword.isEmpty()}">
						<h2 class="small-title mb-30"><fmt:message key="searchForAll" /></h2>
					</c:if>

					<c:if test="${productTotal <=0}">
						<p>Sorry no items are found for ${keyword}</p>

					</c:if>
					
					
					<c:if test="${productTotal > 0}">
					<form class="form-inline" action="sortServlet" method="get">
							<input type="hidden" name="search" value="${keyword}" />
							<label for="sortby"><fmt:message key="sortBy" /></label> 
							&nbsp;
							<select name="sortby" id="sortby" class="form-control">
								<option value="name"
									<c:if test="${sortMethod == 'name'}">selected</c:if>><fmt:message key="name" /></option>
								<option value="lowestprice"
									<c:if test="${sortMethod == 'lowestprice'}">selected</c:if>><fmt:message key="lowestPrice" /></option>

								<option value="highestprice"
									<c:if test="${sortMethod == 'highestprice'}">selected</c:if>>
									<fmt:message key="highestPrice" /></option>

								<option value="mostbids"
									<c:if test="${sortMethod == 'mostbids'}">selected</c:if>><fmt:message key="mostBids" /></option>
								<option value="leastbids"
									<c:if test="${sortMethod == 'leastbids'}">selected</c:if>><fmt:message key="leastBids" /></option>
								<option value="newestauction"
									<c:if test="${sortMethod == 'newestauction'}">selected</c:if>><fmt:message key="newestAuction" /></option>
								<option value="oldestauction"
									<c:if test="${sortMethod == 'oldestauction'}">selected</c:if>><fmt:message key="oldestAuction" /></option>
							</select>
							&nbsp;
							<input type="submit" class="form-control btn btn-sm" value="<fmt:message key="sort" />"
								style="background-color:#2296F3; border-radius:10px;">
						</form>





						<hr>
						<p>${productTotal} <fmt:message key="item1" /> ${keyword}</p>
						<hr>

						<table id="example" class="table-striped" style="width: 100%">
							<thead>
								<tr>
									<th></th>
									<th><fmt:message key="item" /></th>
									<th><fmt:message key="status" /></th>
									<th><fmt:message key="detail" /></th>
									<th><fmt:message key="currentBid" /></th>
									<th><fmt:message key="bidDateStart" /></th>
									<th><fmt:message key="bidDateEnd" /></th>
									<c:if test="${role}">
										<th></th>
									</c:if>

								</tr>
							</thead>
							<tbody>
								<c:forEach items="${productItems}" var="productItem">
									<c:if test="${not empty productItem.getAuction().getId()}">
									<tr>

										<td><div class="gallery">
												<c:if test="${not empty productItem.getAuction().getId()}">
													<c:set var="auctionId" scope="session"
														value="${productItem.getAuction().getId()}" />
													<a
														href="bidPageDisplayServlet?productitemid=${productItem.productId}">
												</c:if>
												<img
													src="chrome-extension://icghneokgcoplpkbhligbcmaljochmel/${productItem.getImage()}"
													alt="${productItem.itemName}" width="200" height="200"></img>
												<c:if test="${not empty productItem.getAuction().getId()}">
													</a>
												</c:if>
											</div></td>

										<td><b>${productItem.itemName}</b></td>

										<c:if test="${not empty productItem.getAuction().getId()}">
											<c:if
												test="${productItem.getAuction().getBiddingStatus() =='2'}">
												<td><b><fmt:message key="biddingEnded" /></b></td>
											</c:if>
											<c:if
												test="${productItem.getAuction().getBiddingStatus() =='1'}">
												<td><b><fmt:message key="bidding" /></b></td>
											</c:if>
											<c:if
												test="${productItem.getAuction().getBiddingStatus() =='0'}">
												<td><b><fmt:message key="biddingNotStarted" /></b></td>
											</c:if>
										</c:if>
										<c:if test="${empty productItem.getAuction().getId()}">
											<td><b><fmt:message key="noBidding" /></b></td>
										</c:if>
										

										<td><b>${productItem.description}</b></td>
										<td><b>$${productItem.highestPrice}</b></td>
										<td><b>${productItem.getAuction().getBidstarttime()}</b></td>
										<td><b>${productItem.getAuction().getBidendtime()}</b></td>
										<c:if test="${role}">
											<td>
												<form method="get" action="adminServlet">
													<button type="submit" name="auctionId" 
													class="form-control btn btn-sm" style="background-color:#2296F3; border-radius:10px;"
														value="${productItem.getAuction().getId()}">
														<fmt:message key="delete" /></button>
												</form>
											</td>
										</c:if>
									</tr>
									</c:if>
								</c:forEach>
							</tbody>
						</table>

						<script>
							$(document)
									.ready(
											function() {
												$('#example')
														.DataTable(
																{
																	
																	"searching" : false,
																	"lengthMenu" : [
																			[
																					5,
																					10,
																					30,
																					-1 ],
																			[
																					5,
																					10,
																					30,
																					"All" ] ],
																	"ordering" : false
																});
											});
						</script>
						<hr>
					</c:if>

				</div>
			</div>
		</div>
	</section>
	<!-- Contact Section End -->
	<%@include file="footer.jsp"%>

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

	<!-- Go To Top Link -->
	<a href="#" class="back-to-top"> <i class="fa fa-angle-up"> </i>
	</a>

	<!-- JavaScript & jQuery Plugins -->

	<script src="assets/js/popper.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.mixitup.js"></script>
	<script src="assets/js/smoothscroll.js"></script>
	<script src="assets/js/wow.js"></script>
	<script src="assets/js/owl.carousel.js"></script>
	<script src="assets/js/waypoints.min.js"></script>
	<script src="assets/js/jquery.counterup.min.js"></script>
	<script src="assets/js/jquery.slicknav.js"></script>
	<script src="assets/js/jquery.appear.js"></script>
	<script src="assets/js/form-validator.min.js"></script>
	<script src="assets/js/contact-form-script.min.js"></script>
	<script src="assets/js/main.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
</fmt:bundle>
</body>
</html>