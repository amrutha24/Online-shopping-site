<%@page import="javax.imageio.event.IIOReadUpdateListener"%>
<%@page import="com.demo.ConnectionProvider" %> 
<%@page import="java.sql.*"%>
<%@include file="header.jsp"%>
<%@include file="footer.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<style>
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
</head>
<body>
<div style="color: black; text-align: center;margin-top:20px; font-size: 30px;">My Orders <i class='fab fa-elementor'></i></div>
<table>
        <thead>
          <tr>
            <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col">category</th>
            <th scope="col"><i class="fa fa-inr"></i>  Price</th>
            <th scope="col">Quantity</th>
            <th scope="col"><i class="fa fa-inr"></i> Sub Total</th>
            <th scope="col">Order Date</th>
             <th scope="col">Expected Delivery Date</th>
             <th scope="col">Payment Method</th>
              <th scope="col">Status</th>
              
          </tr>
        </thead>
        <tbody>
<%
int sno=0;
try
{
	Connection con=ConnectionProvider.getcon();
	Statement stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery("select * from cart inner join product where cart.product_id=product.Id and cart.email='"+email+"'and cart.orderDate is not NULL");
	while(rs.next())
	{
		sno=sno+1;
	
%>
        <tr>
            <td><%out.println(sno); %></td>
            <td><%=rs.getString(17) %></td>
            <td><%=rs.getString(18) %></td>
            <td><i class="fa fa-inr"></i><%=rs.getString(19) %> </td>
            <td><%=rs.getString(3) %></td>
            <td><i class="fa fa-inr"></i> <%=rs.getString(5) %></td>
             <td><%=rs.getString(11) %></td>
              <td><%=rs.getString(12) %></td>
               <td><%=rs.getString(13) %></td>
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
        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>