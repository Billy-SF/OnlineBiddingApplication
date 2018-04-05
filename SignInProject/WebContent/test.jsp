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
<head>
	<meta http-equiv="Content-Type" charset="UTF-8" content="text/html">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="//cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
	<script src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<link rel="stylesheet" href="customStyle.css"> 
	<script>
	
	function readUrl(input) {
		  
		  if (input.files && input.files[0]) {
		    let reader = new FileReader();
		    reader.onload = (e) => {
		      let imgData = e.target.result;
		      let imgName = input.files[0].name;
		      input.setAttribute("data-title", imgName);
		      console.log(e.target.result);
		    }
		    reader.readAsDataURL(input.files[0]);
		  }

		}
	</script>
	<style>
.inputDnD {
  .form-control-file {
    position: relative;
    width: 100%;
    height: 100%;
    min-height: 6em;
    outline: none;
    visibility: hidden;
    cursor: pointer;
    background-color: #c61c23;
    box-shadow: 0 0 5px solid currentColor;
    &:before {
      content: attr(data-title);
      position: absolute;
      top: 0.5em;
      left: 0;
      width: 100%;
      min-height: 6em;
      line-height: 2em;
      padding-top: 1.5em;
      opacity: 1;
      visibility: visible;
      text-align: center;
      border: 0.25em dashed currentColor;
      transition: all 0.3s cubic-bezier(.25, .8, .25, 1);
      overflow: hidden;
    }
    &:hover {
      &:before {
        border-style: solid;
        box-shadow: inset 0px 0px 0px 0.25em currentColor;
      }
    }
  }
}

// PRESENTATIONAL CSS
body {
  background-color: #f7f7f9;
}
</style>
</head>

<div class="container p-y-1">
  <div class="row m-b-1">
    <div class="col-sm-6 offset-sm-3">
      <button type="button" class="btn btn-primary btn-block" onclick="document.getElementById('inputFile').click()">Add Image</button>
      <div class="form-group inputDnD">
        <label class="sr-only" for="inputFile">File Upload</label>
        <input type="file" class="form-control-file text-primary font-weight-bold" id="inputFile" accept="image/*" onchange="readUrl(this)" data-title="Drag and drop a file">
      </div>
    </div>
  </div>
   <div class="row m-b-1">
    <div class="col-sm-6 offset-sm-3">
      <button type="button" class="btn btn-success btn-block" onclick="document.getElementById('inputFile').click()">Add Image</button>
      <div class="form-group inputDnD">
        <label class="sr-only" for="inputFile">File Upload</label>
        <input type="file" class="form-control-file text-success font-weight-bold" id="inputFile" accept="image/*" onchange="readUrl(this)" data-title="Drag and drop a file">
      </div>
    </div>
  </div>
    <div class="row m-b-1">
    <div class="col-sm-6 offset-sm-3">
      <button type="button" class="btn btn-warning btn-block" onclick="document.getElementById('inputFile').click()">Add Image</button>
      <div class="form-group inputDnD">
        <label class="sr-only" for="inputFile">File Upload</label>
        <input type="file" class="form-control-file text-warning font-weight-bold" id="inputFile" accept="image/*" onchange="readUrl(this)" data-title="Drag and drop a file">
      </div>
    </div>
  </div>
    <div class="row m-b-1">
    <div class="col-sm-6 offset-sm-3">
      <button type="button" class="btn btn-danger btn-block" onclick="document.getElementById('inputFile').click()">Add Image</button>
      <div class="form-group inputDnD">
        <label class="sr-only" for="inputFile">File Upload</label>
        <input type="file" class="form-control-file text-danger font-weight-bold" id="inputFile" accept="image/*" onchange="readUrl(this)" data-title="Drag and drop a file">
      </div>
    </div>
  </div>
</div>
<body>




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

<!-- </div> -->
</body>
</fmt:bundle>
</html>