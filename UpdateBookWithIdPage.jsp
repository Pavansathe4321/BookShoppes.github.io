<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Book With Id</title>


<style >
	body{
			min-height: 100vh;
			width: 100%;
			background: #FFCCCC;
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
      a
      {
      	text-decoration: none;
      	color: #fff;
      }
      
    .container
		{
			position: absolute;
			top: 40%;
			left: 50%;
			transform: translate(-50%,-50%);
			max-width: 300%;
			max-height: 500%;
			width: 50%;
			background: #FFF;
			border-radius: 7px;
			box-shadow: 0 10px 10px rgba(0,0,0,0.5);
		
		}
		
		.container2
		{
			position: absolute;
			top: 47.2%;
			left: 56%;
		}
		.container .form{
			padding: 2rem;
		}
		
	</style>
</head>
<body>
<center>
		<form action="./UpdateBookWithIdServlet" method="post" class="container">
		<table>
			<tr>
				<th colspan="2"> Update Book Details</th>				
			</tr>
			
			<%
			try{
					ResultSet rs = (ResultSet)session.getAttribute("rs1");
					while(rs.next())
					{
					
			%>
			<tr>
				<th> Book Id: </th>
				<td> <%= rs.getString("Books_ID") %> </td>
			</tr>
			
			<tr>
				<th> Book Name:</th>
				<td align="left"> <input type="text" name="bkname" value=" <%= rs.getString("Books_Name") %> "> </td>
			</tr>
			
			<tr>
				<th> Author Name:</th>
				<td align="left"> <input type="text" name="bkauthor" value=" <%= rs.getString("Author") %> "> </td>
			</tr>
			
			<tr>
				<th> Book Price:</th>
				<td align="left"> <input type="number" name="bkprice" value="<%= rs.getInt("Price")%>"> </td>
			</tr>
			
			<%
					}
				
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			%>
			
			<tr>
				<td> <input type="reset" value="Reset"> </td>
				<td align="center"> <input type="submit" value="Update"> </td>
				<td align="left"> <button> <a href="./WelcomeAdminServlet"> Home</a></button></td>
			</tr>
		</table>
	</form>
	
	
</center>
</body>
</html>