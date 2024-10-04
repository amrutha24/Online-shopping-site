<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>Login</title>
</head>
<body>
<div id="container">
	<div class="login">
		<form action="LoginAction.jsp" method="post">
		<input type="email" name="email" placeholder="Enter Email" required="required">
		<input type="password" name="password" placeholder="Enter Password" required="required">
		<input type="submit" value="Login">
		</form>
		<h2><a href="signup.jsp">SignUp</a></h2>
		<h2><a href="forgotPassword.jsp">Forgot Password?</a></h2>
	</div>
		<div class="whysign">
	<%
	String msg=request.getParameter("msg");
	if("notexist".equals(msg))
	{%>
		<h1>Incorrect UserName and Password</h1>

	<%}%>
	<%if("invalid".equals(msg))
		{
		%>
		<h1>Something went wrong!  Try again</h1>
		<%} %>
		<h2>Online shopping</h2>
		<p>The online shopping system is the application that allows the users to shop online without going to the shops to buy them.</p>
	</div>
</div>
</body>
</html>