<!DOCTYPE html>

<html lang="en">
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="loc" value="en_US"/>
<c:if test="${!(empty param.locale)}">
  <c:set var="loc" value="${param.locale}"/>
</c:if>
<fmt:setLocale value="${param.locale}" />
<fmt:bundle basename="MessagesBundle">


<head>
<title>Privacy Policy</title>
   <meta http-equiv="Content-Type" charset="UTF-8" content="text/html">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   <link rel="stylesheet" href="customStyle.css">
 

</head>


<body>
<div id="grad1">
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <c:url value="index.jsp" var="index"> <c:param name="locale" value="${loc}"/></c:url><a class="navbar-brand" href="${index}"><b><font size="6" color="white"> <fmt:message key="ottawAction"/></font></b> </a>
    </div>
    
    <form class="navbar-form navbar-left" action="searchServlet">
      <div class="input-group">
        <input type="text" class="form-control" placeholder="<fmt:message key="search"/>" name="search">
        <div class="input-group-btn">
          <button class="btn btn-default" type="submit">
            <i class="glyphicon glyphicon-search"></i>
          </button>
        </div>
      </div>
    </form>
 
    <ul class="nav navbar-nav">
      <li><a href="index.jsp"><font size ="4" color="white"><b><fmt:message key="home"/></b></font></a></li>
     <%=session.getAttribute("username") == null ? "" : "<li><a href='auction.jsp'><font color='white'><b>Auction</b></font></a></li>"%>
       <li><a href="displayAuction.jsp"><font  size ="4" color="white"><b><fmt:message key="bids"/></b></font></a></li>
       <c:if test="${role}">
       		<li><a href="usersServlet"><font  size ="4" color="white"><b><fmt:message key="users"/></b></font></a></li>
       </c:if>
      <li><a href="contactUs.jsp"><font size ="4" color="white"><b><fmt:message key="contactUs"/></b></font></a></li>
      <li><a href="#"><font  size ="4" color="white"><b><fmt:message key="help"/></b></font></a></li>
    
    
    <li>
    <c:url value="registrationForm.jsp" var="englishURL"><c:param name="locale" value="en_US"/></c:url>
 	<a href="${englishURL}"><font size ="4" color="white"> <b>English</b></font> </a> </li>
 	
 	  <li>
 	<c:url value="registrationForm.jsp" var="chineseURL"><c:param name="locale" value="zh_CN"/></c:url>
 	 <a href="${chineseURL}"><font size ="4" color="white"><b>&#x4E2D;&#x6587;</b></font></a></li>
 	 
    </ul>
      
    </div>
</nav> 

<div class="container-fluid text-center">    
  <div class="row content">
    <div class="col-sm-2 sidenav">
      <p><a href="#"><img src="Real_Time_Bidding.png" height=100% width=100%></a></p>
      <p><a href="#"><img src="chicago.png" height=100% width=100%></a></p>
      <p><a href="#"><img src="bids.png" height=100% width=100%></a></p>
    </div>

<div class="col-sm-3"></div>


<div  class="col-sm-10">
<div> &nbsp;</div>
<div class= "panel panel-danger">
 <div class= "panel-heading" >  <b> <fmt:message key="privacyPolicy"/></b> </div>
  <div class ="panel-body" > 
  
 <p ><b><font size="6"> Privacy Notice </font></b></p>
<p align="left"><b><font size="4">This privacy notice discloses the privacy practices for (website address). This privacy notice applies solely to information collected by this website. It will notify you of the following:</font></b></p>

<p align="left">1. What personally identifiable information is collected from you through the website, how it is used and with whom it may be shared.</p>
<p align="left">2. What choices are available to you regarding the use of your data.</p>
<p align="left">3. The security procedures in place to protect the misuse of your information.</p>
<p align="left">4. How you can correct any inaccuracies in the information.</p>
<p align="left"><b><font size="4">Information Collection, Use, and Sharing</font> </b></p>
<p align="left">We are the sole owners of the information collected on this site. We only have access to/collect information that you voluntarily give us via email or other direct contact from you. We will not sell or rent this information to anyone.</p>

<p align="left">We will use your information to respond to you, regarding the reason you contacted us. We will not share your information with any third party outside of our organization, other than as necessary to fulfill your request, e.g. to ship an order.</p>

<p align="left">Unless you ask us not to, we may contact you via email in the future to tell you about specials, new products or services, or changes to this privacy policy.</p>

<p align="left"><b><font size="4">Your Access to and Control Over Information</font></b></p>
<p align="left">You may opt out of any future contacts from us at any time. You can do the following at any time by contacting us via the email address or phone number given on our website:</p>

