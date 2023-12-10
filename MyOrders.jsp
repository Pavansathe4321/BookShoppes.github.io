
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Orders</title>

<style type="text/css">

 		input[type=submit] 
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
     body{
			min-height: 100vh;
			width: 100%;
			background: #FFEEFF;
		}
		th{
  			background-color: #91A2D9;
		}
		tr:nth-child(even) {
  			background-color: #E9967A;
  			
		}
		
		tr:nth-child(odd)
		{
			background: #fff;
		}
		.myorder
		{
			position: absolute;
			top: 50%;
			left: 50%;
			transform: translate(-50%,-50%);
			max-width: 300%;
			width: 55%;			
			background: #F5F5DC;
			border-radius: 8px;
			box-shadow: 0 10px 10px rgba(0,0,0,0.5);
		
		}
		
</style>
</head>
<body>
<div class="myorder">
	<center>
	<h1> My Orders</h1>
		
		<table border="1" >
		
			<tr>
				<th> Order Id </th>
				<th> Book Name</th>
				<th> Quantity </th>
				<th> Total Price</th>
				
			</tr>	
		
	<%
		try{
			ResultSet rs= (ResultSet)session.getAttribute("RS");
			ArrayList li=(ArrayList)session.getAttribute("li1");
			
			int i=0;
			while(rs.next())
			{
	%>
			<tr>
				<td> <%=rs.getInt("Order_Id") %></td>
				<td> <% out.print(li.get(i));  %></td>			
				<td> <%=rs.getInt("Qty") %></td>
				<td> <%=rs.getInt("Total") %></td>
				
			</tr>
			
	<%
			i++;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();	
		}
	%>
	</table>
	<br>
	<form action="Index.jsp" class="form1">
			<input type="submit" value="Home">
	</form>
	<form action="./MyOrdersServlet" >
			<input type="submit" value="&#8634;">
	</form>
	</center>
</div>
</body>
</html>