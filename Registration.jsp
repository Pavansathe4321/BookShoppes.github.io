<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Registration</title>
	
	<style >
	
		body{
			min-height: 100vh;
			width: 100%;
			background: #FFCCCC;
		}
		.container
		{
			position: absolute;
			top: 50%;
			left: 50%;
			transform: translate(-50%,-50%);
			max-width: 500%;
			width: 50%;
			background: #FFF;
			border-radius: 7px;
			box-shadow: 0 10px 10px rgba(0,0,0,0.5);
		
		}
		
		.container .form{
			padding: 2rem;
		}
		
		 input[type=submit],input[type=reset]{
	        background-color: #62529c;
	        border: none;
	        color: #fff;
	        padding: 10px 30px;
	        text-decoration: none;
	        margin: 3px 2px;
	        cursor: pointer;
	      	
      }
		
		
		
	</style>
</head>
<body>
		<center>
			<form action="./RegistrationServlet" method="post" class="container">
				<br>
			<i style="color: red"> ( Note: If you register for admin,so have to enter admin code otherwise Ignore it )</i>
				
				<h1 style="background-color: #5DB29E"> Registration Form </h1>
					
				
				<table>
				
					
					<tr> 
						<th colspan="2"	> Register as </th>						
					</tr>
					
					<tr> 
						<th>
							<input type="radio" name="abc" value="Customer">Customer  &nbsp; &nbsp;
						</th>
						
						<th> 
							<input type="radio" name="abc" value="Admin"> Admin						
						</th>
					</tr>
					
					<tr> 
						<th> Admin Code:</th>
						
						<td > <input type="number" name="otp" title="If you register for admin,so have to enter admin code otherwise Ignore it "></td>
					</tr>
				
					
					<tr> 
						<th> Name: </th>
						<td> <input type="text" name="name" placeholder="User Name" required></td>
					</tr>
				
					<tr> 
						<th> Address:</th>
						<td> <input type="text" name="address" placeholder="city name" required></td>
					</tr>
					
					<tr> 
						<th> Mobile No.:</th>
						<td>  <input type="number" name="mob" placeholder="9876543210" required> </td>
					</tr>
						
					<tr> 
						<th> Email:</th>
						<td> <input type="email" name="email" placeholder="abc@gmail.com" required> </td>
					</tr>
					
					<tr> 
						<th> Password:</th>
						<td> <input type="password" name="pass" placeholder="******" required> </td>
					</tr>
					
					<tr> 
						<td> <input type="reset" value="Reset" class="button"></td>
						<td> <input type="submit" value="Register"> </td>
					</tr>
				</table>
					
				<b> Already have account as a Admin?			
					<a href="LoginAdminPage.jsp" style="font-size: 16px; color: #009579; text-decoration: none;">Login As Admin</a>
				</b>	
				<br>
				<b> Already have account as a Customer?			
					<a href="LoginCustomerPage.jsp" style="font-size: 16px; color: #009579; text-decoration: none;">Login As Customer</a>
				</b>	
				
			<%
				String Alert=(String)session.getAttribute("alert");
				if(Alert!=null)
				{
			%>
				<h4 style="color: red;"> <% out.print(Alert); %></h4>
			<%		
					
				}
			%>
				
			</form>
			
		</center>
</body>
</html>