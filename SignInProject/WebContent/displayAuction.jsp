<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="com.oa.dao.Dao" %>
<%@ page import="com.oa.helpers.User" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<% 
	Connection conn = Dao.getConnection();
	PreparedStatement pst = null;
	ResultSet rs = null;
	User user = new User();
	// not sure if userId is needed
	try {
		pst = conn.prepareStatement("SELECT * FROM items");
		rs = pst.executeQuery();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Auctions</title>
</head>
<body> 
	<h3>Auctions</h3>
	<table>

<%		
		//Stores the results
		while(rs.next())
		{
			System.out.println(rs.getString("itemname"));
			System.out.println(rs.getString("description"));
			System.out.println(rs.getString("image"));
%>
			<tr>
				<td><a href="<%=rs.getString("id")%>.jsp"> <%=rs.getString("itemname")%></a></td>
			</tr>
			<tr>
				<td><%=rs.getString("description") %></td>
				<td><img <%--src="C:/uploadImageOttawAction/img1903941635699828845.jpg"  %><%--src="file:\\\\c:\uploadImageOttawAction\img1903941635699828845.jpg" src="c:\\uploadImageOttawAction\\<%=rs.getString("image")%>"--%> 
				src='chrome-extension://dhdebllgjlepmfjeignhkcmdklalodmd/<%=rs.getString("image")%>'alt="Auction Image"></td>
			</tr>
<%
		}
%>

	</table>

</body>
</html>
<%
		
	} catch (Exception e) {
	    e.printStackTrace();
	} finally {
	    if (conn != null) {
			Dao.closeConnection();
		}
	    if (pst != null) {
	        try {
	            pst.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    if (rs != null) {
	        try {
	            rs.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	}		

%>
