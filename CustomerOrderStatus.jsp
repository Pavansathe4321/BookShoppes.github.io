<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Order Status</title>

<style type="text/css">
	
	body
	{
		min-height: 100vh;
		width: 100%;
		background: pink;
	}
	
	.form{
		position: absolute;
		top: 30%;
		left: 26%;
		trasform: translate(-50%,-50%);
		background: #EDF7F6;
		max-width:300%;
		width: 50%;
		border-radius: 8px;
		box-shadow: 0 10px 20px rgba(0,0,0,0.7);
		padding-bottom: 15px;
	}
	
	
	
	#Deliverd{
	        background-color: green;
	        border: none;
	        color: #fff;
	        padding: 8px 15px;
	        margin: 3px 2px;
	        cursor: pointer;
	        border-radius: 7px;
	      	
      }
      
     #Cancled
     {
     	 background-color: red;
	     border: none;
	     color: #fff;
	     padding: 8px 15px;
	     margin: 3px 2px;
	 	 cursor: pointer;
	     border-radius: 7px;
	      	
     }
      
     #Back
     {
     	 background-color: #1167b1;
	     border: none;
	     color: #fff;
	     padding: 8px 15px;
	     margin: 3px 2px;
	 	 cursor: pointer;
	     border-radius: 7px;
	     
     }
     
     a
     {
     	text-decoration: none;
     	color:#fff;
     }
     
</style>

</head>
<body>
<center>
	
	<div class="form">
		<form action="./CustomerStatusServlet" method="post" >
				
			<h1>Shopping Cart For Book Store</h1>
			<%
				ResultSet rs = (ResultSet) session.getAttribute("rs1");
				while(rs.next())
				{
					
				
			%>
			<p>Order Details of <b><%= rs.getString("Customer_Name") %></b> </p>
			<table>
				<tr> 
					<th> Order_Id: </th>
					<td> <%= rs.getInt("Order_Id") %> </td>
				</tr>
				<tr> 
					<th> Book_ID: </th>
					<td> <%= rs.getString("Book_ID") %></td>
				</tr>
				
				<tr> 
					<th> Qauntity: </th>
					<td> <%= rs.getInt("Qty") %>  </td>
				</tr>
				
				<tr> 
					<th> Total: </th>
					<td> <%= rs.getInt("Total") %>  </td>
				</tr>
				<tr> 
					<th> Address:</th>
					<td> <%= rs.getString("Address") %> </td>
				</tr>
				
				<tr> 
					<th> Phone: </th>
					<td> <%= rs.getLong("Phone") %></td>
				</tr>
				
				<tr> 
					<th> Date: </th>
					<td> <%= rs.getDate("Date") %></td>
				</tr>
				<tr> 
					<td> <input type="submit" value="Order Deliverd" id="Deliverd"></td>
					<td> <button id="Cancled"> <a href="./CancelOrderServlet" > Order Cancled</a></button> </td>
					<td> <button id="Back"> <a href="./CustomerOrdersServlet"> Back</a> </button> </td>
				</tr>
			</table>
			
		</form> 
	<%
		}
	%>
	
	
	</div>
</center>
</body>
</html>