<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<!-- Viewport Meta Tag -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Seller's feedback</title>
<!-- Bootstrap -->
 <link rel="stylesheet" type="text/css" href="assets/css/header.css">
	<script src="assets/js/jquery-min.js"></script>
	
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
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">

<!-- Color CSS Styles  -->
<link rel="stylesheet" type="text/css"
	href="assets/css/colors/green.css" media="screen" />
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js">
    </script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js">
    </script>
    <![endif]-->


<style>
.rating {
  cursor: pointer;
}

.rating .rating-star {
  display: inline-block;
  position: relative;
  padding-right: 5px;
  margin-left: -5px;
  color: #e3cf7a;
}
.rating .selected:before {
  content: '\f005';
}
    .center-div
{
     margin: 0 auto;
     width: 100px; 
}
</style>

</head>
<body>

	  <!-- Contact Section -->
 <!-- Contact Section -->
    <section class="contact-form-section section">
      <div class="container">
        <div class="row" data-wow-delay="0.3s">
          <div class="col-md-12 mb-50 text-center contact-title-text wow fadeIn" data-wow-delay="0.3s">
            <h2>Seller's rating</h2>
          </div>
          <div  class="col-md-7 col-md-offset-1 text-center  center-div " >
           

<h2 id="message">Leave ${param.seller} a rating.</h2>
   <div class="rating" role="optgroup" >
      <!-- in Rails just use 1.upto(5) -->  
      <i class="fa fa-star-o fa-2x rating-star" id="rating-1" data-rating="1" tabindex="0" aria-label="Rate as one out of 5 stars" role="radio"></i>
      <i class="fa fa-star-o fa-2x rating-star" id="rating-2" data-rating="2" tabindex="0" aria-label="Rate as two out of 5 stars" role="radio"></i>
      <i class="fa fa-star-o fa-2x rating-star" id="rating-3" data-rating="3" tabindex="0" aria-label="Rate as three out of 5 stars" role="radio"></i>
      <i class="fa fa-star-o fa-2x rating-star" id="rating-4" data-rating="4" tabindex="0" aria-label="Rate as four out of 5 stars" role="radio"></i>
      <i class="fa fa-star-o fa-2x rating-star" id="rating-5" data-rating="5" tabindex="0" aria-label="Rate as five out of 5 stars" role="radio"></i>
    </div>
    <form method="post" >
      <!-- hide the input -->  
     <input type="hidden"  name="rating" id="rating-input" value="9"><br/><br/>
     <input value="Rate" type="button" class="btn btn-primary" style="width:90px;" id="submit" name="submit">

    </form>
    <br/><br/>
    <div id="thank"></div>
     </div>
        </div>
      </div>
    </section>
    
<script type="text/javascript">

$(document).ready(function () {
	  
	  function setRating(rating) {
	    $('#rating-input').val(rating);
	    
	 
	    // fill all the stars assigning the '.selected' class
	    $('.rating-star').removeClass('fa-star-o').addClass('selected');
	    // empty all the stars to the right of the mouse
	    $('.rating-star#rating-' + rating + ' ~ .rating-star').removeClass('selected').addClass('fa-star-o');
	  }
	  
	  $('.rating-star')
	  .on('mouseover', function(e) {
	    var rating = $(e.target).data('rating');
	    // fill all the stars
	    $('.rating-star').removeClass('fa-star-o').addClass('fa-star');
	    // empty all the stars to the right of the mouse
	    $('.rating-star#rating-' + rating + ' ~ .rating-star').removeClass('fa-star').addClass('fa-star-o');
	  })
	  .on('mouseleave', function (e) {
	    // empty all the stars except those with class .selected
	    $('.rating-star').removeClass('fa-star').addClass('fa-star-o');
	  })
	  .on('click', function(e) {
	    var rating = $(e.target).data('rating');
	    setRating(rating);
	  })
	  .on('keyup', function(e){
	    // if spacebar is pressed while selecting a star
	    if (e.keyCode === 32) {
	      // set rating (same as clicking on the star)
	      var rating = $(e.target).data('rating');
	      setRating(rating);
	    }
	  });
	});

</script>

 
 <script>
 

 $(document).ready(function () {
 $('#submit').click(function(){
	 var ratingstr = $("#rating-input").val();
	

	 $.ajax(
			 { 
				 type:'POST',
				 data:{rating:ratingstr},
				 async: false,
				 url:'sellerFeedbackServlet',
				 success:function(result){					 
					 $('#thank').html(result);					 
				 }
			 })
	 
	 
 }); 
 });
 </script>


	<!-- Classic Blog Section End -->

	<!-- Footer Section -->

	<!-- Footer Section End-->

	<!-- Go To Top Link -->

	

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

</body>
</html>