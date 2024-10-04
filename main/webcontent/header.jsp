
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/header-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
	<div class="topnav sticky">
	<% String email=session.getAttribute("email").toString();%>
	<center><h1> Online Shopping </h1></center>
    <a href=""><%out.print(email);%> <i class='fas fa-user-alt'></i></a>
    <a href="home.jsp">Home<i class="fa fa-institution"></i></a>
    <a href="myCart.jsp">My Cart<i class='fas fa-cart-arrow-down'></i></a>
    <a href="myOrders.jsp">My Orders  <i class='fab fa-elementor'></i></a>
    <a href="changeDetails.jsp">Change Details <i class="fa fa-edit"></i></a>
    <a href="messageUs.jsp">Message Us <i class='fas fa-comment-alt'></i></a>
    <a href="aboutUs.jsp">About <i class="fa fa-address-book"></i></a>
    <a href="Logout.jsp">Logout <i class='fas fa-share-square'></i></a>
		<div class="search-container">
			<form action="searchHome.jsp" method="post">
			<input type="text" name="search" placeholder="Search here">
			<button type="submit"><i class="fa fa-search"></i></button>
			</form>
		</div>
	</div>
<body>
</body>
</html>