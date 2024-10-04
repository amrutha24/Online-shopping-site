<%@page import="com.demo.ConnectionProvider" %> 
<%@page import="java.sql.*"%>
<%@include file="header.jsp"%>
<%@include file="footer.jsp"%>
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
	<div style="color: black; text-align: center; font-size: 35px; margin-top: 20px;">Home<i  class="fa-fa-institution"></i></div>
	<table>
	<thead>
	<tr>
	<th scope="col">ID</th>
	<th scope="col">Name</th>
	<th scope="col">Category</th>
	<th scope="col"><i class="fa fa-inr"></i>Price</th>
	<th scope="col">Add to cart<i class="fas fa-cart-plus"></i></th>
	</tr>
	</thead>
	<tbody>
	<%
	int z=0;
	try
	{
		String search=request.getParameter("search");
		Connection con=ConnectionProvider.getcon();
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery("select * from product where name like'%"+search+"%' or category like '%"+search+"%' and active='yes'");
		while(rs.next())
		{
			z=1;
	%>		
		<tr>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><i class="fa fa-inr"><%=rs.getString(4) %></i></td>
		<td><a href="addToCartAction.jsp?id=<%=rs.getString(1)%>">Add to Cart<i class="fas fa-cart-plus"></i></a></td>
		</tr>

	<% 
		}
	}
	catch(Exception e)
		{
			System.out.println(e);
		} %>
			
	</tbody>
	</table>
<%if(z==0)
{%>
	<h1 style="color: black; text-align: center;">Nothing to show</h1>
	
<%}%>


</body>
</html>