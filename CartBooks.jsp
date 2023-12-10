<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Cart</title>

<style type="text/css">

	body
	{
		background: #53BDA5;
	}
	a
	{
		text-decoration: none;
		color: #fff;
	}
	
	.div
	{
		position: absolute;
		top: 50%;
		left: 50%;
		transform: translate(-50%,-50%);
		max-width:400%;
		width:55%;
		background: #CBD6E2;
		border-radius: 8px;
		box-shadow: 0 10px 20px rgba(0,0,0,0.7);
		padding-bottom: 20px;
	}
	
	#TFirst
	{
		 border-radius: 7px;
		 padding: 5px;
		 background: #FFF;	
		 
	}	
	
	tr:nth-child(odd)
	{
		background: skyblue;
	}
	th{
		width: 80px;
	}
	
	#Tsecond
	{
		background: #CBD6E2;
	}
	
	button,input[type=submit]
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
	<div class="div">
			<h1 style="color: navy;">My Cart</h1>
			<button> <a href="./BooksInCartServlet"> Reload</a></button>
			<br>
			<br>
			<table  cellspacing="0" id="TFirst">
			
				<tr align="center" style="background: #EBB8DD;"> 
					<th> Book Name</th>
					<th> Author Name</th>
					<th> Book Price</th>
					<th> Quntity</th>
					<th> Total</th>	
					<th> Remove</th>	
					
				</tr>
					<%
					
						
						int sum=0;
						ResultSet rs = (ResultSet)session.getAttribute("rs1");
						while(rs.next())
						{
							sum=sum+rs.getInt("Total");
					%>
				<tr align="center">
					<td> <%= rs.getString("BName") %></td>
					<td> <%= rs.getString("Author") %></td>
					<td> <%= rs.getInt("Price") %></td>
					<td> <%= rs.getInt("Qty") %></td>
					<td align="left"> <%= rs.getInt("Total") %></td>
					<td style="background: navy;"> <a href="RemoveCartBook.jsp?bkid=<%= rs.getString("BId") %>"> Remove</a></td>
				
				</tr>		
							
						
					<%
						}
					%>
				<tr > 
					<th colspan="4" align="right"> Total :  </th>
					
					<td colspan="2" align="left"> <% out.print(sum); %> </td>
				</tr>
					
				
			</table>
			<br> <br>
			<table id="Tsecond">
				<tr style="background: #fff;">
					<td colspan="3" align="center"> <button ><a href="./WelcomeServlet"> Add More Books </a> </button> </td>
					<td colspan="2">						
						<form action="./BuyCartServlet" method="post">
							<input type="submit" value="PurchaseCart">
						</form>
					</td>
				<tr>
			</table>
	</div>		
	<br>
	<br>
	
	
	
</center>
</body>
</html>