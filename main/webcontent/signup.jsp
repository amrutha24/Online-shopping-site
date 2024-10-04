<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>SignUp</title>
</head>
<body>
<div id="container">
	<div class="signup">
		<form action="SignupAction.jsp" method="post">
		<input type="text" name="name" placeholder="Enter Name" required>
		<input type="email" name="email" placeholder="Enter Email" required>
		<input type="number" name="mobilenumber" placeholder="Enter Mobile Number" required>
		<select name="securityQuestion">
		<option value="What was your first car?">What was your first car?</option>
		<option value="What is the name of your pet?">What is the name of your pet?</option>
		<option value="What elementary school did you attend?">What elementary school did you attend?</option>
		<option value="What is the name of the town where you were born?">What is the name of the town where you were born?</option>
		</select>
		<input type="text" name="answer" placeholder="Enter Answer" required>
		<input type="password" name="password" placeholder="Enter Password" required>
		<input type="submit" value="signup">
		</form>
		<h2><a href="Login.jsp">Login</a></h2>
	</div>
	<div class="whysign">
	<%
	String msg=request.getParameter("msg");
	if("valid".equals(msg))
	{%>
		<h1>Successfully Registered.....!</h1>

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