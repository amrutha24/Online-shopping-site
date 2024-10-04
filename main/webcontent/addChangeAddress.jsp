<%@page import="com.demo.ConnectionProvider" %> 
<%@page import="java.sql.*"%>
<%@include file="changeDetailsHeader.jsp"%>
<%@include file="footer.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/changeDetails.css">
<title>Add or Change Address</title>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("valid".equals(msg))
{
%>
<h3 class="alert">Address Successfully Updated !</h3>
<%} %>
<% 
if("invalid".equals(msg))
{
%>
<h3 class="alert">Some thing Went Wrong! Try Again!</h3>
<%} %>
<%
try
{
	Connection con=ConnectionProvider.getcon();
	Statement stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery("select * from users where email='"+email+"'");
	while(rs.next())
	{
%>
<form action="addChangeAddressAction.jsp" method="post">
<h3>Enter Address</h3>
 <input class="input-style" name="address" value="<%=rs.getString(7) %>"placeholder="Enter Address" >
 <hr>
 <h3>Enter city</h3>
 <input class="input-style" name="city" value="<%=rs.getString(8) %>"placeholder="Enter city" >
<hr>
<h3>Enter State</h3>
<input class="input-style" name="state" value="<%=rs.getString(9) %>"placeholder="Enter state" >
<hr>
<h3>Enter country</h3>
<input class="input-style" name="country" value="<%=rs.getString(10) %>"placeholder="Enter country" >
<hr>
<button class="button" type="submit">Save <i class='far fa-arrow-alt-circle-right'></i>
</button>
</form>
<%
	}
}
catch(Exception e)
{
	System.out.println(e);
}
 %>
</body>
</html>