<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="loc" value="en_US" />
<c:if test="${!(empty param.locale)}">
	<c:set var="loc" value="${param.locale}" />
</c:if>
<fmt:setLocale value="${loc}" />

<fmt:bundle basename="MessagesBundle">
	<head>
<meta charset="utf-8">
<!-- Viewport Meta Tag -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Create Auction</title>
<script src="assets/js/jquery-min.js"></script>
<!-- Bootstrap -->
<link rel="stylesheet" type="text/css"
	href="assets/css/bootstrap.min.css">
	
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
        	
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

<link href="assets/css/login-register.css" rel="stylesheet" />

<!-- Color CSS Styles  -->
<link rel="stylesheet" type="text/css"
	href="assets/css/colors/green.css" media="screen" />


<script
	src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.js"></script>
<link href="./css/prettify-1.0.css" rel="stylesheet">
<link href="./css/base.css" rel="stylesheet">

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>
<link
	href="//cdn.rawgit.com/Eonasdan/bootstrap-datetimepicker/e8bddc60e73c1ec2475f827be36e1957af72e2ea/build/css/bootstrap-datetimepicker.css"
	rel="stylesheet">
	
	<script type="text/javascript">
	$(function() {
		$('#datetimepicker1').datetimepicker();
	});
</script>

<script type="text/javascript">
	$(function() {
		$('#datetimepicker2').datetimepicker();
	});
</script>
	
