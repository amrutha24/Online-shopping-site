<%@page import="com.demo.ConnectionProvider" %> 
<%@page import="java.sql.*"%>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/orderReceived-style.css">
<style>
.th-style
{ width: 25%;}
body {
    background-color: #CADCFC; /* Set a light gray background for the body */
}
</style>
<meta charset="ISO-8859-1">
<title>Delivered orders</title>
</head>
<body>
<div style="color: black; text-align: center; font-size: 30px;">Delivered Orders <i class='fas fa-dolly'></i></div>

<table id="customers">
          <tr>
          <th>Mobile Number</th>
            <th scope="col">Product Name</th>
            <th scope="col">Quantity</th>
            <th scope="col"><i class="fa fa-inr"></i> Sub Total</th>
            <th>Address</th>
            <th>City</th>
            <th>State</th>
            <th>Country</th>
            <th scope="col">Order Date</th>
             <th scope="col">Expected Delivery Date</th>
             <th scope="col">Payment Method</th>
              <th scope="col">Transaction-ID</th>
              <th scope="col">Status</th>
          </tr>
   <%
   try
   {
	   Connection con=ConnectionProvider.getcon();
	   Statement stmt=con.createStatement();
	   ResultSet rs=stmt.executeQuery("select * from cart inner join product where cart.product_id=product.Id and cart.orderDate is not NULL and cart.status='Delivered'");
	   while(rs.next())
	   {
   %>     
        
          <tr>
          <td><%=rs.getString(10) %></td>
            <td><%=rs.getString(17) %></td>
            <td><%=rs.getString(3) %></td>
            <td><i class="fa fa-inr"></i> <%=rs.getString(5) %> </td>
                <td><%=rs.getString(6) %></td>
               <td><%=rs.getString(7) %></td>
                <td><%=rs.getString(8) %></td>
                 <td><%=rs.getString(9) %></td>
             <td><%=rs.getString(11) %></td>
              <td><%=rs.getString(12) %></td>
               <td><%=rs.getString(13) %></td>
               <td><%=rs.getString(14) %></td>
               <td><%=rs.getString(15) %></td>
              </tr>
         <%
	  	 }
	   }
	   catch(Exception e)
	   {
		   System.out.println(e);
	   }
         %>
        </table>
      <br>
      <br>
      <br>

</body>
</html>