<%@page import="com.demo.ConnectionProvider" %> 
<%@page import="java.sql.*"%>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-Type" charset="ISO-8859-1">
<title>Home</title>
<style>
h3.alert {
    color: yellow;
    text-align: center;
}

body {
    background-color: #CADCFC; /* Set a light gray background for the body */
}

table {
 	border: 2px  black;
    width: 100%;
    border-collapse:separate;
    margin-top: 20px; /* Add some margin above the table */
}

table, th, td {
    border: 2px solid black;
}

th, td {
    padding: 8px;
    text-align: left;
}

th , tr{
    background-color: white; /* Light gray background for table headers */
}
tr
/*
tbody tr:nth-child(even) {
    background-color: #e1e1e1;  Alternate row background color 
}*/

.fa {
    font-size: 18px; /* Adjust font size for font-awesome icons */
    margin-right: 5px; /* Add some margin-right for better spacing with text */
}

.alert {
    padding: 10px;
    /*background-color: #f44336;  Red background for alerts */
    color: white;
    text-align: center;
    margin-bottom: 15px; /* Add margin at the bottom of alerts */
}
</style>
</head>
<body>
<div style="color: black; text-align: center;font-size: 30px">All Products & Edit Products<i class="fab fa-elementor"></i></div>
<%
	String msg=request.getParameter("msg");
	if("done".equals(msg))
	{
%>		
<h3 class="alert"> Product Successfully Updated</h3>
	<% }%>
<% if("wrong".equals(msg))
{
%>	
<h3 class="alert"> Something went wrong! Try again.. </h3>
<% }%>
<table>
	<thead>
	<tr>
	<th scope="col">ID</th>
	<th scope="col">Name</th>
	<th scope="col">Category</th>
	<th scope="col"><i class="fa fa-inr"></i>Price</th>
	<th scope="col">Status</th>
	<th scope="col">Edit<i class="fas fa-pen-fancy"></i></th>
	</tr>
	</thead>
	<tbody>
		
		<tr>
		<%
		try
		{
			Connection con=ConnectionProvider.getcon();
			Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery("select * from product");
			while(rs.next())
				{
			%>
				<td><%=rs.getString(1) %></td>	
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getString(3) %></td>
				<td><i class="fa fa-inr"></i><%=rs.getString(4) %></td>
				<td><%=rs.getString(5) %></td>
				<td><a href="EditProduct.jsp?id=<%=rs.getString(1) %>">Edit<i class="fas fa-pen-fancy"></i></a></td>
				</tr>
			<%
				}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		%>
	</tbody>
</table>
</body>
</html>