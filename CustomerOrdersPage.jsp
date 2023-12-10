<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Order Page</title>

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
	        border-radius: 7px;
	      	
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
      
      #refresh
		{
			background-color: #62529c;
	        border: none;
	        color: #fff;
	        padding: 5px 10px;
	        text-decoration: none;
	        margin: 3px 2px;
	        border-radius:7px;
	        cursor: pointer;
		}
	</style>

</head>
<body>
<center>
	
	<p align="center">
		<button id="refresh"><a href="CustomerOrdersIndex.jsp"> &#8634;</a></button>
	</p>
	<h1>Shopping Cart For Book Store</h1>
	<h4>Order Details</h4>
	<table cellpadding="10" id="nav">
		<tr >
			<th> <button> <a href="./AllRecivedOrderServlet"> Recived Orders </a> </button> </th>
			<th> <button> <a href="./AllCanceledOrderServlet"> Canceled Orders </a> </button> </th>
			<th> <button> <a href="./AllPendingOrderServlet"> Pending Orders </a> </button> </th>
			
			<th> 
				<form action="./WelcomeAdminServlet">
					<input type="submit" value="Home"> 
				</form>
			</th>
		</tr>
	</table>
	
	<br>
	<table border="2" >
		<tr>
			<th>Order_Id</th>
			<th>Customer_Name</th>
					
			<th>Phone</th>
			<th>Address</th>
			<th>Qty</th>
			<th>Total</th>
			<th>Book_ID</th>
			<th>Order Date</th>
			<th>Custmoer Id</th>	
			
		</tr>
		
		<%
		try{
			ResultSet rs= (ResultSet)session.getAttribute("rs1");
			ResultSet RS= (ResultSet)session.getAttribute("RS1");			
			ResultSet RS1= (ResultSet)session.getAttribute("RS2");
			
			ArrayList<Integer> li = new ArrayList();
			
			while(RS.next())
			{
				li.add(RS.getInt("Order_Id"));
			}
			
			ArrayList<Integer> li1 = new ArrayList();
			
			while(RS1.next())
			{
				li1.add(RS1.getInt("Order_Id"));
			}
			
			int i=0 ,count=0;
			while(rs.next())
			{
				
				for(i=0;i<li.size();i++)
				{
					if(rs.getInt("Order_Id")==li.get(i))
					{
					
		%>
		
		<tr style="color: green;">
			<td> <a href="ReciveOrderID.jsp?Oid=<%= rs.getString("Order_Id") %>" style="color: green;"> <%= rs.getInt("Order_Id") %> </a> </td>			
			<td> <%= rs.getString("Customer_Name") %> </td>
			
			<td> <%= rs.getLong("Phone") %> </td>
			<td> <%= rs.getString("Address") %> </td>
			<td> <%= rs.getInt("Qty") %> </td>
			<td> <%= rs.getInt("Total") %> </td>
			<td> <%= rs.getString("Book_ID") %> </td>
			<td> <%= rs.getDate("Date") %> </td>
			<td> <%= rs.getInt("cust_id") %></td>
			
		</tr>
		<%
							count=1;						
							break;					
					 
					}
				}
				
				if(count==1)
				{
					count=0;
					continue;
				}
				
				for(i=0;i<li1.size();i++)
				{
					if(rs.getInt("Order_Id")==li1.get(i))
					{
					
		%>
		
		<tr style="color: red;">
			<td> <a href="CancelOrderId.jsp?Oid=<%= rs.getString("Order_Id") %>" style="color: red;"> <%= rs.getInt("Order_Id") %> </a></td>
			<td> <%= rs.getString("Customer_Name") %> </td>
			<td> <%= rs.getLong("Phone") %> </td>
			<td> <%= rs.getString("Address") %> </td>
			<td> <%= rs.getInt("Qty") %> </td>
			<td> <%= rs.getInt("Total") %> </td>
			<td> <%= rs.getString("Book_ID") %> </td>
			<td> <%= rs.getDate("Date") %> </td>
			<td> <%= rs.getInt("cust_id") %></td>
			
		</tr>
		<%
						count=1;						
						break;					
		 
					}
				
				}
				
				if(count==1)
				{
					count=0;
					continue;
				}
				else{
				
			
				
		%>
		<tr>
			<td> <a href="OrederStatudIndex.jsp?OdId=<%= rs.getInt("Order_Id") %>" style="color: black;"><%= rs.getInt("Order_Id") %> </a> </td>
			<td> <%= rs.getString("Customer_Name") %> </td>
			<td> <%= rs.getLong("Phone") %> </td>
			<td> <%= rs.getString("Address") %> </td>
			<td> <%= rs.getInt("Qty") %> </td>
			<td> <%= rs.getInt("Total") %> </td>
			<td> <%= rs.getString("Book_ID") %> </td>
			<td> <%= rs.getDate("Date") %> </td>
			<td> <%= rs.getInt("cust_id") %></td>
		</tr>
		<%
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		%>
	</table>
	
</center>
</body>
</html>