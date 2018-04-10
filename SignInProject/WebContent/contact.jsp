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
      Contact
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
    <style>
       #map {
        height: 400px;
        width: 69%;
       }
       html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
        #floating-panel {
    
        position: relative;
        float:left;
        top: 10px;
        left: 25%;
        z-index: 5;
        background-color: #fff;
        padding: 5px;
        border: 1px solid #999;
        text-align: center;
        font-family: 'Roboto','sans-serif';
        line-height: 30px;
        padding-left: 10px;
      }
       #right-panel {
           max-height:400px;
        overflow-y:scroll;
        font-family: 'Roboto','sans-serif';
        line-height: 30px;
        padding-left: 10px;
      }

      #right-panel select, #right-panel input {
        font-size: 15px;
      }

      #right-panel select {
        width: 100%;
      }

      #right-panel i {
        font-size: 12px;
      }
      #right-panel {
        height: 100%;
        float: right;
        width: 390px;
        overflow: auto;
      }
      #map {
        margin-right: 400px;
      }
      #floating-panel {
        background: #fff;
        padding: 5px;
        font-size: 14px;
        font-family: Arial;
        border: 1px solid #ccc;
        box-shadow: 0 2px 2px rgba(33, 33, 33, 0.4);
        display: none;
      }
      @media print {
        #map {
          height: 500px;
          margin: 0;
        }
        #right-panel {
          float: none;
          width: auto;
        }
      }
    </style>

  </head>
  <body>
