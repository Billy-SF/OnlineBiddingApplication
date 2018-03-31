<%@ page pageEncoding="UTF-8"%>
  
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<%-- <jsp:include page="<%= \"topMenu.jsp\" %>" /> --%> 
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="loc" value="en_US" />
<c:if test="${!(empty param.locale)}">
	<c:set var="loc" value="${param.locale}" />
</c:if>
<fmt:setLocale value="${loc}" />
<fmt:bundle basename="MessagesBundle">

	<title>OttawaAuction</title>

	<meta http-equiv="Content-Type" charset="UTF-8" content="text/html">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet"
		href="//cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
	<script src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
   <script src="chat.js"></script>
<link rel="stylesheet" href="customStyle.css"> 
<link rel="stylesheet" href="chat.css"> 
	

	</head>
	<body style="background-color:#f4f0f0">
		<!--  <c:forEach var = "i" begin = "1" end = "5">
         Item <c:out value = "${i}"/><p>
      </c:forEach>-->
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
     <%=session.getAttribute("username") == null ? "" : "<li><a href='auction.jsp'><font size=4 color='white'><b>Auction</b></font></a></li>"%>

       <li><a href="displayAuctionServlet"><font  size ="4" color="white"><b><fmt:message key="bids"/></b></font></a></li>
       <c:if test="${role}">
       		<li><a href="usersServlet"><font  size ="4" color="white"><b><fmt:message key="users"/></b></font></a></li>
       </c:if>
      <c:if test="${role}">
   	 	 <li><a href="closedBidsServlet"><font  size ="4" color="white"><b><fmt:message key="closedBids"/></b></font></a></li>
      </c:if>

      <li><a href="#"><font size ="4" color="white"><b><fmt:message key="contactUs"/></b></font></a></li>
      <li><a href="#"><font  size ="4" color="white"><b><fmt:message key="help"/></b></font></a></li>
    
    
   <li>
    <c:url value="searchServlet" var="englishURL">
    <c:param name="search" value="${keyword}"/>
    <c:param name="locale" value="en_US"/></c:url>
 	<a href="${englishURL}"><font size ="4" color="white"> <b>English</b></font> </a> </li>
 	
 	  <li>
 	<c:url value="searchServlet" var="chineseURL">
 	<c:param name="search" value="${keyword}"/>
 	<c:param name="locale" value="zh_CN"/>
 	</c:url>
 	 <a href="${chineseURL}"><font size ="4" color="white"><b>&#x4E2D;&#x6587;</b></font></a></li>
 	 </ul>
    
  <c:if test="${null != sessionScope.username}">
					<!--     toggle button for  -->
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#"> <span
								class="glyphicon glyphicon-user" style="color: white"></span><font
								color="white"><b> <%=session.getAttribute("username") != null ? session.getAttribute("username") : ""%></b></font>
								<!-- <span class="caret"></span> -->
						</a>
							<ul class="dropdown-menu">
								<li><a href="edit.jsp"><span
										class="glyphicon glyphicon-edit"></span> <fmt:message
											key="edit" /></a></li>
								<li><a href="Logout.jsp"><span
										class="glyphicon glyphicon-log-out"></span> <fmt:message
											key="logout" /></a></li>
							</ul></li>
					</ul>
				</c:if>     
    </div>
