<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add New Book </title>
</head>

<style >
	
		body{
			min-height: 100vh;
			width: 100%;
			background: #FFCCCC;
		}
		
		a
		{
			text-decoration: none;
			color: #fff;
		}
		 input[type=submit],input[type=reset],button{
	        background-color: #62529c;
	        border: none;
	        color: #fff;
	        padding: 10px 20px;
	        text-decoration: none;
	        margin: 3px 2px;
	        cursor: pointer;
	        border-radius: 7px;
	      
	      	
      }
      
    .container
		{
			position: absolute;
			top: 50%;
			left: 50%;
			transform: translate(-50%,-50%);
			max-width: 300%;
			width: 40%;
			background: #FFF;
			border-radius: 7px;
			box-shadow: 0 10px 10px rgba(0,0,0,0.5);
		
		}
		.container2
		{
			position: absolute;
			top: 66.5%;
			left: 55%;
		}
		.container .form{
			padding: 2rem;
		}
		
	</style>
<body>
<center>
	
	<form action="./AddBookServlet" method="post" class="container" >
			<% 
				String name= (String)session.getAttribute("nm1");
				String error=(String)session.getAttribute("record");
				if(name == null)
				{
					response.sendRedirect("LoginAdminPage.jsp");
				}
													
			%>
		<h1>Shopping Cart For Book Store</h1>
	
		<table >
			<tr>
				<th colspan="2"> Add New Book</th>				
			</tr>
			
			<tr>
				<th> Book Id: </th>
				<td> <input type="text" name="bkid" required title="Enter Book ID" > </td>
			</tr>
			
			<tr>
				<th> Book Name:</th>
				<td> <input type="text" name="bkname" required title="Enter Book Name"> </td>
			</tr>
			
			<tr>
				<th> Author Name:</th>
				<td> <input type="text" name="bkauthor" required title="Enter Author name"> </td>
			</tr>
			
			<tr>
				<th> Book Price:</th>
				<td> <input type="number" name="bkprice" required title="Enter Book Price"> </td>
			</tr>
			
			<tr>
				<th> <input type="reset" value="Reset"> </th>
				<td align="center"> <input type="submit" value="Add"> </td>
				<td> <button><a href="./WelcomeAdminServlet"> Home</a></button> </td>
			</tr>
		</table>
		
		<h4 style="color: red;">
		<%
			if(error!=null)
			{
				out.print(error);
			}
			
			error=null;
			session.setAttribute("record", error);
		%>
	</h4>
	</form>
	
	
	
</center>
</body>
</html>