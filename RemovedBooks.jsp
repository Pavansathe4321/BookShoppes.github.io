<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Removed Books by Admin</title>

<style type="text/css">
		body{
			min-height: 100vh;
			width: 100%;
			background: #ffddff;
		}
		
		.table
		{
			position: absolute;
			top: 50%;
			left: 50%;
			max-width: 500%;
			width: 40%;
			transform: translate(-50%,-50%);
			border-radius: 8px;
			background: #fff;
			box-shadow: 0 10px 20px rgba(0,0,0,0.7);
			padding: 15px;
		}
	
		a
		{
			color: #fff;
			text-decoration: none;
		}
		
		button
		{
			background-color: #62529c;
	        border: none;
	        color: #fff;
	        padding: 10px 30px;
	        text-decoration: none;
	        margin: 3px 2px;
	        border-radius:7px;
	        cursor: pointer;
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
	<div class="table">
		
		<p align="right">
			 <button id="refresh"><a href="./RemovedBookServlet"> &#8634;</a></button>
		</p>
		<h2 style="color: red;"> Removed Books Store</h2>
		
		<table border="2">
			<tr> 
				<th> Book Id</th>
				<th> Books Name </th>
				<th> Author </th>
				<th> Price </th>			
			</tr>
		<%
			ResultSet rs = (ResultSet)session.getAttribute("rs1");
			while(rs.next())
			{
		%>
			<tr> 
				<td> <%= rs.getString("Books_ID") %> </td>
				<td> <%= rs.getString("Books_Name") %> </td>
				<td> <%= rs.getString("Author")%> </td>
				<td> <%= rs.getInt("Price") %> </td>
			</tr>
	
		<%
			}
		%>
		
		</table>	
		<br>
		 <button><a href="./WelcomeAdminServlet"> Home</a></button> 
		  
		
		
	</div>
</center>
</body>
</html>