<%@page import="com.demo.ConnectionProvider" %> 
<%@page import="java.sql.*"%>
<%
String email=session.getAttribute("email").toString();
String securityQuestion=request.getParameter("securityQuestion");
String newAnswer=request.getParameter("newAnswer");
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
		stmt.executeUpdate("update users set securityQuestion='"+securityQuestion+"',answer='"+newAnswer+"'where email='"+email+"'");
		response.sendRedirect("changeSecurityQuestion.jsp?msg=done");
	}
	if(check==0)
	{
		response.sendRedirect("changeSecurityQuestion.jsp?msg=wrong");
		
	}
}
catch(Exception e)
{
 System.out.println(e);
}
%>