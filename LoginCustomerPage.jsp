<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Login</title>
</head>
<body>


	<style >
	
		body{
			min-height: 100vh;
			width: 100%;
			background: #FFEEFF;
		}
		#login_form
		{
			position: absolute;
			top: 50%;
			left: 50%;
			transform: translate(-50%,-50%);
			max-width: 300%;
			width: 35%;
			height: 35%;	
			background: #D1DCFF;
			border-radius: 7px;
			box-shadow: 0 10px 10px rgba(0,0,0,0.5);
			padding-bottom: 20px;
		
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
		<%
			String Alert=(String)session.getAttribute("alert");
			Alert=null;
			session.setAttribute("alert", Alert);
		%>
	<center>
	
		<form action="./LoginCustomerServlet" method="post" id="login_form">
			<br>
			<br>
			<table>
				<tr>
					<th colspan="2"> Hello, Customer</th>
				</tr>
				
				<tr> 
					<th> User Name:</th>
					<td> <input type="email" name="email" placeholder="abc@gmail.com" > </td>
				</tr>
				
				<tr> 
					<th> Password:</th>
					<td> <input type="password" name="pass" placeholder="******"> </td>
				</tr>
				
				<tr> 
					<td> <input type="reset" name="Reset"> </td>
					<td> <input type="submit" name="Login"> </td>
				</tr>
			</table>
			<a href="Registration.jsp" style="text-decoration: none"> New Customer Registration</a>
			
			
		<%
			
			
			String error=(String)session.getAttribute("error");
			System.out.print(error);
		
			if(error!=null)
			{
		%>
		<h4 style="color: red; ">
		<%
				out.print(error);	
			}
			
		%>
		</h4>
		</form>
	</center>
</body>
</html>