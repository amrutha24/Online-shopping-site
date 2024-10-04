<%@page import="com.demo.ConnectionProvider" %> 
<%@page import="java.sql.*"%>
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
 /*form {
    background-color:  #8AB6F9;
    padding: 20px; 
    border-radius: 5px; 
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    max-width: 100%; 
    margin: 0 auto;  
}
*/
h1 {
    color: #FFD700; /* Gold color */
    text-align: center; /* Center align text */
    margin-top: 0; /* Remove top margin */
}

.left-div {
    width: 50%; /* Set width for left and right divs */
    display: inline-block; /* Display as inline-block for side-by-side layout */
    margin-bottom: 10px; /* Add space below each div */
}
.right-div {
	float: right;
    width: 50%; /* Set width for left and right divs */
    display: inline-block; /* Display as inline-block for side-by-side layout */
    margin-bottom: 10px; /* Add space below each div */
}


.left-div h3, .right-div h3 {
	font-size: 20px;
    margin-bottom: 5px; /* Add space below heading */
    color: #333; /* Dark color for heading */
}

.input-style {
    width: 90%; /* Calculate width for input */
    padding: 10px; /* Padding inside input */
    border: 1px solid #ccc; /* Border color */
    border-radius: 3px; /* Rounded corners */
    font-size:16px;
    margin-top:15px;
    margin-bottom: 25px;
    box-sizing: border-box; /* Include padding and border in element's total width */
}

.button {
	align-content:center;
    background-color: #4CAF50; /* Green background color */
    color: white; /* Text color */
    border: none; /* Remove border */
    padding: 12px 20px; /* Padding inside button */
    text-align: center; /* Center align text */
    text-decoration: none; /* Remove underline */
     display: inline-block;
     width:90%;
    font-size: 20px; /* Font size */
    border-radius: 25px; /* Rounded corners */
    cursor: pointer; /* Pointer cursor on hover */
    margin-top: 10px; /* Add space above button */
    margin-left: 60px;
}

.button:hover {
    background-color: #45a049; /* Darker green background color on hover */
}

.button i {
    margin-left: 5px; /* Add space to the left of icon */
}
.footer {
    background-color: #00246B; /* Dark background color */
    color: #ffffff; /* Text color */
    text-align: center; /* Center align text */
    padding: 10px 0; /* Padding top and bottom */
    position: fixed; /* Fixed position at the bottom */
    width: 100%; /* Full width */
    margin-bottom:5px;
    margin-right:15px;
    bottom: 0; /* Stick to the bottom of the viewport */
}

.footer p {
    margin: 0; /* Remove default margin for <p> */
    font-size: 14px; /* Adjust font size */
}

</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Home</title>
<script>
	if(window.history.forward(1) !=null)
		window.history.forward(1);
</script>
</head>
<body>
<br>
<table>
<thead>
<%

int total=0;
int sno=0;
try
{
	String email=session.getAttribute("email").toString();
	Connection con=ConnectionProvider.getcon();
	Statement stmt=con.createStatement();
	ResultSet rs1=stmt.executeQuery("select sum(total) from cart where email='"+email+"'and address is NULL");
	while(rs1.next())
	{
		total=rs1.getInt(1);
%>
	<tr>
	<th scope="col"><a href="myCart.jsp"><i class='fas fa-arrow-circle-left'>Back</i></a></th>
	<th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"></i><%out.println(total); %></th>
	</tr>
	</thead>
	<thead>
	<tr>
		<th scope="col">S.no</th>
		<th scope="col">Product Name</th>
		<th scope="col">Category</th>
		<th scope="col"><i class="fa fa-inr"></i>Price</th>
		<th scope="col">Quantity</th>
		<th scope="col">Sub Total</th>
		</tr>
	</thead>
	<tbody>
	<%}
	%>
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
            <td><%=rs.getString(8) %></td>
            <td><i class="fa fa-inr"></i><%=rs.getString(10) %></td>
           </tr>
           <%
           }
           ResultSet rs2=stmt.executeQuery("select * from users where email='"+email+"'");
          while(rs2.next())
          {
           %> 		
	</tbody>
	</table>
	
<hr style="width: 100%">
<form action="addressPaymentForOrderAction.jsp" method="post">
 <div class="left-div">
 <h3>Enter Address</h3>
<input class="input-style" type="text" name="address" value="<%=rs2.getString(7)%>"placeholder="Enter Address"required="required">
 </div>

<div class="right-div">
<h3>Enter city</h3>
<input class="input-style" type="text" name="city" value="<%=rs2.getString(8)%>"placeholder="Enter City"required="required">
</div> 

<div class="left-div">
<h3>Enter State</h3>
<input class="input-style" type="text" name="state" value="<%=rs2.getString(9)%>"placeholder="Enter State"required="required">
</div>

<div class="right-div">
<h3>Enter country</h3>
<input class="input-style" type="text" name="country" value="<%=rs2.getString(10)%>"placeholder="Enter Country"required="required">
</div>
<h3 style="color: red">*If there is no address its mean that you did not set you address!</h3>
<h3 style="color: red">*This address will also updated to your profile</h3>
<hr style="width: 100%">
<div class="left-div">
<h3>Select way of Payment</h3>
 <select class="input-style" name="paymentMethod">
 <option value="Cash on delivery(COD)">Cash on delivery(COD)</option>
 <option value="Online Payment">Online Payment</option>
 </select>
</div>

<div class="right-div">
<h3>Pay online on this onlineshop@pay.com</h3>
<input class="input-style" type="text" name="transactionId" placeholder="Enter Transaction Id">
<h3 style="color: red">*If you select online Payment then enter you transaction ID here otherwise leave this blank</h3>
</div>
<hr style="width: 100%">

<div class="left-div">
<h3>Mobile Number</h3>
<input class="input-style" type="text" name="mobileNumber" value="<%=rs2.getString(3)%>" placeholder="Enter Mobile Number"required="required">
<h3 style="color: red">*This mobile number will also updated to your profile</h3>
</div>
<div class="right-div">
<h3 style="color: red">*If you enter wrong transaction id then your order will we can cancel!</h3>
<button class="button" type="submit">Proceed to generate Bill & Save <i class='far fa-arrow-alt-circle-right'></i></button>
<h3 style="color: red">*Fill form correctly</h3>
</div>
</form>
<%
    }
}
catch(Exception e)
{
	System.out.println(e);
}
%>	
	

</body>
</html>