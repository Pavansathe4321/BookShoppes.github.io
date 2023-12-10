<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>all cancel order</title>
</head>

<style >
	
		body{
			min-height: 100vh;
			width: 100%;
			background: #D6EAF8;
		}
		
		tr:nth-child(even) {
  			background-color: #D6EEEE;
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
	</style>
<body>
	<center>
		<h1>All Canceled Orders</h1>
		<%		
			
			int i=0; 
		%>
		
		<table border="2" style="background: #FBEEE6">
			<tr> 
				<th> Sr.No </th>				
				<th> Order ID </th>
				<th> Customer 	Name </th>				
				<th> Phone </th>
				<th> Address </th>				
				<th> Qty  </th>
				<th> Total </th>
				<th> Book ID </th>
			</tr>
			
			<%
			try{
				ResultSet rs = (ResultSet)session.getAttribute("rs1");
				
				
				while(rs.next())
				{
					++i;
			%>
			
			<tr> 
				<td> <% out.print(i); %> </td>
				<td> <%= rs.getInt("Order_ID") %> </td>
				<td> <%= rs.getString("Customer_Name") %> </td>
				<td> <%= rs.getLong("Phone") %> </td>
				<td> <%= rs.getString("Address") %> </td>
				<td> <%= rs.getInt("Qty") %> </td>
				<td> <%= rs.getInt("Total") %> </td>
				<td> <%= rs.getString("Book_ID") %> </td>
			</tr>
				
			<%	
					
				}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			%>	
			
		<h4> Total <% out.print(i); %> Orders are Canceled..</h4>
		<br> 
				
		</table>
		
		<table cellpadding="20">
			<tr> 
				<td>
				 	<form action="./WelcomeAdminServlet">
						<input type="submit" value="Home"> 
					</form>
				</td>
				
				<td>
				
					<form action="./CustomerOrdersIndex.jsp">
						<input type="submit" value="Back"> 
					</form>
				</td>
			</tr>
		</table>
		
	</center>
</body>
</html>