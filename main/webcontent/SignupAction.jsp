<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.demo.ConnectionProvider" %>
<%@page import="java.sql.Connection"%>
<%
	String name=request.getParameter("name");
	String email=request.getParameter("email");
	String MobileNumber=request.getParameter("mobilenumber");
	String SecurityQuestion=request.getParameter("securityQuestion");
	String answer=request.getParameter("answer");
	String Password=request.getParameter("password");
	String address="";
	String city="";
	String state="";
	String country="";
	
	try
	{
		Connection con=ConnectionProvider.getcon();
		PreparedStatement stmt=con.prepareStatement("insert into users values(?,?,?,?,?,?,?,?,?,?)");
		stmt.setString(1, name);
		stmt.setString(2, email);
		stmt.setString(3, MobileNumber);
		stmt.setString(4, SecurityQuestion);
		stmt.setString(5, answer);
		stmt.setString(6, Password);
		stmt.setString(7, address);
		stmt.setString(8, city);
		stmt.setString(9, state);
		stmt.setString(10, country);
		stmt.executeUpdate();
		response.sendRedirect("signup.jsp?msg=valid");
	}
	catch(Exception e)
	{
		System.out.println(e);
		response.sendRedirect("signup.jsp?msg=invalid");
	}

%>