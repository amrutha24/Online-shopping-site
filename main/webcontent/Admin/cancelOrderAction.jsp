<%@page import="com.demo.ConnectionProvider" %> 
<%@page import="java.sql.*"%>
<%
String id=request.getParameter("id");
String email=request.getParameter("email");
String status="cancel";
try
{
	Connection con=ConnectionProvider.getcon();
	Statement stmt=con.createStatement();
	stmt.executeUpdate("update cart set status='"+status+"'where product_id='"+id+"'and email='"+email+"'and address is not NULL");
	response.sendRedirect("orderReceived.jsp?msg=cancel");
}
catch(Exception e)
{
	System.out.println(e);
	response.sendRedirect("orderReceived.jsp?msg=invalid");
}
%>