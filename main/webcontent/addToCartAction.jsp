<%@page import="com.demo.ConnectionProvider" %> 
<%@page import="java.sql.*"%>
<%@include file="header.jsp"%>
<%@include file="footer.jsp"%>
<%
String emailId=session.getAttribute("email").toString();
String product_id=request.getParameter("id");
int quantity=1;
int product_price=0;
int product_total=0;
int cart_total=0;

int z=0;
try
{
	Connection con=ConnectionProvider.getcon();
	Statement stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery("select * from product where id='"+product_id+"'");
	while(rs.next())
	{
		product_price=rs.getInt(4);
		product_total=product_price;
	}
	ResultSet rs1=stmt.executeQuery("select * from cart where product_id='"+product_id+"'and email='"+emailId+"'and address is NULL");
	while(rs1.next())
	{
		cart_total=rs1.getInt(5);
		cart_total=cart_total+product_total;
		quantity=quantity+1;
		z=1;
	}
	if(z==1)
	{
		stmt.executeUpdate("update cart set total='"+cart_total+"',quantity='"+quantity+"' where product_id='"+product_id+"'and email='"+emailId+"' and address is NULL");
		response.sendRedirect("home.jsp?msg=exist");
	}
	if(z==0)
	{
		PreparedStatement stmnt=con.prepareStatement("insert into cart(email,product_id,quantity,price,total)values(?,?,?,?,?)");
		stmnt.setString(1, emailId);
		stmnt.setString(2, product_id);
		stmnt.setInt(3, quantity);
		stmnt.setInt(4, product_price);
		stmnt.setInt(5, product_total);
		stmnt.executeUpdate();
		response.sendRedirect("home.jsp?msg=added");
		
	}
	
}
catch(Exception e)
{
	System.out.println(e);
	response.sendRedirect("home.jsp?msg=invalid");
}
%>