<script type="text/javascript">
	$(document).ready(function() {
		//alert("Helllo!");
		$("#itemNameValidationMessage").hide();
		$("#descriptionValidationMessage").hide();
		$("#bidStartValidationMessage").hide();
		$("#bidEndValidationMessage").hide();
		$("#initialPriceValidationMessage").hide();
		$("#imageValidationMessage").hide();

		// make sure the uploaded file is an image
		$("#image").change(function() {
			var mimeType = this.files[0]['type'];
			if (mimeType.split('/')[0] != 'image') {
				$("#imageValidationMessage").slideDown();
			}
		});

		$("#image").click(function() {
			$("#imageValidationMessage").slideUp();
		});
	});

	function hideErrorMessage(element) {
		//alert("hoho");
		//alert(element);
		//alert("hi"+$(element).nodeNme+"hi");	
		documet.getElementById(element).style.background = "yellow";

	}

	function disableBidStartDate() {
		if (document.getElementById("bidStartNow").checked == true) {
			document.getElementById("bidStart").disabled = true;
		} else {
			document.getElementById("bidStart").disabled = false;
		}
	}
	
	

	$('.datepicker').datetimepicker({
		format : 'DD-MM-YYYY HH:mm:ss'
	});

	function validateAuctionForm() {
		var error = true;
		var itemName = document.forms["auction"]["itemName"].value;
		var description = document.forms["auction"]["description"].value;
		var bidStart = document.forms["auction"]["bidStart"].value;
		var bidStartNow = document.getElementById("bidStartNow").checked;
		var bidEnd = document.forms["auction"]["bidEnd"].value;
		var initialPrice = document.forms["auction"]["initialPrice"].value;

		if (itemName.length == 0) {
			$("#itemNameValidationMessage").slideDown();
			error = false;
		}
		if (description.length == 0) {
			$("#descriptionValidationMessage").slideDown();
			error = false;
		}
		if (bidStart.length == 0 && bidStartNow == false) {
			$("#bidStartValidationMessage").slideDown();
			error = false;
		}
		if (bidEnd.length == 0) {
			$("#bidEndValidationMessage").slideDown();
			error = false;
		}
		if (initialPrice.length == 0 || isNaN(initialPrice)) {
			$("#initialPriceValidationMessage").slideDown();
			error = false;
		}
		return error;
	}

	$(function() {

		// We can attach the `fileselect` event to all file inputs on the page
		$(document).on(
				'change',
				':file',
				function() {
					var input = $(this), numFiles = input.get(0).files ? input
							.get(0).files.length : 1, label = input.val()
							.replace(/\\/g, '/').replace(/.*\//, '');
					input.trigger('fileselect', [ numFiles, label ]);
				});

		// We can watch for our custom `fileselect` event like this
		$(document)
				.ready(
						function() {
							$(':file')
									.on(
											'fileselect',
											function(event, numFiles, label) {

												var input = $(this).parents(
														'.input-group').find(
														':text'), log = numFiles > 1 ? numFiles
														+ ' files selected'
														: label;

												if (input.length) {
													input.val(log);
												} else {
													if (log)
														alert(log);
												}

											});
						});

	});
</script>



	</head>
	<body>
	
	

		<%@include file="header.jsp"%>
		<!-- Contact Section -->
		<section class="contact-form-section section">
			<div class="container">
				<div class="row">
					<div
						class="col-md-12 mb-50 text-center contact-title-text wow fadeIn"
						data-wow-delay="0.3s">
						<h2>Create Auction</h2>
					</div>
					<div
						class="col-md-7 col-md-offset-1 contact-form contact-info-section center-div">
						<form enctype="multipart/form-data" name="auction"
							id="auctionForm" onsubmit="return validateAuctionForm()"
							action="auctionServlet" onsubmit="return validateForm()"
							method="POST">

							<div class="form-group">
								<label for="itemName" class="sr-only">Item Name</label> <input
									type="text" placeholder="Your item Name" name="itemName"
									onfocus="hideErrorMessage(this.id);" required id="itemName"
									class="form-control contact-control">
								<div id="itemNameValidationMessage" Style="color: red">Item
									Name is required</div>
							</div>

							<div class="form-group">
								<label for="description" class="sr-only">Description</label>
								<textarea name="description" rows="5" placeholder="Enter Description" form="auctionForm" required id="description" class="form-control"></textarea>
								<div id="descriptionValidationMessage" Style="color: red">Description
									is required</div>
							</div>

							<div class="input-group date" data-provide="datepicker" style="text-align: left;">
								<label for="bidStart">Bidding Starts at :</label>
								<div class='input-group date' id='datetimepicker1'>
									<input type='text' class="form-control"
										data-date-format="YYYY-MM-DD HH:mm:ss" id="bidStart"
										name="bidStart" /> <span class="input-group-addon"> <span
										class="glyphicon glyphicon-calendar"></span>
									</span>
								</div>
							</div>

							
							<div class="input-group date" data-provide="datepicker" style="text-align: left;">
								<label for="bidStartNow">Start Bid Now</label> 
								<input 
									type="checkbox" onclick="disableBidStartDate()"
									id="bidStartNow" name="bidStartNow" />
								<div id="bidStartValidationMessage" Style="color: red">Bidding
									Start Date and Time are required</div>
							</div>

							<div class="form-group" style="text-align: left;">
								<label for="bidEnd">Bidding Ends at:</label>
								<div class='input-group date' id='datetimepicker2'>
									<input type='text' class="form-control"
										data-date-format="YYYY-MM-DD HH:mm:ss" id="bidEnd"
										name="bidEnd" /> <span class="input-group-addon"> <span
										class="glyphicon glyphicon-calendar"></span>
									</span>
								</div>
							</div>

							<div class="form-group">
								<label class="pull-left" for="initialPrice">Initial
									Price</label> <input type="text" class="form-control" id="initialPrice"
									placeholder="Enter Initial Price" name="initialPrice" required>
								<div id="initialPriceValidationMessage" Style="color: red">Initial
									Price is required and has to be number</div>
							</div>

							<br />


							<div class="input-group" id="fileUpload">
								<label class="input-group-btn" for="image"> <span
									class="btn btn-primary"> Upload Image<input type="file"
										id="image" name="image" accept="image/*"
										style="display: none;" multiple>
								</span>
								</label> <input type="text" class="form-control"
									style="border-radius: 0px 5px 5px 0px" readonly>
								<div id="imageValidationMessage" Style="color: red">The
									file needs to be an image</div>
							</div>
							
							<br />
							<br />

							<button type="submit" class="btn btn-primary"
								id="submitAuctionbtn" name="submitAuctionbtn">
								<fmt:message key="submit" />
							</button>

							<div class="clearfix"></div>
						</form>
					</div>
				</div>
			</div>
		</section>
		<!-- Contact Section End -->





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
	
</fmt:bundle>
</body>
</html>