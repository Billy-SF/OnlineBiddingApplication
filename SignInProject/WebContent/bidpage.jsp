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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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

<
style>body {
	font-family: Arial, Helvetica, sans-serif;
}

#myImg {
	border-radius: 5px;
	cursor: pointer;
	transition: 0.3s;
}

#myImg:hover {
	opacity: 0.7;
}

/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(37, 49, 54, 0.9); /* Black w/ opacity */
}

/* Modal Content (image) */
.modal-content {
	margin: auto;
	display: block;
	width: 80%;
	max-width: 700px;
	height: 90%; /* Full height */
}

/* Caption of Modal Image */
#caption {
	margin: auto;
	display: block;
	width: 80%;
	max-width: 700px;
	text-align: center;
	color: #ccc;
	padding: 10px 0;
	height: 150px;
}

/* Add Animation */
.modal-content, #caption {
	-webkit-animation-name: zoom;
	-webkit-animation-duration: 0.6s;
	animation-name: zoom;
	animation-duration: 0.6s;
}

@
-webkit-keyframes zoom {
	from {-webkit-transform: scale(0)
}

to {
	-webkit-transform: scale(1)
}

}
@
keyframes zoom {
	from {transform: scale(0)
}

to {
	transform: scale(1)
}

}

/* The Close Button */
.close {
	position: absolute;
	top: 80px;
	right: 35px;
	color: #f1f1f1;
	font-size: 40px;
	font-weight: bold;
	transition: 0.3s;
}

.close:hover, .close:focus {
	color: #bbb;
	text-decoration: none;
	cursor: pointer;
}

/* 100% Image Width on Smaller Screens */
@media only screen and (max-width: 700px) {
	.modal-content {
		width: 100%;
	}
}
</style>

<script src="assets/js/chat.js"></script>
<link rel="stylesheet" href="assets/css/chat.css">

