<%@page import="com.demo.ConnectionProvider" %> 
<%@page import="java.sql.*"%>
<%
String email=session.getAttribute("email").toString();
String oldPassword=request.getParameter("oldPassword");
String newPassword=request.getParameter("newPassword");
String confirmPassword=request.getParameter("confirmPassword");

if(!confirmPassword.equals(newPassword))
	response.sendRedirect("changePassword.jsp?msg=notMatch");
else
{
	int check=0;
	try
	{
		Connection con=ConnectionProvider.getcon();
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery("select * from users where email='"+email+"'and password='"+oldPassword+"'");
		while(rs.next())
		{
			check=1;
			stmt.executeUpdate("update users set password='"+newPassword+"' where email='"+email+"'");
			response.sendRedirect("changePassword.jsp?msg=done");
		}
		if(check==0)
		{
			response.sendRedirect("changePassword.jsp?msg=wrong");
		}
	}
	catch(Exception e)
	{
		System.out.println(e);
	}
}
%>