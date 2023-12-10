<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Recived Order Information</title>

<style type="text/css">
		
		body{
			min-height: 100vh;
			width: 100%;
			background: #FFE5EC;
		}
		
		tr:nth-child(odd) {
  			background-color: #D6EEEE;
  			
		}
		
		tr:nth-child(even) {
  			background-color: #fff;
  		
		}
		
		th{
  			background-color: #91A2D9;
		}
	
		 input[type=submit] {
	        background-color: #62529c;
	        border: none;
	        color: #fff;
	        padding: 10px 30px;
	        text-decoration: none;
	        margin: 3px 2px;
	        cursor: pointer;
	      	
      }
      
      a
      {
      	text-decoration: none;
      	color: #fff;
      }
      #nav
      {
       	background-color: #FFE5EC;
       	border-radius: 7px;
		box-shadow: 0 10px 10px rgba(0,0,0,0.5);
      	
      }
      
      #books
      {
      	position: absolute;
      	top: 40%;
      	left: 50%;
      	width:80%;
      	transform : translate(-50%,-50%);
      	border-radius: 7px;
		box-shadow: 0 10px 10px rgba(0,0,0,0.5);
      }
      button
      {
      	 background-color: #62529c;
	        border: none;
	        color: #fff;
	        padding: 10px 30px;
	        text-decoration: none;
	        margin: 3px 2px;
	        cursor: pointer;
	        border-radius: 7px;
      }
	</style>

</head>
<body>
	<center>
		<h1> Recive Order Details</h1>
		<table border="2" id="books">
			<tr align="center">
				<th>Order_Id</th>
				<th>Customer_Name</th>
				<th>Phone</th>
				<th>Address</th>
				<th>Qty</th>
				<th>Total</th>
				<th>Book_ID</th>
				<th>Order Date</th>
				<th style="background: yellow;">Recive Order Date</th>
			</tr>
			
			<%
			try{
				ResultSet rs = (ResultSet) session.getAttribute("rs1");
				ResultSet RS = (ResultSet) session.getAttribute("RS1");
				
				while(rs.next())
				{
				
			%>
			
			<tr align="center">
				<td><%= rs.getInt("Order_Id") %> </td>
				<td> <%= rs.getString("Customer_Name") %> </td>
				<td> <%= rs.getLong("Phone") %> </td>
				<td> <%= rs.getString("Address") %> </td>
				<td> <%= rs.getInt("Qty") %> </td>
				<td> <%= rs.getInt("Total") %> </td>
				<td> <%= rs.getString("Book_ID") %> </td>
				<td> <%= rs.getDate("Date") %> </td>
						
			
			<%
				}
				
				while(RS.next())
				{
			%>
			
				<td style="background: yellow;"> <%= RS.getDate("Date") %> </td>
			
			<%
				}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			%>
			</tr>
		</table>
	
		<br>
		<br>
		<button > <a href="CustomerOrdersIndex.jsp" style="text-decoration: none;"> Back </a></button>
	</center>
</body>
</html>