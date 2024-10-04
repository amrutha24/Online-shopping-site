<%@page import="com.demo.ConnectionProvider" %> 
<%@page import="java.sql.*" %>
<%@include file="header.jsp"%>
<%@include file="footer.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/messageUs.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div style="color: black; text-align: center; font-size: 30px;">Message Us <i class='fas fa-comment-alt'></i></div>
<%
	String msg=request.getParameter("msg");
	if("valid".equals(msg))
	{
%>
<h3 style="text-align:center; color:black;">Message successfully sent. Our team will contact you soon!</h3>
<%} %>
<%
	if("invalid".equals(msg))
	{
%>
<h3 style="text-align:center; ">Some thing Went Wrong! Try Again!</h3>
<%} %>
<form action="messageUsAction.jsp" method="post">
<input class="input-style" name="subject" type="text" placeholder="subject" required="required">
<hr>
<textarea class="input-style" name="body" placeholder="Enter your Message" required="required"></textarea>
<hr>
<button class="button" type="submit">Send<i class='far fa-arrow-alt-circle-right'></i></button>
</form>
<br><br><br>
</body>
</html>