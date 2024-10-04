
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="..css/home-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<style>
.topnav 
{
    background-color: #00246B; /* dark background color */
    overflow: hidden; /* Ensure all content fits within the container */
}

/* Sticky positioning for the navigation bar */
.topnav .sticky {
    position: sticky;
    top: 0; /* Stick to the top of the viewport */
    z-index: 1000; /* Ensure the navigation bar is above other content */
}

/* Style for the links in the navigation bar */
.topnav a {
    float: left; /* Float links to the left */
    display: block; /* Display links as block elements */
    margin-left:10px;
    color: #ffffff; /* Text color */
    text-align: center; /* Center align text */
    padding: 14px 20px; /* Padding inside links */
    text-decoration: none; /* Remove underline from links */
    font-size: 20px; /* Font size */
}

/* Change color of links on hover */
.topnav a:hover {
   /* background-color: #ffffff;  Darken background color on hover */
    text-align: center;
    margin-left: 30px;
}
div
{
	left:0;
}

/* Style for the center-aligned heading */
.topnav h1 {
    color:#ffffff; /* Text color */
    text-align: center; /* Center align text */
    padding: 14px 20px; /* Padding inside heading */
    margin: 0; /* Remove default margin */
}

/* Style for icons within links */
.topnav i {
    margin-left: 5px; /* Add margin to the left of icons */
}
</style>
</head>
	<div class="topnav sticky">
	<% String email= session.getAttribute("email").toString();
	%>
	<center><h2> Online Shopping </h2></center>
	<a href="addNewProduct.jsp">Add New Product <i class="fas fa-plus-square"></i></a>
	<a href="allProductEditProduct.jsp">All products & Edit Products<i class="fab fa-elementor"></i></a>
	<a href="messageReceived.jsp">Message Received<i class="fas fa-comment-alt"></i></a>
	<a href="orderReceived.jsp">Order Received<i class="fas fa-archive"></i></a>
	<a href="cancelOrder.jsp">Cancel Orders<i class="fas fa-window-close"></i></a>
	<a href="deliveredOrder.jsp">Delivered Orders<i class="fas fa-dolly"></i></a>
	<a href="../Logout.jsp">Logout<i class="fas fa-comment-share-square"></i></a>
	</div>
	<br>
<body>
</body>
</html>