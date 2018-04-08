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
    <title>
      Team Page
    </title>
    <!-- Bootstrap -->
     <link rel="stylesheet" type="text/css" href="assets/css/header.css">
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
    <!-- Main Style -->
    <link rel="stylesheet" type="text/css" href="assets/css/main.css">
    <!-- Slicknav Css -->
    <link rel="stylesheet" type="text/css" href="assets/css/slicknav.css">

    <!-- Responsive Style -->
    <link rel="stylesheet" type="text/css" href="assets/css/responsive.css">
    <!--Fonts-->
    <link rel="stylesheet" media="screen" href="assets/fonts/font-awesome/font-awesome.min.css">
    <link rel="stylesheet" media="screen" href="assets/fonts/simple-line-icons.css">    
     
    <!-- Extras -->
    <link rel="stylesheet" type="text/css" href="assets/extras/owl/owl.carousel.css">
    <link rel="stylesheet" type="text/css" href="assets/extras/owl/owl.theme.css">
    <link rel="stylesheet" type="text/css" href="assets/extras/animate.css">
    <link rel="stylesheet" type="text/css" href="assets/extras/normalize.css">
    

    <!-- Color CSS Styles  -->  
    <link rel="stylesheet" type="text/css" href="assets/css/colors/green.css" media="screen" /> 
    
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
    <!-- Header area wrapper starts -->
   <%@include file ="header.jsp" %> 
    <!-- Header-wrap Section End -->
  
    
    <!-- Page Header -->
    <div class="page-header-section">
      <div class="container">
        <div class="row">
          <div class="page-header-area">
            <div class="page-header-content">
              <h2><fmt:message key="team" /></h2>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Page Header End -->
    <!-- Team Section -->
    <section id="team" class="section">
      <!-- Container Starts -->
      <div class="container">  
        <h1 class="section-title wow fadeInUpQuick">
          <fmt:message key="meetOurTeam" />
        </h1>
             
        <!-- Row Starts -->
        <div class="row">          
          <div class="col-sm-6 col-md-3">
            <!-- Team Item Starts -->
            <div class="team-item wow fadeInUpQuick" data-wow-delay="1s">
              <figure class="team-profile">
                <img src="assets/img/team/team1.png" alt="">
                <figcaption class="our-team">
                  <div class="details">
                    <p class="content-white">Worked on the chatting and search functionality.</p>
                   <div class="orange-line"></div>
                   <div class="social"> 
                     <a class="facebook" href="http://www.facebook.com"><i class="fa fa-facebook"></i></a> 
                     <a class="twitter" href="http://www.twitter.com"><i class="fa fa-twitter"></i></a> 
                     <a class="google-plus" href="http://plus.google.com"><i class="fa fa-google-plus"></i></a>
                   </div>
                  </div>
                </figcaption>
              </figure>
              <div class="info">
                <h2>
                  Julia Wang
                </h2>
                <div class="orange-line"></div>
                <p>
                  <fmt:message key="teamLeader" />
                </p>
              </div>
            </div>
            <!-- Team Item Ends -->
          </div>

          <div class="col-sm-6 col-md-3">
            <!-- Team Item Starts -->
            <div class="team-item wow fadeInUpQuick" data-wow-delay="1.1s">
             <figure class="team-profile">
                 <img src="assets/img/team/team2.png" alt="">
                <figcaption class="our-team">
                  <div class="details">
                    <p class="content-white">Worked on internationalization and geolocation.</p>
                   <div class="orange-line"></div>
                   <div class="social"> 
                     <a class="facebook" href="http://www.facebook.com"><i class="fa fa-facebook"></i></a> 
                     <a class="twitter" href="http://www.twitter.com"><i class="fa fa-twitter"></i></a> 
                     <a class="google-plus" href="http://plus.google.com"><i class="fa fa-google-plus"></i></a>
                   </div>
                  </div>
                </figcaption>
              </figure>
              <div class="info">
                <h2>
	                  Chi Jon
                </h2>
                <div class="orange-line"></div>
                <p>
                 <fmt:message key="backEndDev" />
                </p>
              </div>
            </div><!-- Team Item Starts -->
          </div>



          <div class="col-sm-6 col-md-3">
            <!-- Team Item Starts -->
            <div class="team-item wow fadeInUpQuick" data-wow-delay="1.2s">
             <figure class="team-profile">
                 <img src="assets/img/team/team3.png" alt="">
                <figcaption class="our-team">
                  <div class="details">
                    <p class="content-white">Worked on the bidding funcitonality.</p>
                   <div class="orange-line"></div>
                   <div class="social"> 
                     <a class="facebook" href="http://www.facebook.com"><i class="fa fa-facebook"></i></a> 
                     <a class="twitter" href="http://www.twitter.com"><i class="fa fa-twitter"></i></a> 
                     <a class="google-plus" href="http://plus.google.com"><i class="fa fa-google-plus"></i></a>
                   </div>
                  </div>
                </figcaption>
              </figure>
              <div class="info">
                <h2>
                 Billy
                </h2>
                <div class="orange-line"></div>
                <p>
                  <fmt:message key="backEndDev" />
                </p>
              </div>
            </div><!-- Team Item Starts -->
          </div>
    <div class="col-sm-6 col-md-3">
            <!-- Team Item Starts -->
            <div class="team-item wow fadeInUpQuick" data-wow-delay="1.2s">
              <figure class="team-profile">
                  <img src="assets/img/team/team4.png" alt="">
                <figcaption class="our-team">
                  <div class="details">
                    <p class="content-white">Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
                   <div class="orange-line"></div>
                   <div class="social"> 
                     <a class="facebook" href="http://www.facebook.com"><i class="fa fa-facebook"></i></a> 
                     <a class="twitter" href="http://www.twitter.com"><i class="fa fa-twitter"></i></a> 
                     <a class="google-plus" href="http://plus.google.com"><i class="fa fa-google-plus"></i></a>
                   </div>
                  </div>
                </figcaption>
              </figure>
              <div class="info">
                <h2>
                  Anita
                </h2>
                <div class="orange-line"></div>
                <p>
                 <fmt:message key="backEndDev" />
                </p>
              </div>
            </div>
            <!-- Team Item Ends -->
          </div>

          <div class="col-sm-6 col-md-3">
            <!-- Team Item Starts -->
            <div class="team-item wow fadeInUpQuick" data-wow-delay="1.4s">
              <figure class="team-profile">
                  <img src="assets/img/team/team5.png" alt="">
                <figcaption class="our-team">
                  <div class="details">
                    <p class="content-white">Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
                   <div class="orange-line"></div>
                   <div class="social"> 
                     <a class="facebook" href="http://www.facebook.com"><i class="fa fa-facebook"></i></a> 
                     <a class="twitter" href="http://www.twitter.com"><i class="fa fa-twitter"></i></a> 
                     <a class="google-plus" href="http://plus.google.com"><i class="fa fa-google-plus"></i></a>
                   </div>
                  </div>
                </figcaption>
              </figure>
              <div class="info">
                <h2>
                  Dylan
                </h2>
                <div class="orange-line"></div>
                <p>
                  <fmt:message key="backEndDev" />
                </p>
              </div>
            </div>
            <!-- Team Item Ends -->
          </div>
          
          <div class="col-sm-6 col-md-3">
            <!-- Team Item Starts -->
            <div class="team-item wow fadeInUpQuick" data-wow-delay="1.6s">
              <figure class="team-profile">
                <img src="assets/img/team/team6.png" alt="">
                <figcaption class="our-team">
                  <div class="details">
                    <p class="content-white">Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
                   <div class="orange-line"></div>
                   <div class="social"> 
                     <a class="facebook" href="http://www.facebook.com"><i class="fa fa-facebook"></i></a> 
                     <a class="twitter" href="http://www.twitter.com"><i class="fa fa-twitter"></i></a> 
                     <a class="google-plus" href="http://plus.google.com"><i class="fa fa-google-plus"></i></a>
                   </div>
                  </div>
                </figcaption>
              </figure>
              <div class="info">
                <h2>
                  Farah
                </h2>
                <div class="orange-line"></div>
                <p>
                  <fmt:message key="frontEndDev" />
                </p>
              </div>
            </div><!-- Team Item Ends -->
          </div>          
        </div><!-- Row Ends -->
        
        
      </div><!-- Container Ends -->
    </section>
    <!-- Team Section End -->
    
   
    <!-- Cool Facts Section End -->

    <section class="section">
      <div class="container wow fadeIn" data-wow-delay="0.3s">
        <h1 class="section-title"><fmt:message key="whyChooseUs" /></h1>
        
        <div class="row">          
          <div class="col-md-6 about2-intro-image">
            <img src="assets/img/about/team.jpg" alt="">
          </div>
          <div class="col-md-6">
            <h3 class="small-title">
              <fmt:message key="ourSpecialty" />
            </h3>
            <p><fmt:message key="ourSpecialtyMessage" /></p>
            <div id="default-tab" class="mt-10">
                <!-- Nav tabs -->
                <ul class="nav nav-tabs" role="tablist">
                  <li class="nav-item"><a class="nav-link active" href="#home" aria-controls="home" role="tab" data-toggle="tab"><fmt:message key="work" /></a></li>
                  <li class="nav-item"><a class="nav-link" href="#profile" aria-controls="profile" role="tab" data-toggle="tab"><fmt:message key="planning" /></a></li>
                  <li class="nav-item"><a class="nav-link" href="#messages" aria-controls="messages" role="tab" data-toggle="tab"><fmt:message key="idea" /></a></li>
                  <li class="nav-item"><a class="nav-link" href="#settings" aria-controls="settings" role="tab" data-toggle="tab"><fmt:message key="team" /></a></li>
                </ul>

                <!-- Tab panes -->
                <div class="tab-content">
                  <div role="tabpanel" class="tab-pane active" id="home">
                    <p><fmt:message key="workMessage" /></p>
                   
                  </div>
                  <div role="tabpanel" class="tab-pane" id="profile">
                    <p><fmt:message key="planningMessage" /></p>
                  </div>
                  <div role="tabpanel" class="tab-pane" id="messages">
                    <p><fmt:message key="ideaMessage" /></p>
                  </div>
                  <div role="tabpanel" class="tab-pane" id="settings">
                    <p><fmt:message key="teamMessage" /></p>
                  </div>
                </div>
              </div>
          </div>
        </div>
      </div>
    </section>
    
   <%@include file ="footer.jsp" %> 
    
    <!-- Go To Top Link -->
    <a href="#" class="back-to-top">
      <i class="fa fa-angle-up">
      </i>
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