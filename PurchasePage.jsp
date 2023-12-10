<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Purchase Page </title>

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
		width: 50%;
		border-radius: 8px;
		box-shadow: 0 10px 10px rgba(0,0,0,0.5);
		padding-bottom: 30px;
		
	}	
	
	.form1
	{
		position: absolute;
		top: 65%;
		left: 55%;
	}
	.form2
	{
		position: absolute;
		top: 70%;
		left: 50%;
		
	}
	#Error
	{
		position: absolute;
		top: 72%;
		left: 50%;
		
	}
	input[type=submit]{
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
		String msg = (String)session.getAttribute("msg");
		try{
			
			ResultSet rs =(ResultSet)session.getAttribute("rs1");
		
			while(rs.next())
			{
		%>
		
		<form action="./CustomerServlet" class="form">
		<h1> Shopping Cart Book Store</h1>
		<h2>Selected Book Details are displayed</h2>
		<b>	Book Name: </b> <i>	<%= rs.getString("Books_Name") %> </i>	<br><br>
		<b>	Author:		</b> <i> <%= rs.getString("Author") %> </i>	<br><br>
		<b>	Price: </b>		 <i> <%= rs.getInt("Price") %> </i>	<br><br>
		<%
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		%>
		
			<b> Quntity: </b>	<input type="number" name="Qty" required> <br><br>
			
		<input type="submit" name="purchase" value="Purchase">  <br>
		<input type="submit" name="purchase" value="AddCart">
			<h1> </h1>
		</form><br><br>
		
		<form action="Index.jsp" class="form1">
			<input type="submit" value="Cancel">
		</form>
		
	
		
		
		<h4 style="color: red;" id="Error">
			<%
				if(msg!=null)
				{
					out.print(msg+"...");
			%>
			<br>
			<a href="LoginCustomerPage.jsp" style="text-decoration: none; color: blue;">&#x261B; Login here</a>
			<% 
				}
			%>
		</h4>
		
		
	</center>
</body>
</html>