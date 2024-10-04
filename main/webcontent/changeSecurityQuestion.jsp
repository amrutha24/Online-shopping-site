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
<title>Change Security Question</title>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("done".equals(msg))
{
%>
<h3 class="alert">Your security Question successfully changed !</h3>
<%} %>
<%
if("wrong".equals(msg))
{
%>
<h3 class="alert">Your Password is wrong!</h3>
<%} %>
<form action="changeSecurityQuestionAction.jsp" method="post">
<h3>Select Your New Security Question</h3>
 <select class="input-style" name="securityQuestion">
 <option value="What was your first car?">What was your first car?</option>
 <option value="What is the name of your pet?">What is the name of your pet?</option>
 <option value="What elementary school did you attend?">What elementary school did you attend?</option>
 <option value="What is the name of the town where you were born?">What is the name of the town where you were born?</option>		
 </select>
 <hr>
 <h3>Enter Your New Answer</h3>
 <input class="input-style" type="text" name="newAnswer" placeholder="Enter your new Answer" required="required">
<hr>
<h3>Enter Password (For Security)</h3>
 <input class="input-style" type="password" name="password" placeholder="Enter password (For Security)" required="required">
<hr>
<button class="button" type="submit">Save<i class='far fa-arrow-alt-circle-right'></i>
</button>
</form>
</body>
</html>