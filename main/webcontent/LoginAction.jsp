<%@ page import="com.demo.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%
String email=request.getParameter("email");
String password=request.getParameter("password");
if("admin@inmakes.com".equals(email)&&"admin".equals(password))
{
	session.setAttribute("email",email);
	response.sendRedirect("Admin/adminHome.jsp");
}
else
{
	int z=0;
	try
	{
		Connection con=ConnectionProvider.getcon();
		Statement stmt=con.createStatement();
		ResultSet res=stmt.executeQuery("select * from users where email='"+email+"'&& password='"+password+"'");
		while(res.next())
		{
			z=1;
			session.setAttribute("email",email);
			response.sendRedirect("home.jsp");
		}
		if(z==0)
			response.sendRedirect("Login.jsp?msg=notexist");
	}
	catch(Exception e)
	{
		System.out.println(e);
		response.sendRedirect("Login.jsp?msg.invalid");
	}
}
%>