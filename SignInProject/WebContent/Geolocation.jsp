<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Geolocation</title>

</head>
<body>
	<button onclick="getLocation()">Get location</button>
	<p id="demo"></p>

<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBo0Q70yDNEOQtbfFh-hpf6Mh0ovLif_3o">
</script>
<script type="text/javascript">
var x = document.getElementById("demo");

function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition, showError);
    } else { 
        x.innerHTML = "Geolocation is not supported by this browser.";
    }
}
function showPosition(position) {
   // x.innerHTML = "Latitude: " + position.coords.latitude +
   // "<br>Longitude: " + position.coords.longitude;
    
    var from = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
    //var fromLocation = 'ComputerLocation';
    
    var destination = new google.maps.LatLng(45.3192, -75.6692);
    //var destinationAt = "Warehouse";
    //x.innerHTML = "Before excuting the DistanceMatrixService";
    var service = new google.maps.DistanceMatrixService();
   // x.innerHTML = "After executing the DistanceMatrixService";

    service.getDistanceMatrix(
    {
    	
    	origins: [from],
    	destinations: [destination],
    	travelMode: google.maps.TravelMode.DRIVING
    }, callback);
  }
function callback(response, status) {
	//x.innerHTML = status;
    if (status == 'OK') {
        var origins = response.originAddresses;
        var destinations = response.destinationAddresses;

        for (var i = 0; i < origins.length; i++)
        {
            var results = response.rows[i].elements;
            console.log(results);
            for (var j = 0; j < results.length; j++) {
                var element = results[j];
                var distance = element.distance.text;
                var duration = element.duration.text;
                var from = origins[i];
                var to = destinations[j];
            }
        }
        
        x.innerHTML = "Distance: " + distance + " Time: " + duration;
       // x.innerHTML = "After executing the DistanceMatrixService";
    }
    
}
function showError(error) {
    switch(error.code) {
        case error.PERMISSION_DENIED:
            x.innerHTML = "User denied the request for Geolocation."
            break;
        case error.POSITION_UNAVAILABLE:
            x.innerHTML = "Location information is unavailable."
            break;
        case error.TIMEOUT:
            x.innerHTML = "The request to get user location timed out."
            break;
        case error.UNKNOWN_ERROR:
            x.innerHTML = "An unknown error occurred."
            break;
    }
}
</script>
</body>
</html>