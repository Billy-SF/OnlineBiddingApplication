 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  
  
  <style>
  .nav-item li{
  display: inline-block
}
  </style>
  <div class="container nav navbar" id="navbarSupportedContent" role="navigation">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Link</a>
      </li>
      <li class="nav-item">
        <a class="nav-link disabled" href="#">Disabled</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="text" placeholder="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  
      <p class="navbar-text navbar-right" dir="rtl"> 
      	<a href="edit.jsp" class="navbar-link">
      		<%=session.getAttribute("firstname") != null ? session.getAttribute("firstname") : ""%>
			<%=session.getAttribute("lastname") != null ? session.getAttribute("lastname") : "" %>
		</a>
	</p>
 </div>