</head>
<body>

	<%@include file="header.jsp"%>

	<br>
	<br>
	<br>
	<br>


	<!-- The Modal -->
	<div id="myModal" class="modal">
		<img class="modal-content" id="img01">
	</div>



	<div style="width: 100%; overflow: hidden;">
		<div style="width: 600px; float: left;">

			<div class="col-lg-9 col-md-5 col-sm-5" style="margin-left: 70px;">
				<h2>${productitem.getItemName()}</h2>
				<div class="image">
			

					<img id="myImg" alt="W3Schools.com" class="float-left" style="height:90%;width:90%;"
					src="chrome-extension://icghneokgcoplpkbhligbcmaljochmel/${productitem.image}"
					alt="${productitem.itemName}"></img> 
				</div>

			</div>

		</div>
		<br> <br>
		<h3>Item Description</h3>
		<p>${productitem.getDescription()}</p>
		<div>
			<div class="bidInfo">
				<p>
					<a href="matchSellerServlet">Seller Page</a>
				</p>
				<p>
					Bid Date Start: <b>${productitem.getAuction().getBidstarttime()}</b>
				</p>
				<p>
					Time left: <span id="tttt"></span>
				</p>
				<c:if test="${productitem.getHighestPrice() == '0.00'}">
					<p>
						Initial Bid Price: <b>$${productitem.getAuction().getBidpricestart()}</b>
					</p>
				</c:if>
				<c:if test="${productitem.getHighestPrice() != '0.00'}">
					<p>
						Current Bid Price: <b>$${productitem.getHighestPrice()}</b>
					</p>
				</c:if>
				<c:if test="${errorMessageBidDao ne null}">
					<h3>${errorMessageBidDao}</h3>
				</c:if>

				<div id="paylink">
					<form class="margin-left:90px;" action="/webProject/index.jsp">
						<script src="https://checkout.stripe.com/checkout.js"
							class="stripe-button" data-key="pk_test_5xAtehpMJFCsizMiODrIcjvt"
							data-amount="99" data-name="Sample" data-description="Widget"
							data-image="https://stripe.com/img/documentation/checkout/marketplace.png"
							data-locale="auto" data-currency="cad">
							
						</script>
					</form>
				</div>
				<br />

				<form class="form-inline" action="bidServlet" method="post">
					<c:if test="${sessionScope.auctionId != null}}">
						<c:remove var="auctionId" />
					</c:if>
					<c:set var="auctionId" scope="session"
						value="${productitem.getAuction().getId()}" />

					<input type="hidden" name="productItemId"
						value="${productitem.getProductId()}" />

					<c:if test="${null != sessionScope.username}">
						<div class="form-group">
							<input type="text" class="form-control contact-control"
								style="border-radius: 10px 0px 0px 10px;"
								pattern="[0-9]+(\.[0-9]{0,2})?%?" id="bidprice" name="bidPrice"
								placeholder="bid here">
						</div>

						<div class="form-group">
							<input type="submit" style="border-radius: 0px 10px 10px 0px;"
								class="btn btn-primary" name="bidsubmit" id="bidsubmit"
								value="Bid" />
						</div>

					</c:if>
					<c:if test="${null == sessionScope.username}">
						<b style="color: red;">Please Signin to Bid</b>
					</c:if>
				</form>


			</div>

			<script>
				var checkUserPay = function() {
					$.ajax({
						url : "checkHighestBidServlet",
						async : true,
						cache : false,
						type : "get",
						Accept : "application/json",
						dataType : "json",
						data : {
							"productitemid" : "${productitem.getProductId()}"
						},
						beforeSend : function(xhr) {

						},
						success : function(data) {
							if ((typeof data["paymessage"]) != "undefined") {
								var paymessage = data["paymessage"];

								if (paymessage == "1") {
									$("button[class$='stripe-button-el']")
											.show();
								}
							} else {
								$("button[class$='stripe-button-el']").hide();
							}

						},
						error : function(error) {
							$("button[class$='stripe-button-el']").hide();
						},
					});

					return;
				};

				function mysqlTimeStampToDate(timestamp) {
					//function parses mysql datetime string and returns javascript Date object
					//input has to be in this format: 2007-06-05 15:26:02
					var regex = /^([0-9]{2,4})-([0-1][0-9])-([0-3][0-9]) (?:([0-2][0-9]):([0-5][0-9]):([0-5][0-9]))?$/;
					var parts = timestamp.replace(regex, "$1 $2 $3 $4 $5 $6")
							.split(' ');
					return new Date(parts[0], parts[1] - 1, parts[2], parts[3],
							parts[4], parts[5]);
				};
				$(document)
						.ready(
								function() {
									$("button[class$='stripe-button-el']")
											.hide();

									var timestamp = "${productitem.getAuction().getBidendtime()}";
									var timestamp_start = "${productitem.getAuction().getBidstarttime()}";

									var date_start = mysqlTimeStampToDate(timestamp_start);
									var date_future = mysqlTimeStampToDate(timestamp);

									var myVar = setInterval(myTimer, 1000);
									$(window).on('beforeunload', function() {
										clearInterval(myVar);

									});
									function myTimer() {
										//var d = new Date();
										//$("#tttt").text(d.toLocaleTimeString());

										var date_now = new Date();

										// get total seconds between the times
										var delta = Math.abs(date_future
												- date_now) / 1000;

										// calculate (and subtract) whole days
										var days = Math.floor(delta / 86400);
										delta -= days * 86400;

										// calculate (and subtract) whole hours
										var hours = Math.floor(delta / 3600) % 24;
										delta -= hours * 3600;

										// calculate (and subtract) whole minutes
										var minutes = Math.floor(delta / 60) % 60;
										delta -= minutes * 60;
										// what's left is seconds
										var seconds = delta % 60; // in theory the modulus is not required
										// $("#tttt").text(days + ' days, ' + minutes + ' minutes, ' + seconds + ' seconds' + "\n" +
										//(date_now.getTime() - date_past.getTime())
										// );
										$("#tttt").text(
												days + ' days, ' + minutes
														+ ' minutes, '
														+ parseInt(seconds)
														+ ' seconds');

										//before start date
										if ((date_now.getTime() - date_start
												.getTime()) < 0) {
											$("#bidprice").attr("disabled",
													"disabled");
											$("#bidsubmit").attr('disabled',
													"disabled");
											$(
													"button[class$='stripe-button-el']")
													.hide();
											$("#tttt").text(
													"Bidding not started!!");

											//between bidding time
										} else if ((date_now.getTime() - date_start
												.getTime()) >= 0
												&& date_now.getTime()
														- date_future.getTime() < 0) {
											$("#bidprice").removeAttr(
													"disabled");
											$("#bidsubmit").removeAttr(
													'disabled');

											//after end date
										} else if (date_now.getTime()
												- date_future.getTime() >= 0) {
											// auction end date expired
											$("#bidprice").attr("disabled",
													"disabled");
											$("#bidsubmit").attr('disabled',
													"disabled");

											$("#tttt")
													.text(
															"0 seconds left, Bidding ended!");
											
											if ("${sessionScope.username}" != "") {
												checkUserPay();

											}
											clearInterval(myVar);
											$
													.ajax({
														url : "auctionStopServlet",
														type : "POST",
														data : {
															"auctionid" : "${productitem.getAuction().getId()}"
														},
														success : function(
																data,
																textStatus,
																jQxhr) {
															//$('#response pre').html( data );
														},
														error : function(jqXhr,
																textStatus,
																errorThrown) {
															//console.log( errorThrown );
														}
													});

											if ("${sessionScope.username}" != "") {
												checkUserPay();
											}

										}
									}
								});
			</script>
		</div>


	</div>
	<hr>



	<div class="col-lg-11 contact-form contact-info-section "
		style="margin-left: 60px;">
		<div style="margin-left: 15px;">
			<h3>Bid History</h3>
			${productitem.getBids().size()} bid(s) found
		</div>
		<br />
		<table id="bidhistory" class="table-striped" style="width: 100%">
			<thead>
				<tr>
					<th>bid price</th>
					<th>user</th>
					<th>date</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${productitem.getBids()}" var="bid">
					<tr>
						<td>$${bid.getBidprice()}</td>
						<td><b>${bid.getUser().getUsername()}</b></td>
						<td><b>${bid.getDateCreated()}</b></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<script>
		$(document).ready(function() {
			$('#bidhistory').DataTable({
				"searching" : false,
				"lengthMenu" : [ [ 5, 10, 30, -1 ], [ 5, 10, 30, "All" ] ],
				"ordering" : false
			});
		});
	</script>

	<br />
	<hr>
	<br />
	<c:if test="${!(empty sessionScope.username)}">
		<div class="row align-items-center justify-content-center" id="chatroom">
			<div class="col-md-5 col-lg-9 col-sm-5 ">
				<div class="chatroom-container">
					<div class="chatmessage-container" id="chatmessage"></div>
					<div class="clearfix"></div>
					<div class="input-group left-padding-5 bottom-padding-5">
						
						<div class="text-right top-padding-12 right-padding-100">
							<label for="color">Color</label>&nbsp; <select id="color"
								name="color">
								<option value="black">Black</option>
								<option value="red">Red</option>
								<option value="green">Green</option>
								<option value="yellow">Yellow</option>
								<option value="blue">Blue</option>
								<option value="purple">Purple</option>
							</select>
						</div>
					</div>
					<div class="clearfix"></div>
					<div
						class="message-send left-padding-5 right-padding-5 bottom-padding-5">
						<div hidden="hidden">
							<input type="text" id="last_message_id" name="last_message_id"><br>
							<input type="text" id="user_name" name="user_name"
								value="${sessionScope.username}"><br> <input
								type="text" id="auction_id" name="auction_id"
								value="${productitem.getAuction().getId()}"><br> <input
								type="text" id="color" name="color"><br>
						</div>
						<div class="input-group">
						<div class="input-group-btn">
							<button class="btn btn-primary  btn-sm" type="button" name="clear"
								id="clear">Clear</button>
						</div>
							<input type="text" class="form-control" id="message"
								name="message"> <span class="input-group-btn">
								<button class="btn btn-primary btn-sm" type="button" id="send"
									name="send">Submit</button>
							</span>
						</div>
					</div>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
		<br />
		<br />
	</c:if>









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


	<script>
		// Get the modal
		var modal = document.getElementById('myModal');

		// Get the image and insert it inside the modal - use its "alt" text as a caption
		var img = document.getElementById('myImg');
		var modalImg = document.getElementById("img01");
	
		img.onclick = function() {
			modal.style.display = "block";
			modalImg.src = this.src;
		
		}

	
	</script>




	<%@include file="footer.jsp"%>

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


</body>
</html>