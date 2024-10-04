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
<title>Change Password</title>
</head>
<body>
<%
String msg=request.getParameter("msg");	
if("notMatch".equals(msg))
{
%>
<h3 class="alert">New password and Confirm password does not match!</h3>
<%} %>

<%
if("wrong".equals(msg))
{
%>
<h3 class="alert">Your old Password is wrong!</h3>
<%} %>

<%
if("done".equals(msg))
{
%>
<h3 class="alert">Password change successfully!</h3>
<%} %>

<%
if("invalid".equals(msg))
{
%>
<h3 class="alert">Some thing went wrong! Try again!</h3>
<%} %>

<form action="changePasswordAction.jsp" method="post">
<h3>Enter Old Password</h3>
 <input class="input-style" type="password" name="oldPassword" placeholder="Enter old password" required="required">
  <hr>
 <h3>Enter New Password</h3>
  <input class="input-style" type="password" name="newPassword" placeholder="Enter new password" required="required">
 <hr>
<h3>Enter Confirm Password</h3>
 <input class="input-style" type="password" name="confirmPassword" placeholder="Enter Confirm password" required="required">
<hr>
 <button class="button" type="submit">Save<i class='far fa-arrow-alt-circle-right'></i>
</button>
</form>
</body>
</html>