</nav> 


		<div class="container-fluid text-center">

			<div class="row content">
		        <div class="col-sm-2 sidenav">
     <p><a href="#"><img src="Real_Time_Bidding.png" height=100% width=100%></a></p>
      <p><a href="#"><img src="chicago.png" height=100% width=100%></a></p>
      <p><a href="#"><img src="bids.png" height=100% width=100%></a></p>
    </div>

				<div class="col-sm-8 text-left">

					<br>
					<div class="container">
				
						<h1>${productitem.getItemName()}</h1>
						<div class="image">
			<img src="chrome-extension://dhdebllgjlepmfjeignhkcmdklalodmd/${productitem.image}" alt="${productitem.itemName}" ></img>					
					</div>

						<div class="bidInfo">
							<p><a href="matchSellerServlet">Seller Page</a></p>
							<p>Date Created: <b>${productitem.getAuction().getDateCreated() }</b></p>
							<p>Time left: <span id="tttt"></span></p>
							<c:if test="${productitem.getHighestPrice() == '0.00'}">
							<p>Initial Bid Price: <b>$${productitem.getAuction().getBidpricestart()}</b></p>
							</c:if>
							<c:if test="${productitem.getHighestPrice() != '0.00'}">
							<p>Current Bid Price: <b>$${productitem.getHighestPrice()}</b></p>
							</c:if>
							<c:if test="${errorMessageBidDao ne null}">
		  						<h3>${errorMessageBidDao}</h3>
							</c:if>
							
							<form class="form-inline" action="bidServlet" method="post">
							<c:if test="${sessionScope.auctionId != null}}">
							<c:remove var="auctionId"/>
							 </c:if>
							      <c:set var = "auctionId" scope = "session" value = "${productitem.getAuction().getId()}"/>
						
						        <input type="hidden" name="productItemId" value="${productitem.getProductId()}"/>
									<div class="form-group">
									<input type="text" 
									<c:if test="${null == sessionScope.username}">
									   disabled
									</c:if>
									 pattern="[0-9]+(\.[0-9]{0,2})?%?"
									id="bidprice" name="bidPrice" placeholder="bid here">
								</div>
								<div class="form-group">
									<input
									<c:if test="${null == sessionScope.username}">
									   disabled
									</c:if>
									   type="submit" id="bidsubmit" value="Bid"/>
								</div>
					
							<c:if test="${null == sessionScope.username}">
									 Please sign in to bid
							</c:if>
					
							</form>

						</div>
					
<script>
function mysqlTimeStampToDate(timestamp) {
    //function parses mysql datetime string and returns javascript Date object
    //input has to be in this format: 2007-06-05 15:26:02
    var regex=/^([0-9]{2,4})-([0-1][0-9])-([0-3][0-9]) (?:([0-2][0-9]):([0-5][0-9]):([0-5][0-9]))?$/;
    var parts=timestamp.replace(regex,"$1 $2 $3 $4 $5 $6").split(' ');
    return new Date(parts[0],parts[1]-1,parts[2],parts[3],parts[4],parts[5]);
  };
  
$(document).ready(
		function() {
			//var date_future = new Date(new Date().getFullYear() +1, 0, 1);
			var timestamp = "${productitem.getAuction().getBidendtime()}";
//alert(timestamp);		
			var date_future = mysqlTimeStampToDate(timestamp);
			//alert(date_past);
			//alert(new Date());
			var myVar = setInterval(myTimer, 1000);
			function myTimer() {
			    //var d = new Date();
			    //$("#tttt").text(d.toLocaleTimeString());

				var date_now = new Date();
				
				// get total seconds between the times
				var delta = Math.abs(date_future - date_now) / 1000;
	
				// calculate (and subtract) whole days
				var days = Math.floor(delta / 86400);
				delta -= days * 86400;
	
				// calculate (and subtract) whole hours
				var hours = Math.floor(delta / 3600) % 24;
				delta -= hours * 3600;
	
				// calculate (and subtract) whole minutes
				var minutes = Math.floor(delta / 60) % 60;
				delta -= minutes * 60;
	
				// what's left is seconds
				var seconds = delta % 60;  // in theory the modulus is not required
			    
			   // $("#tttt").text(days + ' days, ' + minutes + ' minutes, ' + seconds + ' seconds' + "\n" +
			    		//(date_now.getTime() - date_past.getTime())
			   // );
			    $("#tttt").text(days + ' days, ' + minutes + ' minutes, ' + parseInt(seconds) + ' seconds');
				
				if(date_future.getTime() - date_now.getTime() < 0) {
					// auction end date expired
					$("#bidprice").attr("disabled", "disabled");
					$("#bidsubmit").attr('disabled', "disabled");
					$("#tttt").text("0 seconds left, Bidding ended!");

					 clearInterval(myVar);
					 $.ajax({
			                url: "auctionStopServlet",
			                type:"POST",
			                data: {"auctionid" : "${productitem.getAuction().getId()}"},
			                success: function( data, textStatus, jQxhr ){
			                    //$('#response pre').html( data );
			                },
			                error: function( jqXhr, textStatus, errorThrown ){
			                    //console.log( errorThrown );
			                }
			            });

				}
			}

		
		});
