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
<title>Privacy Policy</title>
<!-- Bootstrap -->
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
						<h2><fmt:message key="pp00" /></h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Page Header End -->

	<section class="classic-blog-section section">
		<div class="container">
			<div class="row">
				<!-- BLog Article Section -->
				<div class="col-md-12">
					<!-- Single Blog Post -->
					<article class="blog-post-wrapper wow fadeIn" data-wow-delay="0.3s">
						<!-- Author Info -->
						<header class="author-info">
							<h2 class="blog-post-title"><fmt:message key="pp0" /></h2>
						</header>
						<section class="blog-post-content">
							<div class="blog-post">
								<p><fmt:message key="pp1" /><p>
								<p><fmt:message key="pp2" /><p>
								<p><fmt:message key="pp3" /><p>
								<p><fmt:message key="pp4" /><p>
								<p><fmt:message key="pp5" /><p>
								<p><fmt:message key="pp6" /><p>
								<p><fmt:message key="pp7" /><p>
								<p><fmt:message key="pp8" /><p>
								<p><fmt:message key="pp9" /><p>
								<p><fmt:message key="pp10" /><p>
								<p><fmt:message key="pp11" /><p>
								<p><fmt:message key="pp12" /><p>
								<p><fmt:message key="pp13" /><p>
								<p><fmt:message key="pp14" /><p>
								<p><fmt:message key="pp15" /><p>
								<p><fmt:message key="pp16" /><p>
								<p><fmt:message key="pp17" /><p>
								<p><fmt:message key="pp18" /><p>
								<p><fmt:message key="pp19" /><p>
								<p><fmt:message key="pp20" /><p>
								<p><fmt:message key="pp21" /><p>
								<p><fmt:message key="pp22" /><p>
								<p><fmt:message key="pp23" /><p>
								<p><fmt:message key="pp24" /><p>
								<p><fmt:message key="pp25" /><p>
								<p><fmt:message key="pp26" /><p>
								<p><fmt:message key="pp27" /><p>
								<p><fmt:message key="pp28" /><p>
								<p><fmt:message key="pp29" /><p>
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