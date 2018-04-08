<!DOCTYPE html>

<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="loc" value="en_US" />
<c:if test="${!(empty param.locale)}">
	<c:set var="loc" value="${param.locale}" />
</c:if>
<fmt:setLocale value="${param.locale}" />

<html lang="en">
<head>
<meta charset="utf-8">
<!-- Viewport Meta Tag -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>FAQ</title>
<!-- Bootstrap -->
 <link rel="stylesheet" type="text/css" href="assets/css/header.css">
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
</head>
<body>
<fmt:bundle basename="MessagesBundle">

	<%@include file="header.jsp"%>

	<!-- Page Header -->
	<div class="page-header-section">
		<div class="container">
			<div class="row">
				<div class="page-header-area">
					<div class="page-header-content">
						<h2>FAQ</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Page Header End -->

	<!-- Classic Blog Section -->

		<div class="container">
			<div class="row">
				<!-- BLog Article Section -->
				<div class="col-md-12">
					<!-- Single Blog Post -->
					<article class="blog-post-wrapper wow fadeIn" data-wow-delay="0.3s">
						<!-- Author Info -->
					
						<!-- Featured Content -->

						<!-- Post Content -->
						<section class="blog-post-content">
							<div class="blog-post">

								<h3>
									<strong><fmt:message key="faq1" /></strong>
								</h3>
							
									
									<p><fmt:message key="faq2" /><p>
									<p><fmt:message key="faq3" /><p>
									<p><fmt:message key="faq4" /><p>
									<p><fmt:message key="faq5" /><p>
									<p><fmt:message key="faq6" /><p>
									<p><fmt:message key="faq7" /><p>
									<p><fmt:message key="faq8" /><p>
									<p><fmt:message key="faq9" /><p>
									<p><fmt:message key="faq10" /><p>
									<p><fmt:message key="faq11" /><p>
									<p><fmt:message key="faq12" /><p>
									<p><fmt:message key="faq13" /><p>
									<p><fmt:message key="faq14" /><p>
									<p><fmt:message key="faq15" /><p>
									<p><fmt:message key="faq16" /><p>
									<p><fmt:message key="faq17" /><p>
									<p><fmt:message key="faq18" /><p>
									<p><fmt:message key="faq19" /><p>
									<p><fmt:message key="faq20" /><p>
									<p><fmt:message key="faq21" /><p>
									<p><fmt:message key="faq22" /><p>
									<p><fmt:message key="faq23" /><p>
									<p><fmt:message key="faq24" /><p>
									<p><fmt:message key="faq25" /><p>
									<p><fmt:message key="faq26" /><p>
									<p><fmt:message key="faq27" /><p>
									<p><fmt:message key="faq28" /><p>
									<p><fmt:message key="faq29" /><p>
									<p><fmt:message key="faq30" /><p>
									<p><fmt:message key="faq31" /><p>
									<p><fmt:message key="faq32" /><p>
									<p><fmt:message key="faq33" /><p>
									<p><fmt:message key="faq34" /><p>
									<p><fmt:message key="faq35" /><p>
									<p><fmt:message key="faq36" /><p>
									<p><fmt:message key="faq37" /><p>
									<p><fmt:message key="faq38" /><p>
									<p><fmt:message key="faq39" /><p>
									<p><fmt:message key="faq40" /><p>
									<p><fmt:message key="faq41" /><p>
									<p><fmt:message key="faq42" /><p>
									<p><fmt:message key="faq43" /><p>
									<p><fmt:message key="faq44" /><p>
									<p><fmt:message key="faq45" /><p>
									<p><fmt:message key="faq46" /><p>
									<p><fmt:message key="faq47" /><p>
									<p><fmt:message key="faq48" /><p>
									<p><fmt:message key="faq49" /><p>
									<p><fmt:message key="faq50" /><p>
						
									
									
							

							</div>
						</section>

					</article>

				</div>
				<!-- End -->
			</div>
		</div>

	<!-- Classic Blog Section End -->

	<!-- Footer Section -->
	<%@include file="footer.jsp"%>
	<!-- Footer Section End-->

	<!-- Go To Top Link -->
	<a href="#" class="back-to-top"> <i class="fa fa-angle-up"> </i>
	</a>

	<!-- JavaScript & jQuery Plugins -->
	<script src="assets/js/jquery-min.js"></script>
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