<fmt:bundle basename="MessagesBundle">
 <%@include file="header.jsp" %>

    <!-- Page Header -->
    <div class="page-header-section">
      <div class="container">
        <div class="row">
          <div class="page-header-area">
            <div class="page-header-content">
              <h2><fmt:message key="directionToWareHouse" /></h2>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Page Header End -->

   <div id="floating-panel">
     <strong><fmt:message key="travelMode" />:</strong>
     <select id="mode">
      <option value="DRIVING"><fmt:message key="driving" /></option>
      <option value="WALKING"><fmt:message key="walking" /></option>
      <option value="BICYCLING"><fmt:message key="bicycling" /></option>
      <option value="TRANSIT"><fmt:message key="transit" /> </option>
    </select>
      <strong><fmt:message key="end" />:</strong>
      <select id="end">
        <option value="" selected="true" disabled="disabled"><fmt:message key="selectWareHouse" /></option>
        <option value="333 Laurier, Ottawa, Ontario, Canada"><fmt:message key="office" /></option>
        <option value="311 Bell st, Ottawa,Ontario, Canada"><fmt:message key="warehouse" /> 1</option>
        <option value="424 June court, Ottawa, Ontario, Canada"><fmt:message key="warehouse" /> 2</option>
        <option value="1343 Meadowlands Drive, Ottawa, Ontario, Canada"><fmt:message key="warehouse" /> 3</option>
      </select>
    </div>
    <div id="right-panel"></div>
    <div id="map"></div>
    <script>
      function initMap() {
        var directionsDisplay = new google.maps.DirectionsRenderer;
        var directionsService = new google.maps.DirectionsService;
        navigator.geolocation.getCurrentPosition(function(position) {
        var pos =  new google.maps.LatLng(
                position.coords.latitude, position.coords.longitude);
        
        
        var map = new google.maps.Map(document.getElementById('map'), {
            zoom: 15,
            center: pos
          });
        
   
        
          directionsDisplay.setMap(map);
          directionsDisplay.setPanel(document.getElementById('right-panel'));

          var control = document.getElementById('floating-panel');
          control.style.display = 'block';
          map.controls[google.maps.ControlPosition.TOP_CENTER].push(control);

          var onChangeHandler = function() {
            calculateAndDisplayRoute(directionsService, directionsDisplay,pos);
            
          };
          document.getElementById('mode').addEventListener('change', onChangeHandler);
          document.getElementById('end').addEventListener('change', onChangeHandler);
        
       
        });
        
       
      }

      function calculateAndDisplayRoute(directionsService, directionsDisplay,pos) {
        var travelMode = document.getElementById('mode').value;
        var end = document.getElementById('end').value;
        directionsService.route({
          origin: pos,
          destination: end,
          travelMode: travelMode
        }, function(response, status) {
          if (status === 'OK') {
            directionsDisplay.setDirections(response);
          } else {
            window.alert('Directions request failed due to ' + status);
          }
        });
      }
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBKEJhoCYia03Y-jQa9-dIR7gSlUxx6aXQ&callback=initMap">
    </script>
    
    
    <!-- Contact Section -->
    <section class="contact-form-section section">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-50 text-center contact-title-text wow fadeIn" data-wow-delay="0.3s">
            <h2><fmt:message key="contactWithUs" />!</h2>
            <p><fmt:message key="doYouWantToKnowMore" />? <fmt:message key="weLoveToHearFromYou" />!</p>
          </div>
          <div class="col-md-4 contact-info-section">
            <div class="contact-widget office-location">
              <h2><fmt:message key="officeLocation" /></h2>
              <address>
                <i class="fa fa-map-marker icon-box icon-xs"></i>333 Laurier Street , Ottawa, Ontario<br>
                <i class="fa fa-phone icon-box icon-xs"></i> 613-240-4015<br>
                <a href="mailto:chiJon@algonquinlive.com"><i class="fa fa-envelope icon-box icon-xs"></i> chiJon@algonquinlive.com</a>
              </address>
            </div>
            <div class="contact-widget office-location">
              <h2><fmt:message key="contactHours" /></h2>
              <address>
                <p><i class="fa fa-clock-o icon-box icon-xs"></i> <span>Mon - Fri:</span> 9.00 AM - 6.00 PM</p>
              </address>
            </div>
            <div class="contact-widget social-contact">
              <h2><fmt:message key="socialQuickLinks" /></h2>
              <a href="https://www.facebook.com/"><i class="fa fa-facebook icon-round icon-xs"></i></a>
              <a href="https://www.twitter.com/"><i class="fa fa-twitter icon-round icon-xs"></i></a>
              <a href="https://www.linkedin.com/"><i class="fa fa-linkedin icon-round icon-xs"></i></a>
              <a href="#"><i class="fa fa-google-plus icon-round icon-xs"></i></a>
              <a href="#"><i class="fa fa-github icon-round icon-xs"></i></a>
            </div>
          </div>
          <div class="col-md-7 col-md-offset-1 contact-form contact-info-section">
            <form class="shake" role="form" method="post" action="contactServlet" id="contactForm" name="contact-form" data-toggle="validator">
              <div class="form-group">
                <label for="name" class="sr-only">Name</label>
                <input type="text" placeholder="<fmt:message key="yourName" />" id="name" class="form-control contact-control" name="name" required data-error="Please enter your name">
                <div class="help-block with-errors"></div>
              </div>

              <div class="form-group">
                <label for="email2" class="sr-only">Email</label>
                <input type="email" placeholder="<fmt:message key="yourEmail" />" id="email2" class="form-control contact-control" name="email2" required data-error="Please enter your Email">
                <div class="help-block with-errors"></div>
              </div>

              <div class="form-group">
                <label for="subject" class="sr-only">Subject</label>
                <input type="text" placeholder="<fmt:message key="yourSubject" />" id="msg_subject" class="form-control contact-control" name="subject" required data-error="Please enter your message subject">
                <div class="help-block with-errors"></div>
              </div>

              <div class="form-group">
                <label for="message" class="sr-only">Message</label>
                <textarea placeholder="<fmt:message key="yourMessage" />" rows="7" id="message" class="form-control" name="message" required data-error="Write your message"></textarea>
                <div class="help-block with-errors"></div>
              </div>

              <button class="btn btn-common btn-lg" type="submit" id="form-submit"><i class="fa fa-envelope"></i> <fmt:message key="submit" /></button>
              <div id="msgSubmit" class="h3 text-center hidden"></div>
              <div class="clearfix"></div>
            </form>
          </div>
        </div>
      </div>
    </section>
    <!-- Contact Section End -->

<%@include file="footer.jsp" %>
   
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