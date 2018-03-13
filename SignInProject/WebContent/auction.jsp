<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="text/javascript">

$( document ).ready(function() { 
	//alert("Helllo!");
	$("#itemNameValidationMessage").hide();
	$("#descriptionValidationMessage").hide();
	$("#bidStartValidationMessage").hide();
	$("#bidEndValidationMessage").hide();
	$("#datesValidationMessage").hide();
	$("#initialPriceValidationMessage").hide();
	$("#imageValidationMessage").hide();
	
	// make sure the uploaded file is an image
 	$("#image").change(function() {
		var mimeType = this.files[0]['type'];
		if(mimeType.split('/')[0] != 'image'){
			$("#imageValidationMessage").slideDown();
	    }
	});

	$("#image").click(function() {
		$("#imageValidationMessage").slideUp();
	});
	
	
	
/* 	$("body").click(function(e){
	    var name = $(e.target)[0].nodeName;
	    alert(name);
	    var nameid = $(e.target)[0].id;
	    alert(nameid);
	    var classname = $(name+"#"+nameid).attr('class');
	    var full = name+"#"+nameid;
	    console.log(nameid);

	    function b(x){
	        alert(x);
	    };

	    b(full);
	}); */
	
	
});

function hideErrorMessage(element){
	//alert("hoho");
	//alert(element);
	//alert("hi"+$(element).nodeNme+"hi");	
	documet.getElementById(element).style.background = "yellow";
	
}

function validateAuctionForm(){
	var error = true;
	var itemName = document.forms["auction"]["itemName"].value;
	var description = document.forms["auction"]["description"].value;
	var bidStart = document.forms["auction"]["bidStart"].value;
	var bidEnd = document.forms["auction"]["bidEnd"].value;
	var initialPrice = document.forms["auction"]["initialPrice"].value;
	  
	if (itemName.length == 0) 
	{
		$("#itemNameValidationMessage").slideDown();
		error = false;
	}
	if (description.length == 0) {
		$("#descriptionValidationMessage").slideDown();
		error = false;
	}
	if (bidStart.length == 0 ) {
		$("#bidStartValidationMessage").slideDown();
		error = false;
	}
	if (bidEnd.length == 0) {
		$("#bidEndValidationMessage").slideDown();
		error = false;
	}
  	if (initialPrice.length == 0 || isNaN(initialPrice)) {
		$("#initialPriceValidationMessage").slideDown();
		error = false;
	}
	return error;
}

/* function hideErrorMessage(elementId){
	
	//document.getElementById(elementId).style.background = "yellow";
	
	//document.getElementById(elementId).next().css( "background-color", "red" );
	//$( "#itemName" ).next().slideUp();
	
	//alert(elementId.next());
	
        $(elementId).css("background-color", "#cccccc");

	
	
	document.getElementById(elementId).next().style.background = "yellow";
	
	return function() { // the function to return
				/* alert("showing "+ elementId);
				document.getElementById(elementId).slideUp();
				$(elementId).slideUp(); // use the variable from the parameter */
			//};
	
	//$(paramId).slideUp();
	
//} */

</script>
  
<title>Insert title here</title>
</head>
<body>
	
	
	
	
<div class="col-sm-3"></div>

<div class="col-sm-3">
<div> &nbsp;</div>
<div class= "panel panel-danger">
 <div class= "panel-heading" >  <b> Create Auction</b> </div>
  <div class ="panel-body"> 
	<form action="auctionServlet" method="POST" enctype="multipart/form-data" name="auction" onsubmit="return validateAuctionForm()"> 
		<div class="form-group">
		    <label class ="pull-left" for="itemName">Item Name:</label>
			<input type="text" class="form-control input-sm" id="itemName"  placeholder="Please Enter item name" name="itemName" onfocus="hideErrorMessage(this.id);" required>
			<div id="itemNameValidationMessage" Style="color: red">Item Name is required</div>
		</div>
		
		<div class="form-group">
		    <label class ="pull-left" for="description">Description:</label>
			<input type="text" class="form-control input-sm" id="description"  placeholder="Please Enter Description"  name="description" required>
			<div id="descriptionValidationMessage" Style="color: red">Description is required</div>
	    </div>
	    
	    <div class="form-group">		
			<label class ="pull-left" for="bidStart">Bidding Starts at :</label>
			<input type="datetime-local" class="form-control input-sm" id="bidStart" name="bidStart" required>
			<div id="bidStartValidationMessage" Style="color: red">Bidding Start Date and Time are required</div>
		</div>
			
		<div class="form-group">	
			<label class ="pull-left" for="bidEnd">Bidding Ends at:</label>
			<input type="datetime-local" class="form-control input-sm" id="bidEnd" name="bidEnd" required>
			<div id="bidEndValidationMessage" Style="color: red">Bidding End Date and Time are required</div>
			<div id="datesValidationMessage" Style="color: red">Bidding Start Time should be before End Time</div>
		</div>
		
		<div class="form-group">	
			<label class ="pull-left" for="initialPrice">Initial Price</label>
			<input type="text" class="form-control input-sm" id="initialPrice" placeholder="Please Enter Initial Price" name="initialPrice" required>
			<div id="initialPriceValidationMessage" Style="color: red">Initial Price is required and has to be number</div>    
		</div>	
		
		<div class="form-group">	
			<label class ="pull-left" for="image">Image:</label>
			<input type="file" class="form-control input-sm" id="image" placeholder="Please Upload image of the item" name="image" accept="image/*">
			<div id="imageValidationMessage" Style="color: red">The file needs to be an image</div>    
		</div>	

			<button type="submit" class="btn btn-primary" id="submitAuctionbtn" name="submitAuctionbtn">Submit Auction</button>

	</form>
	
	</div>
</div>	
 </div>	
	
	
	
</body>
</html>
