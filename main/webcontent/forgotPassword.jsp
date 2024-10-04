
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>ForgotPassword</title>
</head>
<body>
<div id="container">
	<div class="signup">
		<form action="forgotPasswordAction.jsp" method="post">
		<input type="text" name="name" placeholder="Enter Name" required="required">
		<input type="email" name="email" placeholder="Enter Email" required="required">
		<input type="number" name="mobilenumber" placeholder="Enter Mobile Number" required="required">
		<select name="securityQuestion">
		<option value="What was your first car?">What was your first car?</option>
		<option value="What is the name of your pet?">What is the name of your pet?</option>
		<option value="What elementary school did you attend?">What elementary school did you attend?</option>
		<option value="What is the name of the town where you were born?">What is the name of the town where you were born?</option>
		</select>
		<input type="text" name="answer" placeholder="Enter Answer" required="required">
		<input type="password" name="newPassword" placeholder="Enter your new Password to set" required="required">
		<input type="submit" value="save">
		</form>
		<h2><a href="Login.jsp">Login</a></h2>
	</div>
	<div class="whyforgotPassword">
	<%
	String msg=request.getParameter("msg");
	if("done".equals(msg))
	{%>
		<h1>Password changed successfully</h1>

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