<%@page import="com.demo.ConnectionProvider" %> 
<%@page import="java.sql.*"%>
<%@include file="changeDetailsHeader.jsp"%>
<%@include file="footer.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<meta charset="ISO-8859-1">
<title>Change Mobile Number</title>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("done".equals(msg))
{
%>
<h3 class="alert">Your Mobile Number successfully changed !</h3>
<%} %>
<%
if("wrong".equals(msg))
{
%>
<h3 class="alert">Your Password is wrong!</h3>
<%} %>
<form action="changeMobileNumberAction.jsp" method="post">
 <hr>
 <h3>Enter Your new Mobile Number</h3>
 <input class="input-style" type="number" name="newMobileNumber" placeholder="Enter your new Mobile Number" required="required">
<hr>
<h3>Enter Password (For Security)</h3>
 <input class="input-style" type="password" name="password" placeholder="Enter password (For Security)" required="required">
<hr>
<button class="button" type="submit">Save<i class='far fa-arrow-alt-circle-right'></i>
</button>
</form>
</body>
</html>