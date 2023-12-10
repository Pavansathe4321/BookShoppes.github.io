<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Details</title>


<style type="text/css">
	body
	{
		background: #FBDBE7;	
	}
	
	.form
	{
		position: absolute;
		top: 50%;
		left: 50%;
		transform: translate(-50%,-50%);
		background: #ffe9b7;	
		max-width: 400%;
		width: 60%;
		border-radius: 8px;
		box-shadow: 0 10px 10px rgba(0,0,0,0.5);
		
		
	}	
	
	tr:nth-child(even) {
  			background-color: #fff;
  		
		}
		
		th{
  			background-color: #91A2D9;
		}
	
	.form1
	{
		position: absolute;
		top: 73.5%;
		left: 55%;
	}
	
	input[type=submit],button{
	        background-color: #62529c;
	        border: none;
	        color: #fff;
	        padding: 8px 20px;
	        text-decoration: none;
	        margin: 3px 2px;
	        cursor: pointer;
	        border-radius: 7px;
	      	
      }
	
</style>


</head>
<body>
<center>


	<%
		
		int buycart=(int) session.getAttribute("BUYCART");
	
		
		if(buycart==0)
		{
	%>
		<form action="./CustomerRegisterServlet" method="post" class="form">
			<h1> Shopping Cart For Book Store</h1>
			
		<%
			try
			{
			
				ResultSet rs1 = (ResultSet)session.getAttribute("RS");
				while(rs1.next())
				{
				
					
				
		%>
			
			Customer Name:	<input type="text" name="name" value="<%=rs1.getString("name")%>" > <br><br>
			Address: 		<input type="text" name="address" value="<%=rs1.getString("address")%>" > <br><br>
			Phone Number:	<input type="number" name="phn" value="<%= rs1.getLong("mobile") %>" ><br><br>
		<%
				}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		%>
			<h3>Your Order Details Are </h3> <br>
			
			<table border="2">
				<tr>
					<th> Book Name</th>
					<th> Author</th>
					<th> Price </th>
					<th> Quntity</th>
					<th> Total Price</th>
				</tr>
				
			<%
			try{
				ResultSet rs =(ResultSet) session.getAttribute("rs1");
				
				
					int Qty = (int)session.getAttribute("qty");
					
					int p;
					while(rs.next())
					{
						p=rs.getInt("Price");
					
				%>
				
				<tr align="center">
						<td> <%= rs.getString("Books_Name") %> </td>
						<td> <%= rs.getString("Author")%> </td>
						<td> <%= rs.getInt("Price")%> </td>
						<td> <% out.println(Qty); %> </td>
						<td> <% out.println(Qty*p); %> </td>
				</tr>
				
				<%
					}
				}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		
			%>
			</table> 
			
			<br>
			
			<input type="submit" value="Confirm">
			<h1> </h1>
		</form>
			<%
			}
			else
			{
				
			%>
					<form action="./CustomerCartRegisterServlet" method="post" class="form">
					<h1> Shopping Cart For Book Store</h1>
				
				
				<%	
				
					try
					{
					
						ResultSet rs1 = (ResultSet)session.getAttribute("RS");
						while(rs1.next())
						{
							
						
				%>
					
					Customer Name:	<input type="text" name="name" value="<%=rs1.getString("name")%>" > <br><br>
					Address: 		<input type="text" name="address" value="<%=rs1.getString("address")%>" > <br><br>
					Phone Number:	<input type="number" name="phn" value="<%= rs1.getLong("mobile") %>" ><br><br>
				<%
						}
					}
					catch(Exception e)
					{
						e.printStackTrace();
					}
				%>
					<h3>Your Order Details Are </h3> <br>
				<table border="2">
				<tr>
					<th> Book Name</th>
					<th> Author</th>
					<th> Price </th>
					<th> Quntity</th>
					<th> Total Price</th>
				</tr>
				<%	
				
				try
				{
					ResultSet rs =(ResultSet) session.getAttribute("rs1");
				
					while(rs.next())
					{
				%>
					<tr align="center">
						<td> <%= rs.getString("BName") %></td>
						<td> <%= rs.getString("Author") %></td>
						<td> <%= rs.getInt("Price") %></td>
						<td> <%= rs.getInt("Qty") %></td>
						<td> <%= rs.getInt("Total") %></td>
					</tr>
				<%	
						
					}
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
				
			
		%>
		</table>
		<input type="submit" value="Confirm">
		<button> <a href="Index.jsp" style="text-decoration: none; color: #fff;"> Cancel</a> </button>
		<br>
		</form>
		<%
			}
			String msg= (String)session.getAttribute("msg");
			if(msg!=null)
			{
				out.println(msg);
			}
			
		%>
		
	
	</center>

</body>
</html>