<p align="left">See what data we have about you, if any.</p>
<p align="left">Change/correct any data we have about you.</p>
<p align="left">Have us delete any data we have about you.</p>
<p align="left">Express any concern you have about our use of your data.</p>
<p align="left"><b><font size="4">Security</font> </b></p>
<p align="left">We take precautions to protect your information. When you submit sensitive information via the website, your information is protected both online and offline.</p>

<p align="left">Wherever we collect sensitive information (such as credit card data), that information is encrypted and transmitted to us in a secure way. You can verify this by looking for a lock icon in the address bar and looking for "https" at the beginning of the address of the Web page.</p>

<p align="left">While we use encryption to protect sensitive information transmitted online, we also protect your information offline. Only employees who need the information to perform a specific job (for example, billing or customer service) are granted access to personally identifiable information. The computers/servers in which we store personally identifiable information are kept in a secure environment.</p>

<p align="left">If you feel that we are not abiding by this privacy policy, you should contact us immediately via telephone at XXX YYY-ZZZZ or via email.
 
<p align="left"><b><font size="4"> Registration </font> </b></p>
<p align="left">In order to use this website, a user must first complete the registration form. During registration a user is required to give certain information (such as name and email address). This information is used to contact you about the products/services on our site in which you have expressed interest. At your option, you may also provide demographic information (such as gender or age) about yourself, but it is not required.</p>


<p align="left"><b><font size="4">Orders  </font> </b></p>
<p align="left">We request information from you on our order form. To buy from us, you must provide contact information (like name and shipping address) and financial information (like credit card number, expiration date). This information is used for billing purposes and to fill your orders. If we have trouble processing an order, we'll use this information to contact you.</p>

<p align="left">If you use cookies or other devices that track site visitors, insert a paragraph like this in your privacy notice: </p>
<p align="left"><b><font size="4">Cookies  </font> </b></p>
<p align="left">We use "cookies" on this site. A cookie is a piece of data stored on a site visitor's hard drive to help us improve your access to our site and identify repeat visitors to our site. For instance, when we use a cookie to identify you, you would not have to log in a password more than once, thereby saving time while on our site. Cookies can also enable us to track and target the interests of our users to enhance the experience on our site. Usage of a cookie is in no way linked to any personally identifiable information on our site.</p>

<p align="left">If other organizations use cookies or other devices that track site visitors to your site, insert a paragraph like this in your privacy notice: </p>
<p align="left">Some of our business partners may use cookies on our site (for example, advertisers). However, we have no access to or control over these cookies.</p>

<p align="left">If you share information collected on your site with other parties, insert one or more of these paragraphs in your privacy notice: </p>
<p align="left"><b><font size="4">Sharing </font> </b></p>
<p align="left">We share aggregated demographic information with our partners and advertisers. This is not linked to any personal information that can identify any individual person.</p>

<p align="left"><b>And/or: </b></p>
<p align="left">We use an outside shipping company to ship orders, and a credit card processing company to bill users for goods and services. These companies do not retain, share, store or use personally identifiable information for any secondary purposes beyond filling your order.</p>

<p align="left"><b>And/or: </b></p>
<p align="left">We partner with another party to provide specific services. When the user signs up for these services, we will share names, or other contact information that is necessary for the third party to provide these services. These parties are not allowed to use personally identifiable information except for the purpose of providing these services.</p>

<p align="left">If your site has links to other sites, you might insert a paragraph like this in your privacy notice: </p>
<p align="left"><b><font size="4">Links </font> </b></p>
<p align="left">This website contains links to other sites. Please be aware that we are not responsible for the content or privacy practices of such other sites. We encourage our users to be aware when they leave our site and to read the privacy statements of any other site that collects personally identifiable information.</p>

<p align="left">If you ever collect data through surveys or contests on your site, you might insert a paragraph like this in your privacy notice: </p>
<p align="left"><b><font size="4">Surveys & Contests </font> </b></p>
<p align="left">From time-to-time our site requests information via surveys or contests. Participation in these surveys or contests is completely voluntary and you may choose whether or not to participate and therefore disclose this information. Information requested may include contact information (such as name and shipping address), and demographic information (such as zip code, age level). Contact information will be used to notify the winners and award prizes. Survey information will be used for purposes of monitoring or improving the use and satisfaction of this site</p> 
 
 
 
 
 
 
  
  
  
 
	</div>
</div>	
 </div>	
  </div>
</div>
</div>

<footer class="container-fluid text-center">
  <div class="navbar-header">
      <a href="#"><b><font size="6" color="white">OttawAuction</font></b></a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="#"><font size ="4" color="white"><b>© OttawAuction</b></font></a></li>
   </ul>
     <ul class="nav navbar-nav"> 
      <li><a href="#"><font size ="4" color="white"><b><fmt:message key="faq"/></b></font></a></li>
      <li><a href="#"><font size ="4" color="white"><b><fmt:message key="privacyPolicy"/></b></font></a></li>
   </ul>
</footer>
</div>
</body>
</fmt:bundle>
</html>