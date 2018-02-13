<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>Select Language</title>
</head>
<body>
<table>
<tr>
<td colspan=4 bgcolor="black">
<br/>
<center><font face="arial" size=+2 color="white">
    <b><i>Select</i> your prefered language to Login Page.</b></font>
    </center>
<br/>
 
</td>
</tr>
 <tr><td>
 
 <c:url value="login.jsp" var="englishURL">
   <c:param name="locale" value="en_US"/>
 </c:url>
 
 <a href="${englishURL}"> English </a>
</td>


<td>
  <c:url value="login.jsp" var="chineseURL">
     <c:param name="locale" value="zh_CN"/>
  </c:url>
 
  <a href="${chineseURL}"> Chinese </a>
</td>
</tr>
</table>
</body>
</html>