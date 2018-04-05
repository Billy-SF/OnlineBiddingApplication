<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Header area wrapper starts -->
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
    
    <title>
      OttawAuction
    </title>
    
    <!-- Bootstrap -->
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
    

 
	<link href="assets/css/login-register.css" rel="stylesheet" />

	
	
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

  <%@include file="header.jsp" %>
   
     	<!-- Main Carousel Section -->
		<div id="carousel-area">
			<div id="carousel-slider" class="carousel slide" data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carousel-slider" data-slide-to="0" class="active"></li>
					<li data-target="#carousel-slider" data-slide-to="1"></li>
					<li data-target="#carousel-slider" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img class="d-block w-100" src="assets/img/slider/bike.jpg" alt="">
						<div class="carousel-caption">
							<h2 class="fadeInUp wow" data-sppb-wow-delay="0.8s"><fmt:message key="messageC1" /></h2>
							<h3 class="fadeInUp wow" data-sppb-wow-delay="1.2s"><fmt:message key="messageC11" /></h3>

						</div>
					</div>
					<div class="carousel-item">
						<img class="d-block w-100" src="assets/img/slider/ipad.jpg" alt="">
						<div class="carousel-caption">
							<h2 class="fadeInUp wow" data-sppb-wow-delay="0.8s"><fmt:message key="messageC2" /></h2>
							<h3 class="fadeInUp wow" data-sppb-wow-delay="1.2s"><fmt:message key="messageC22" /></h3>

						</div>
					</div>
					<div class="carousel-item">
						<img class="d-block w-100" src="assets/img/slider/backpack.jpg"
							alt="">
						<div class="carousel-caption">
							<h2 class="fadeInUp wow" data-sppb-wow-delay="0.8s"><fmt:message key="messageC3" /></h2>
							<h3 class="fadeInUp wow" data-sppb-wow-delay="1.2s"><fmt:message key="messageC33" /></h3>

						</div>
					</div>
				</div>
				<a class="carousel-control-prev" href="#carousel-slider"
					role="button" data-slide="prev"> <span
					class="carousel-control carousel-control-prev-icon"
					aria-hidden="true"></span> <span class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carousel-slider"
					role="button" data-slide="next"> <span
					class="carousel-control carousel-control-next-icon"
					aria-hidden="true"></span> <span class="sr-only">Next</span>
				</a>
			</div>
		</div>

      
    <!-- Service Block-1 Section -->
    <section id="service-block-main" class="section">
      <!-- Container Starts -->
      <div class="container">
        <h1 class="section-title wow fadeIn animated" data-wow-delay=".2s">
        Current Bids
        </h1>
        <div class="row">  
          <div class="col-sm-6 col-md-6 col-lg-3 col-xs-12">
            <!-- Service-Block-1 Item Starts -->
            <div class="service-item wow fadeInUpQuick animated" data-wow-delay=".3s">
              <div class="client-item-wrapper">
              <img src="assets/img/products/cake.jpg" style="min-height:200px; max-width:200px;max-height:200px;" alt="">
            </div>
              <h2>
                40+ Pages
              </h2>
              <p>
                Pellentesque ipsum erat, facilisis ut venenatis eu, sodales vel dolor.
              </p>
            </div>
            <!-- Service-Block-1 Item Ends -->
          </div>

       

          <div class="col-sm-6 col-md-6 col-lg-3 col-xs-12">
            <!-- Service-Block-1 Item Starts -->
            <div class="service-item wow fadeInUpQuick animated" data-wow-delay=".3s">
               <div class="client-item-wrapper">
              <img src="assets/img/products/car.jpg" style="min-height:200px;max-width:200px;max-height:200px;" alt="">
            </div>
              <h2>
                Refreshing Design
              </h2>
              <p>
                Pellentesque ipsum erat, facilisis ut venenatis eu, sodales vel dolor.
              </p>
            </div>
            <!-- Service-Block-1 Item Ends -->
          </div>
          
             <div class="col-sm-6 col-md-6 col-lg-3 col-xs-12">
            <!-- Service-Block-1 Item Starts -->
            <div class="service-item wow fadeInUpQuick animated" data-wow-delay=".3s">
               <div class="client-item-wrapper">
              <img src="assets/img/products/rolex.jpg" style="min-height:200px;max-width:200px;max-height:200px;" alt="">
            </div>
              <h2>
                Bootstrap4 and HTML5
              </h2>
              <p>
                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repellat Quidem!
              </p>
            </div>
            <!-- Service-Block-1 Item Ends -->
          </div>

          <div class="col-sm-6 col-md-6 col-lg-3 col-xs-12">
            <!-- Service-Block-1 Item Starts -->
            <div class="service-item  wow fadeInUpQuick animated" data-wow-delay=".3s">
              <div class="client-item-wrapper">
              <img src="assets/img/products/snowman.jpg" style="min-height:200px;max-width:200px;max-height:200px;" alt="">
            </div>
              <h2>
                Crafted Carefully
              </h2>
              <p>
                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repellat Quidem!
              </p>
            </div>
          </div><!-- Service-Block-1 Item Ends -->
        </div>
      </div><!-- Container Ends -->
    </section><!-- Service Main Section Ends -->


 

 <!-- Testimonial Section -->
    <section id="testimonial" style="background: #F6F6F6;" class="section">
      <!-- Container Starts -->
      <div class="container">
         <h1 class="section-title wow fadeIn animated">
      		User Ratings
        </h1>
        <div class="row">
          <div class="col-sm-12">
            <div id="testimonial-item" class="owl-carousel">
              <div class="item">
                <div class="testimonial-inner">
                  <div class="testimonial-images">
                    <img class="img-circle" src="assets/img/testimonial/icon1.PNG" alt="">
                    <h4>
                      Steve Austin
                    </h4>
                  </div>
                  <div class="rating-star">
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star-o"></i>
                  </div>
                  <p>
                   "My name is Steve Austin, and I'm currently looking for a job in youth services. I have 10 years of experience working with youth agencies. I have a bachelor's degree in outdoor education. I raise money, train leaders, and organize units. "
                  </p>
                </div>
              </div>
              <div class="item">
                <div class="testimonial-inner">
                  <div class="testimonial-images">
                    <img class="img-circle" src="assets/img/testimonial/icon2.PNG" alt="">
                    <h4>
                      Chelsey Siltanen 
                    </h4>
                  </div>
                  <div class="rating-star">
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star-o"></i>
                    <i class="fa fa-star-o"></i>
                  </div>
                  <p>
                    "People find me to be an upbeat, self-motivated team player with excellent communication skills. For the past several years I have worked in lead qualification, telemarketing, and customer service in the technology industry."
                  </p>
                </div>
              </div>
              <div class="item">
                <div class="testimonial-inner">
                  <div class="testimonial-images">
                    <img class="img-circle" src="assets/img/testimonial/icon3.PNG" alt="">
                    <h4>
                      Jack Ma 
                    </h4>
                  </div>
                  <div class="rating-star">
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star-o"></i>
                  </div>
                  <p>
                    "My name is Jack Ma, and I enjoy meeting new people and finding ways to help them have an uplifting experience. I have had a variety of customer service opportunities, through which I was able to have fewer returned products and increased repeat customers, when compared with co-workers.""
                  </p>
                </div>
              </div>
              <div class="item">
                <div class="testimonial-inner">
                  <div class="testimonial-images">
                    <img class="img-circle" src="assets/img/testimonial/icon3.PNG" alt="">
                    <h4>
                      Lebron James 
                    </h4>
                  </div>
                  <div class="rating-star">
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star-o"></i>
                  </div>
                  <p>
                    "My name is Lebron James, and I enjoy meeting new people and finding ways to help them have an uplifting experience. I have had a variety of customer service opportunities, through which I was able to have fewer returned products and increased repeat customers, when compared with co-workers.""
                  </p>
                </div>
              </div>
              <div class="item">
                <div class="testimonial-inner">
                  <div class="testimonial-images">
                    <img class="img-circle" src="assets/img/testimonial/icon3.PNG" alt="">
                    <h4>
                      Shawn Kemp 
                    </h4>
                  </div>
                  <div class="rating-star">
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star-o"></i>
                  </div>
                  <p>
                    "My name is Shawn Kemp, and I enjoy meeting new people and finding ways to help them have an uplifting experience. I have had a variety of customer service opportunities, through which I was able to have fewer returned products and increased repeat customers, when compared with co-workers.""
                  </p>
                </div>
              </div>
              <div class="item">
                <div class="testimonial-inner">
                  <div class="testimonial-images">
                    <img class="img-circle" src="assets/img/testimonial/icon3.PNG" alt="">
                    <h4>
                      Chi Jon
                    </h4>
                  </div>
                  <div class="rating-star">
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star-o"></i>
                  </div>
                  <p>
                    "My name is  Chi Jon, and I enjoy meeting new people and finding ways to help them have an uplifting experience. I have had a variety of customer service opportunities, through which I was able to have fewer returned products and increased repeat customers, when compared with co-workers.""
                  </p>
                </div>
              </div>
              <div class="item">
                <div class="testimonial-inner">
                  <div class="testimonial-images">
                    <img class="img-circle" src="assets/img/testimonial/icon4.PNG" alt="">
                    <h4>
                      Teddy Ed
                    </h4>
                  </div>
                  <div class="rating-star">
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                  </div>
                  <p>
                    "I am a dedicated person with a family of four. I enjoy reading, and the knowledge and perspective that my reading gives me has strengthened my teaching skills and presentation abilities."
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div><!-- Container Ends -->
    </section>
    <!-- Testimonial Section End -->                
                


  <%@include file="footer.jsp" %>
   

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
	<script src="assets/js/jquery-1.10.2.js" type="text/javascript"></script>
	</fmt:bundle>
  </body>
</html>