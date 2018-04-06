<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <!-- Header area wrapper starts -->
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:bundle basename="MessagesBundle">  



 <!-- Footer Section -->
    <footer>
      <!-- Container Starts -->
      <div class="container">
        <!-- Row Starts -->
        <div class="row section">
          <!-- Footer Widget Starts -->
          <div class="footer-widget col-md-6 col-lg-8 col-xs-12">
            <h3 class="small-title">
              <fmt:message key="aboutUs" />
            </h3>
            <p>
              <fmt:message key="aboutUsMessage" /> 
            </p> 
            <ul class="mb-3">
              <li><i class="fa fa-map-marke"></i> 424 June Court , Ottawa, Ontario</li>
              <li><i class="fa fa-phone"></i> (613) 501-5599 </li>
              <li><i class="fa fa-phone"></i> (613) 501-5523</li>              
            </ul>   
          </div><!-- Footer Widget Ends -->
          
          <!-- Footer Widget Starts -->
          <div class="footer-widget col-md-6 col-lg-3 col-xs-12">
            <h3 class="small-title">
              <fmt:message key="quickLinks" />
            </h3>
            <ul class="menu">
      
              <li><a href="team.jsp"><fmt:message key="team" /></a></li>
               <li><a href="contact.jsp"><fmt:message key="contact" /></a></li>
              <li><a href="privacy.jsp"><fmt:message key="privacyPolicy" /></a></li>
                <li><a href="contact.jsp"><fmt:message key="shipping" /></a></li>
                <li><a href="faq.jsp"><fmt:message key="faq" /></a></li>
              <li><a href="condition.jsp"><fmt:message key="terms" /></a></li>
            </ul>

         
          </div>
              <div class="col-md-6 col-sm-6">
              <p class="copyright-text">
                <fmt:message key="copyright" /><a href="mailto:wang0401@algonquinlive.com"> Team OttawaUction</a>
                
                
              </p>
            </div>
          <!-- Footer Widget Ends -->

         
        </div><!-- Row Ends -->
      </div><!-- Container Ends -->
      
      
    </footer>
    <!-- Footer Section End-->
                   <!-- Go To Top Link -->
    <a href="#" class="back-to-top">
      <i class="fa fa-angle-up">
      </i>
    </a> 
 </fmt:bundle>