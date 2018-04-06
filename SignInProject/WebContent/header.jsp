<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<nav class="navbar navbar-expand-md  fixed-top scrolling-navbar nav-bg">
			<div class="container">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
				<c:url value="index.jsp" var="home1">
								<c:param name="locale" value="${loc}" />
							</c:url>
				
					<a class="navbar-brand" href="${home1}"> <img
						src="assets/img/logo.png" style="width: 180px; height: 90%;"
						alt="">
					</a>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#main-menu" aria-controls="main-menu"
						aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
				</div>
				<div class="collapse navbar-collapse" id="main-menu">
					<ul class="navbar-nav mr-auto w-100 justify-content-end">
						<li class="nav-item dropdown">
						<c:url value="index.jsp" var="home">
								<c:param name="locale" value="${loc}" />
							</c:url>
						<a
							class="nav-link dropdown-toggle active" href="${home}"
							aria-haspopup="true" aria-expanded="false"> <fmt:message
									key="home" />
						</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"><fmt:message
									key="auction" /></a>
							<div class="dropdown-menu">
								<c:if test="${null != sessionScope.username}">
								<a class="dropdown-item" href="auction.jsp"><fmt:message
										key="createAuction" /></a> </c:if> 
										
							<a class="dropdown-item"
									href="displayAuctionServlet"><fmt:message key="viewCurrentBids" /></a>
								
								<a class="dropdown-item" href="closedBidsServlet"><fmt:message
										key="viewEndedBids" /></a>
							</div></li>
					  <c:if test="${null != sessionScope.username}">
              
              			<!--     toggle button for  -->
					     <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">   <i class="fa fa-user icon-round icon-xs"></i>${sessionScope.username}</a>
    				<div class="dropdown-menu">
    				<c:url value="users.jsp" var="users">
								<c:param name="locale" value="${users}" />
							</c:url>
    				<c:url value="edit.jsp" var="edit">
								<c:param name="locale" value="${loc}" />
							</c:url>
    				
    					<c:if test="${role}">
									 <a class="dropdown-item" href="${users}"><fmt:message key="edit" /></a>
									</c:if>
    				
    				 <a class="dropdown-item" href="${edit}"><fmt:message key="edit" /></a>
                  <a class="dropdown-item" href="Logout.jsp"><fmt:message key="logout" /></a>
                </div>
                
              </li>       
              </c:if>
                     <c:if test="${null == sessionScope.username}">
              					<!--     toggle button for  -->
					     <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><fmt:message key="account" /></a>
    				<div class="dropdown-menu">
    				 <a class="dropdown-item" data-toggle="modal" href="#id01"><fmt:message key="login" /></a>
                  <a class="dropdown-item" href="registrationForm.jsp"><fmt:message key="register" /></a>
                </div>               
              </li>            
              </c:if>

						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"><fmt:message
									key="language" /></a>
							<div class="dropdown-menu">
								<c:url value="index.jsp" var="englishURL">
									<c:param name="locale" value="en_US" />
								</c:url>
								<a class="dropdown-item" href="${englishURL}">English</a>
								<c:url value="index.jsp" var="chineseURL">
									<c:param name="locale" value="zh_CN" />
								</c:url>
								<a class="dropdown-item" href="${chineseURL}">&#x4E2D;&#x6587;</a>
							</div></li>



					</ul>

					<form class="navbar-form navbar-left" action="searchServlet">
					<div class="input-group" style="height:35px;">
						<input type="text" class="form-control"
							placeholder="<fmt:message key="search"/>" style="border-radius:10px 0px 0px 10px;" name="search">
						<div class="input-group-btn">
							<button class="btn" style="background-color:#2296F3; height:100%; border-radius: 0px 10px 10px 0px;" type="submit">
								   <i class="fa fa-search"></i>
							</button>
						</div>
					</div>
				</form>
				</div>


			</div>
		</nav>


		
		 <div class="modal fade login" id="id01">
		      <div class="modal-dialog login animated">
    		      <div class="modal-content">
    		         <div class="modal-header">
    		          <h4 class="modal-title"><fmt:message key="login" /></h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>              
                    </div>
                    <div class="modal-body">  
                        <div class="box">
                             <div class="content">
              
                                <div class="error"></div>
                                <div class="form loginBox">
                            <form class="modal-content animate"  action="loginServlet" method="post">
                                    
                                    <input id="username" name="username" required style="background-color:rgba(0,0,0,0.09)!important;"  type="text" placeholder="<fmt:message key="username" />">
                                   
                                      <input id="password" name="password" required style="background-color:rgba(0,0,0,0.09)!important;"  type="password" placeholder="<fmt:message key="password" />">
                                    
                                    <input type="submit" class="btn btn-default btn-login" type="button" value="<fmt:message key="login" />" >
                                
						
                                    </form>
                                </div>
                             </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="forgot login-footer">
                            <span><fmt:message key="lookingTo" />
                                 <a href="registrationForm.jsp"><fmt:message key="createAnAccount" /></a>
                            ?</span>
                        </div>
    
                    </div>        
    		      </div>
		      </div>
		  </div>
	</header>
	<!-- Header-wrap Section End -->

</fmt:bundle>