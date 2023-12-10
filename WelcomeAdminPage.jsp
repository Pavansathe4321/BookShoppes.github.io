<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome-admin</title>

<style >
	
		body{
			min-height: 100vh;
			width: 100%;
			background: #ffddff;
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
	
		 input[type=submit] {
	        background-color: #62529c;
	        border: none;
	        color: #fff;
	        padding: 10px 30px;
	        text-decoration: none;
	        margin: 3px 2px;
	        cursor: pointer;
	      	
      }
      
      a
      {
      	text-decoration: none;
      	
      }
      #nav
      {
       	background-color: #FFEEEE;
       	border-radius: 7px;
		box-shadow: 0 10px 10px rgba(0,0,0,0.5);
      	
      }
      
      #books
      {
      	border-radius: 7px;
		box-shadow: 0 10px 10px rgba(0,0,0,0.5);
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
	</style>
</head>
<body>
	<%
		String error=(String)session.getAttribute("error1");
		error=null;
		session.setAttribute("error1", error);
	%>
	<center>
		<h1>
			<% 
				String name= (String)session.getAttribute("nm1");
				if(name != null)
				{
					out.print("Welcome,"+name);
			%>
				<br> <button> <a href="./RegistrationServlet?log=1" style="color: #FFF;" > Log Out</a> </button>
			<%		
				}
				else
				{
					response.sendRedirect("LoginAdminPage.jsp");
				}
			%>
		</h1>
		<table cellpadding="15" > 
			
				<tr id="nav" >
					<td> <a href="AddNewBook.jsp"><b> Add New Book </b> </a> </td>
					
					<!-- <td> <a href="UpdateBookPage.jsp"> <b> Update Book Details </b></a> </td>  -->					
					<td> <a href="RemoveBookPage.jsp"> <b> Remove Book From Store </b> </a> </td>
					<td> <a href="CustomerOrdersIndex.jsp"> <b> Customer Orders </b> </a> </td>
					<td> <a href="./RemovedBookServlet"> <b> Removed Books </b> </a> </td>
					
				</tr>
			
		</table>
		
		<br>
		
		
		
		
		
		
		
		<form action="">
		<table border="2" id="books">
			<tr> 
				<th> Book Id</th>
				<th> Books Name </th>
				<th> Author </th>
				<th> Price </th>
				<th colspan="2"> </th>
			</tr>
			<%
				ResultSet rs = (ResultSet)session.getAttribute("rs1");
				ResultSet rs1 = (ResultSet)session.getAttribute("rs2");
				
				ArrayList li = new ArrayList();
				int bcount=0;//book count
				int i=0;//i is used for loop
				int c=0;//c is used to restart flow (when condition is true)
				while(rs1.next())
				{
					li.add(rs1.getString("Books_ID"));
				}
				
				while(rs.next())
				{
					for(i=0;i<li.size();i++)
					{
						if(rs.getString("Books_ID").equals(li.get(i)))
						{
							c=1;
							break;
						}
					}
					
					if(c==1)
					{
						continue;
					}
			%>
			<tr> 
				<td> <%= rs.getString("Books_ID") %> </td>
				<td> <%= rs.getString("Books_Name") %> </td>
				<td> <%= rs.getString("Author")%> </td>
				<td> <%= rs.getInt("Price") %> </td>
				<td> <a href="AdminBookIDPage.jsp?bkid=<%= rs.getString("Books_ID") %>"> Update </a></td>
				<td> <a href="RemoveBookWithIdPage.jsp?bkid1=<%= rs.getString("Books_ID") %>"> Remove </a></td>
			
			</tr>
			
			<%
					bcount++;
				}
			%>
			<p style="font-size: 20">		 
			<% 	
				out.print("<b>"+bcount+" </b> Different Books are avilable..");			
			%>
		</p>
		</table>
		
		
		</form>
	</center>
</body>
</html>