</script>

					</div>
					<form action="map.jsp"><input type="submit" class="btn btn-success" value="Get directions to our nearest pick-up location!"></form>
					<h3>Item Description</h3>
					<p>${productitem.getDescription()}</p>

					<div class="container">
						<h3>Bid History</h3>
						<p>${productitem.getBids().size()} bid(s) found.</p>
						
					<table id="bidhistory" class="stripe">
						<thead>
							<tr>
								<th>bid price</th>
								<th>user</th>
								<th>date</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${productitem.getBids()}" var="bid">
								<tr>
									<td>$${bid.getBidprice()}</td>
									<td><b>${bid.getUser().getUsername()}</b></td>
									<td><b>${bid.getDateCreated()}</b></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
						
					<script>
						$(document).ready(
								function() {
									$('#bidhistory').DataTable(
											{
												"searching" : false,
												"lengthMenu" : [
														[ 5, 10, 30, -1 ],
														[ 5, 10, 30, "All" ] ],
												"ordering" : false
											});
								});
					</script>

<br/>
<c:if test="${!(empty sessionScope.username)}">
<div class="row" id="chatroom">
	<div class="col-md-5">
		<div class="chatroom-container">
			<div class="chatmessage-container" id="chatmessage"></div>
			<div class="clearfix"></div>
           	<div class="input-group left-padding-5  bottom-padding-5">
                <div class="input-group-btn">
                    <button class="btn btn-default btn-sm" type="button" name="clear" id="clear">Clear</button>
                </div>
                <div class="text-right top-padding-12 right-padding-100">
                    <label for="color">Color</label>&nbsp;
                    <select id="color" name="color">
                        <option value="black">Black</option>
                        <option value="red">Red</option>
                        <option value="green">Green</option>
                        <option value="yellow">Yellow</option>
                        <option value="blue">Blue</option>
                        <option value="purple">Purple</option>
                    </select>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="message-send left-padding-5 right-padding-5 bottom-padding-5">
            	<div hidden="hidden">
            		<input type="text" id="last_message_id" name="last_message_id"><br>			
					<input type="text" id="user_name" name="user_name" value="${sessionScope.username}"><br>
					<input type="text" id="auction_id" name="auction_id" value="${productitem.getAuction().getId()}"><br>
					<input type="text" id="color" name="color"><br>
            	</div>
		  		<div class="input-group">
				   	<input type="text" class="form-control" id="message" name="message">
				   	<span class="input-group-btn">
				        <button class="btn btn-default" type="button" id="send" name="send">Submit</button>
				   	</span>
				</div>
            </div>
		</div>
	</div>
	<div class="clearfix"></div>
</div>
</c:if>
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
      <li><a href="#"><font size ="4" color="white"><b><fmt:message key="feedback"/></b></font></a></li>
      <li><a href="#"><font size ="4" color="white"><b><fmt:message key="privacyPolicy"/></b></font></a></li>
			
				</ul>
			</footer>

			<script>
				// Get the modal
				var modal = document.getElementById('id01');

				// When the user clicks anywhere outside of the modal, close it
				window.onclick = function(event) {
					if (event.target == modal) {
						modal.style.display = "none";
					}
				}
			</script>
</fmt:bundle>


</body>
</html>
