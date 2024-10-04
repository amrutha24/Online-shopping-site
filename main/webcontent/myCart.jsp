<%@page import="com.demo.ConnectionProvider" %> 
<%@page import="java.sql.*"%>
<%@include file="header.jsp"%>
<%@include file="footer.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style >
h3.alert {
    color: black;
    text-align: center;
}

body {
    background-color: #CADCFC; /* Set a light gray background for the body */
}

table {
    width: 100%;
    border-collapse:separate;
    margin-top: 20px; /* Add some margin above the table */
}
th, td {
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>My Cart</title>
</head>
<body>	
<div style="color: black; text-align: center; font-size: 35px; margin-top: 20px;">My Cart<i class='fas fa-cart-arrow-down'></i></div>

<%
String msg=request.getParameter("msg");
if("notPossible".equals(msg))
{
	%>
	<h3 class="alert">There is only one Quantity! So click on remove!</h3>

<%}%>
	
<%
if("inc".equals(msg))
{
	%>
<h3 class="alert">Quantity  Increased Successfully!</h3>
<%}%>

<%
if("dec".equals(msg))
{
	%>
<h3 class="alert">Quantity  Decreased Successfully!</h3>
<%}%>

<%
if("remove".equals(msg))
{
	%>
<h3 class="alert">Product Successfully Removed!</h3>
<%}%>

<table>
<thead>
<%
	int total=0;
	int sno=0;
	try
	{
		Connection con=ConnectionProvider.getcon();
		Statement stmt=con.createStatement();
		ResultSet rs1=stmt.executeQuery("select sum(total) from cart where email='"+email+"'and address is NULL");
		while(rs1.next())
		{
			total=rs1.getInt(1);
		}
	%>
		 <tr>
            <th scope="col" style="background-color: yellow;">Total: <%out.println(total); %><i class="fa fa-inr"></i> </th>
           <%if(total>0){ %> <th scope="col"><a href="addressPaymentForOrder.jsp">Proceed to order</a></th><%} %>
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Sub Total</th>
            <th scope="col">Remove <i class='fas fa-trash-alt'></i></th>
          </tr>
        </thead>
        <tbody>
        <%
         ResultSet rs=stmt.executeQuery("select * from product inner join cart on product.Id=cart.product_id and cart.email='"+email+"'and  cart.address is NULL");
        while(rs.next())
        {
         %>
         <tr>
			<%sno=sno+1;%>
           <td><%out.println(sno); %></td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3) %></td>
            <td><i class="fa fa-inr"></i><%=rs.getString(4) %></td>
            <td><a href="IncDecQuantityAction.jsp?id=<%=rs.getString(1)%>&quantity=inc"><i class='fas fa-plus-circle'></i></a> <%=rs.getString(8) %> <a href="IncDecQuantityAction.jsp?id=<%=rs.getString(1)%>&quantity=dec"><i class='fas fa-minus-circle'></i></a></td>
            <td><i class="fa fa-inr"><%=rs.getString(10) %></i> </td>
            <td><a href="removeFromCart.jsp?id=<%=rs.getString(1) %>">Remove <i class='fas fa-trash-alt'></i></a></td>
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