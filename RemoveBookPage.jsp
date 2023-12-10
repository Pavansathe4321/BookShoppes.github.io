<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Remove Book</title>

	
	<style >
	body{
			min-height: 100%;
			width: 100%;
			background: #FFCCCC;
		}
		
		
		 input[type=submit],input[type=reset]{
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
			top: 40%;
			left: 50%;
			transform: translate(-50%,-50%);
			max-width: 300%;
			width: 50%;
			background: #FFF;
			border-radius: 8px;
			box-shadow: 0 10px 10px rgba(0,0,0,0.5);
		
		}
		
		.container2
		{
			position: absolute;
			top: 43%;
			left: 56%;
		}
		.container .form{
			padding: 2rem;
		}
		
	</style>

</head>
<body>
<center>
<form action="./RemoveBookServlet" method="post" class="container">
		<%
			String name= (String)session.getAttribute("nm1");
			if(name == null)
			{
				response.sendRedirect("LoginAdminPage.jsp");
			}
		%>
		<br>
		<h2>Remove Book Details</h2>
		<table >
			
			<tr>
				<th> Book Id: </th>
				<td> <input type="text" name="bkid"> </td>
			</tr>
							
			<tr>
				<th> <input type="reset" value="Reset"> </th>
				<td> <input type="submit" value="Remove"> </td>
			</tr>
		</table>
		<br>
		<br>
	</form>
	<form action="./WelcomeAdminServlet" class="container2">
		<input type="submit" value="Home"> 
	</form>
	
</center>
</body>
</html>