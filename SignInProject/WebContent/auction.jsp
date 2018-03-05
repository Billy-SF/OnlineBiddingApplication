<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<script>
function myFunction() {
    document.getElementById("image").accept = "image/*";
}
</script>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
	
	
	
<div class="col-sm-3"></div>

<div class="col-sm-3">
<div> &nbsp;</div>
<div class= "panel panel-danger">
 <div class= "panel-heading" >  <b> Create Auction</b> </div>
  <div class ="panel-body"> 
	<form action="auctionServlet" method="POST" enctype="multipart/form-data"> 
		<div class="form-group">
		    
		    <label class ="pull-left" for="itemName">Item Name:</label>
			<input type="text" class="form-control input-sm" id="itemName"  placeholder="Please Enter item name" name="itemName">
		</div>
		
		<div class="form-group">
		    <label class ="pull-left" for="description">Description:</label>
			<input type="text" class="form-control input-sm" id="description"  placeholder="Please Enter Description"  name="description">
	    </div>
	    
	    <div class="form-group">		
			<label class ="pull-left" for="bidStart">Bidding Starts at :</label>
			<input type="datetime-local" class="form-control input-sm" id="bidStart"  name="bidStart">
		</div>
			
		<div class="form-group">	
			<label class ="pull-left" for="bidEnd">Bidding Ends at:</label>
			<input type="datetime-local" class="form-control input-sm" id="bidEnd" name="bidEnd">
		</div>
		
		<div class="form-group">	
			<label class ="pull-left" for="initialPrice">Initial Price</label>
			<input type="text" class="form-control input-sm" id="initialPrice" placeholder="Please Enter Initial Price" name="initialPrice" >    
		</div>	
		
		<div class="form-group">	
			<label class ="pull-left" for="image">Image:</label>
			<input type="file"  class="form-control input-sm" id="image" placeholder="Please Upload image of the item" name="image" accept="image/*">    
		</div>	

			<button type="submit" class="btn btn-primary" id="submitAuctionbtn" name="submitAuctionbtn">Submit Auction</button>

	</form>
	
	</div>
</div>	
 </div>	
	
	
	
</body>
</html>