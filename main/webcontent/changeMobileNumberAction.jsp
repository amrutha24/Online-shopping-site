<%@page import="com.demo.ConnectionProvider" %> 
<%@page import="java.sql.*"%>
<%
String email=session.getAttribute("email").toString();
String newMobileNumber=request.getParameter("newMobileNumber");
String password=request.getParameter("password");

int check=0;
try
{
	Connection con=ConnectionProvider.getcon();
	Statement stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery("select * from users where email='"+email+"'and password='"+password+"'");
	while(rs.next())
	{
		check=1;
		stmt.executeUpdate("update users set mobileNumber='"+newMobileNumber+"'where email='"+email+"'");
		response.sendRedirect("changeMobileNumber.jsp?msg=done");
	}
	if(check==0)
	{
		response.sendRedirect("changeMobileNumber.jsp?msg=wrong");
		
	}
}
catch(Exception e)
{
 System.out.println(e);
}
%>
