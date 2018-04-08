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
<fmt:setLocale value="${param.locale}" />


<head>
<meta charset="utf-8">
<!-- Viewport Meta Tag -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Condition & Terms</title>
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
						<h2><fmt:message key="tc1" /></h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Page Header End -->

	<!-- Classic Blog Section -->
	<section class="classic-blog-section section">
		<div class="container">
			<div class="row">
				<!-- BLog Article Section -->
				<div class="col-md-12">
					<!-- Single Blog Post -->
					<article class="blog-post-wrapper wow fadeIn" data-wow-delay="0.3s">
						<!-- Author Info -->
						<header class="author-info">
							<h2 class="blog-post-title">
								<fmt:message key="tc2" />
							</h2>

						</header>
						<!-- Featured Content -->

						<!-- Post Content -->
						<section class="blog-post-content">
							<div class="blog-post">
						
							<p><fmt:message key="tc3" /><p>
							<p><fmt:message key="tc4" /><p>
							<p><fmt:message key="tc5" /><p>
							<p><fmt:message key="tc6" /><p>
							<p><fmt:message key="tc7" /><p>
							<p><fmt:message key="tc8" /><p>
							<p><fmt:message key="tc9" /><p>
							<p><fmt:message key="tc10" /><p>
							<p><fmt:message key="tc11" /><p>
							<p><fmt:message key="tc12" /><p>
							<p><fmt:message key="tc13" /><p>
							<p><fmt:message key="tc14" /><p>
							<p><fmt:message key="tc15" /><p>
							<p><fmt:message key="tc16" /><p>
							<p><fmt:message key="tc17" /><p>
							<p><fmt:message key="tc18" /><p>
							
							
								
										
							</div>
						</section>

					</article>

				</div>
				<!-- End -->
			</div>
		</div>
	</section>
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