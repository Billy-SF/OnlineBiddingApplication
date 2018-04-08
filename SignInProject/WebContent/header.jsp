<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- Header area wrapper starts -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="loc" value="en_US" />
<c:if test="${!(empty param.locale)}">
	<c:set var="loc" value="${param.locale}" />
</c:if>
<fmt:setLocale value="${loc}" />

<fmt:bundle basename="MessagesBundle">


	<header id="header-wrap">


		<!-- Navbar Starts -->
		<nav
			class="navbar navbar-expand-md  fixed-top scrolling-navbar  nav-bg navbar-dark">
			
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<c:url value="index.jsp" var="home1">
						<c:param name="locale" value="${loc}" />
					</c:url>

					
				
				</div>
					<button id="hu" class="navbar-toggler bg-primary" type="button" data-toggle="collapse"
						data-target="#main-menu" aria-controls="main-menu"
						aria-expanded="false" aria-label="Toggle navigation" style="display:block !important">
						<span class="navbar-toggler-icon"></span>
					</button>
				<div class="collapse navbar-collapse" id="main-menu">
				<a class="navbar-brand" href="${home1}"> <img
						src="assets/img/logo.png" style="width: 180px; height: 90%;"
						alt="">
					</a>
					<ul class="navbar-nav mr-auto w-100 justify-content-end">
						<li class="nav-item dropdown"><c:url value="index.jsp"
								var="home">
								<c:param name="locale" value="${loc}" />
							</c:url> <a class="nav-link dropdown-toggle active" href="${home}"
							aria-haspopup="true" aria-expanded="false"> <fmt:message
									key="home" />
						</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"><fmt:message
									key="auction" /></a>
							<div class="dropdown-menu">
								<c:if test="${null != sessionScope.username}">
									<a class="dropdown-item" href="auction.jsp?locale=${loc}"><fmt:message
											key="createAuction" />
											</a>
								</c:if>

								<a class="dropdown-item" href="displayAuctionServlet?locale=${loc}"><fmt:message
										key="viewCurrentBids" /></a>

								<c:if test="${role}">
									<a class="dropdown-item" href="closedBidsServlet?locale=${loc}"><fmt:message
											key="viewEndedBids" /></a>
								</c:if>
							</div></li>
						<c:if test="${null != sessionScope.username}">

							<!--     toggle button for  -->
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"> <i
									class="fa fa-user icon-round icon-xs"></i>${sessionScope.username}</a>
								<div class="dropdown-menu">

									<c:url value="edit.jsp" var="edit">
										<c:param name="locale" value="${loc}" />
									</c:url>

									<c:if test="${role}">
										<a class="dropdown-item" href="usersServlet?locale=${loc}"><fmt:message
												key="users" /></a>
									</c:if>

									<a class="dropdown-item" href="${edit}"><fmt:message
											key="edit" /></a> <a class="dropdown-item" href="Logout.jsp?locale=${loc}"><fmt:message
											key="logout" /></a>
								</div></li>
						</c:if>
						<c:if test="${null == sessionScope.username}">
							<!--     toggle button for  -->
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"><fmt:message
										key="account" /></a>
								<div class="dropdown-menu">
									<a class="dropdown-item" data-toggle="modal" href="#id01"><fmt:message
											key="login" /></a> <a class="dropdown-item"
										href="registrationForm.jsp?locale=${loc}"><fmt:message key="register" /></a>
								</div></li>
						</c:if>


						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"><fmt:message
									key="language" /></a> <c:set var="localeURI" scope="request"
								value="${fn:substring(pageContext.request.requestURI, 13,fn:length(pageContext.request.requestURI))}" />

							<c:if test="${localeURI == '/seller.jsp'}">
								<div class="dropdown-menu">
									<c:url value="matchSellerServlet" var="englishURL">
										<c:param name="locale" value="en_US" />
									</c:url>
									<a class="dropdown-item" href="${englishURL}">English</a>
									<c:url value="matchSellerServlet" var="chineseURL">
										<c:param name="locale" value="zh_CN" />
									</c:url>
									<a class="dropdown-item" href="${chineseURL}">&#x4E2D;&#x6587;</a>
								</div>
							</c:if> <c:if test="${localeURI == '/sellerFeedback.jsp'}">
								<div class="dropdown-menu">
									<c:url value="sellerFeedback.jsp" var="englishURL">
										<c:param name="locale" value="en_US" />
										<c:param name="seller" value="${param.seller}" />
									</c:url>
									<a class="dropdown-item" href="${englishURL}">English</a>
									<c:url value="sellerFeedback.jsp" var="chineseURL">
										<c:param name="locale" value="en_US" />
										<c:param name="seller" value="${param.seller}" />
									</c:url>
									<a class="dropdown-item" href="${chineseURL}">&#x4E2D;&#x6587;</a>
								</div>
							</c:if> <c:if test="${localeURI == '/condition.jsp'}">
								<div class="dropdown-menu">
									<c:url value="condition.jsp" var="englishURL">
										<c:param name="locale" value="en_US" />
									</c:url>
									<a class="dropdown-item" href="${englishURL}">English</a>
									<c:url value="condition.jsp" var="chineseURL">
										<c:param name="locale" value="zh_CN" />
									</c:url>
									<a class="dropdown-item" href="${chineseURL}">&#x4E2D;&#x6587;</a>
								</div>
							</c:if> <c:if test="${localeURI == '/faq.jsp'}">
								<div class="dropdown-menu">
									<c:url value="faq.jsp" var="englishURL">
										<c:param name="locale" value="en_US" />
									</c:url>
									<a class="dropdown-item" href="${englishURL}">English</a>
									<c:url value="faq.jsp" var="chineseURL">
										<c:param name="locale" value="zh_CN" />
									</c:url>
									<a class="dropdown-item" href="${chineseURL}">&#x4E2D;&#x6587;</a>
								</div>
							</c:if> <c:if test="${localeURI == '/privacy.jsp'}">
								<div class="dropdown-menu">
									<c:url value="privacy.jsp" var="englishURL">
										<c:param name="locale" value="en_US" />
									</c:url>
									<a class="dropdown-item" href="${englishURL}">English</a>
									<c:url value="privacy.jsp" var="chineseURL">
										<c:param name="locale" value="zh_CN" />
									</c:url>
									<a class="dropdown-item" href="${chineseURL}">&#x4E2D;&#x6587;</a>
								</div>
							</c:if> <c:if test="${localeURI == '/contact.jsp'}">
								<div class="dropdown-menu">
									<c:url value="contact.jsp" var="englishURL">
										<c:param name="locale" value="en_US" />
									</c:url>
									<a class="dropdown-item" href="${englishURL}">English</a>
									<c:url value="contact.jsp" var="chineseURL">
										<c:param name="locale" value="zh_CN" />
									</c:url>
									<a class="dropdown-item" href="${chineseURL}">&#x4E2D;&#x6587;</a>
								</div>
							</c:if> <c:if test="${localeURI == '/team.jsp'}">
								<div class="dropdown-menu">
									<c:url value="team.jsp" var="englishURL">
										<c:param name="locale" value="en_US" />
									</c:url>
									<a class="dropdown-item" href="${englishURL}">English</a>
									<c:url value="team.jsp" var="chineseURL">
										<c:param name="locale" value="zh_CN" />
									</c:url>
									<a class="dropdown-item" href="${chineseURL}">&#x4E2D;&#x6587;</a>
								</div>
							</c:if> <c:if test="${localeURI == '/edit.jsp'}">
								<div class="dropdown-menu">
									<c:url value="edit.jsp" var="englishURL">
										<c:param name="locale" value="en_US" />
									</c:url>
									<a class="dropdown-item" href="${englishURL}">English</a>
									<c:url value="edit.jsp" var="chineseURL">
										<c:param name="locale" value="zh_CN" />
									</c:url>
									<a class="dropdown-item" href="${chineseURL}">&#x4E2D;&#x6587;</a>
								</div>
							</c:if> <c:if test="${localeURI == '/users.jsp'}">
								<div class="dropdown-menu">
									<c:url value="usersServlet" var="englishURL">
										<c:param name="locale" value="en_US" />
									</c:url>
									<a class="dropdown-item" href="${englishURL}">English</a>
									<c:url value="usersServlet" var="chineseURL">
										<c:param name="locale" value="zh_CN" />
									</c:url>
									<a class="dropdown-item" href="${chineseURL}">&#x4E2D;&#x6587;</a>
								</div>
							</c:if> <c:if test="${localeURI == '/usersServlet'}">
								<div class="dropdown-menu">
									<c:url value="usersServlet" var="englishURL">
										<c:param name="locale" value="en_US" />
									</c:url>
									<a class="dropdown-item" href="${englishURL}">English</a>
									<c:url value="usersServlet" var="chineseURL">
										<c:param name="locale" value="zh_CN" />
									</c:url>
									<a class="dropdown-item" href="${chineseURL}">&#x4E2D;&#x6587;</a>
								</div>
							</c:if> <c:if test="${localeURI == '/auction.jsp'}">
								<div class="dropdown-menu">
									<c:url value="auction.jsp" var="englishURL">
										<c:param name="locale" value="en_US" />
									</c:url>
									<a class="dropdown-item" href="${englishURL}">English</a>
									<c:url value="auction.jsp" var="chineseURL">
										<c:param name="locale" value="zh_CN" />
									</c:url>
									<a class="dropdown-item" href="${chineseURL}">&#x4E2D;&#x6587;</a>
								</div>
							</c:if> <c:if test="${localeURI == '/closedBidsServlet'}">
								<div class="dropdown-menu">
									<c:url value="closedBidsServlet" var="englishURL">
										<c:param name="locale" value="en_US" />
									</c:url>
									<a class="dropdown-item" href="${englishURL}">English</a>
									<c:url value="closedBidsServlet" var="chineseURL">
										<c:param name="locale" value="zh_CN" />
									</c:url>
									<a class="dropdown-item" href="${chineseURL}">&#x4E2D;&#x6587;</a>
								</div>
							</c:if> <c:if test="${localeURI == '/closedBids.jsp'}">
								<div class="dropdown-menu">
									<c:url value="closedBidsServlet" var="englishURL">
										<c:param name="locale" value="en_US" />
									</c:url>
									<a class="dropdown-item" href="${englishURL}">English</a>
									<c:url value="closedBidsServlet" var="chineseURL">
										<c:param name="locale" value="zh_CN" />
									</c:url>
									<a class="dropdown-item" href="${chineseURL}">&#x4E2D;&#x6587;</a>
								</div>
							</c:if> <c:if test="${localeURI == '/displayAuction.jsp'}">
								<div class="dropdown-menu">
									<c:url value="displayAuction.jsp" var="englishURL">
										<c:param name="locale" value="en_US" />
									</c:url>
									<a class="dropdown-item" href="${englishURL}">English</a>
									<c:url value="displayAuctionServlet" var="chineseURL">
										<c:param name="locale" value="zh_CN" />
									</c:url>
									<a class="dropdown-item" href="${chineseURL}">&#x4E2D;&#x6587;</a>
								</div>
							</c:if> <c:if test="${localeURI == '/bidpage.jsp'}">
								<div class="dropdown-menu">
									<c:url value="bidPageDisplayServlet" var="englishURL">
										<c:param name="productitemid"
											value="${productitem.getProductId()}" />
										<c:param name="locale" value="en_US" />
									</c:url>
									<a class="dropdown-item" href="${englishURL}">English</a>
									<c:url value="bidPageDisplayServlet" var="chineseURL">
										<c:param name="productitemid"
											value="${productitem.getProductId()}" />
										<c:param name="locale" value="zh_CN" />
									</c:url>
									<a class="dropdown-item" href="${chineseURL}">&#x4E2D;&#x6587;</a>
								</div>
							</c:if> <c:if test="${localeURI == '/search.jsp'}">
								<div class="dropdown-menu">
									<c:url value="searchServlet" var="englishURL">
										<c:param name="search" value="${keyword}" />
										<c:param name="locale" value="en_US" />
									</c:url>
									<a class="dropdown-item" href="${englishURL}">English</a>
									<c:url value="searchServlet" var="chineseURL">
										<c:param name="search" value="${keyword}" />
										<c:param name="locale" value="zh_CN" />
									</c:url>
									<a class="dropdown-item" href="${chineseURL}">&#x4E2D;&#x6587;</a>
								</div>
							</c:if> <c:if test="${localeURI == '/index.jsp'}">
								<div class="dropdown-menu">

									<c:url value="index.jsp" var="englishURL">
										<c:param name="locale" value="en_US" />
									</c:url>
									<a class="dropdown-item" href="${englishURL}">English</a>
									<c:url value="index.jsp" var="chineseURL">
										<c:param name="locale" value="zh_CN" />
									</c:url>
									<a class="dropdown-item" href="${chineseURL}">&#x4E2D;&#x6587;</a>

								</div>
							</c:if></li>
					</ul>

					<form class="navbar-form navbar-left" action="searchServlet">
						<div class="input-group" style="height: 35px;">
						<input type="hidden" name="locale" value="${loc}">
							<input type="text" class="form-control"
								placeholder="<fmt:message key="search"/>"
								style="border-radius: 10px 0px 0px 10px;" name="search">
							<div class="input-group-btn">
								<button class="btn"
									style="background-color: #2296F3; height: 100%; border-radius: 0px 10px 10px 0px;"
									type="submit">
									<i class="fa fa-search"></i>
								</button>
							</div>
						</div>
					</form>
				</div>


		
		</nav>



		<div class="modal fade login" id="id01">
			<div class="modal-dialog login animated">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">
							<fmt:message key="login" />
						</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<div class="box">
							<div class="content">

								<div class="error"></div>
								<div class="form loginBox">
									<form class="modal-content animate" action="loginServlet"
										method="post">

										<input id="username" name="username" required
											style="background-color: rgba(0, 0, 0, 0.09) !important;"
											type="text" placeholder="<fmt:message key="username" />">

										<input id="password" name="password" required
											style="background-color: rgba(0, 0, 0, 0.09) !important;"
											type="password" placeholder="<fmt:message key="password" />">

										<input type="submit" class="btn btn-default btn-login"
											type="button" value="<fmt:message key="login" />">


									</form>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<div class="forgot login-footer">
							<span><fmt:message key="lookingTo" /> <a
								href="registrationForm.jsp"><fmt:message
										key="createAnAccount" /></a> ?</span>
						</div>

					</div>
				</div>
			</div>
		</div>
	</header>
	<!-- Header-wrap Section End -->

</fmt:bundle>