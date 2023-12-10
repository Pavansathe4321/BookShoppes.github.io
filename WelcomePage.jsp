<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>WelcomePage</title>

<style type="text/css">
	
	a{
		text-decoration: none;
	}
	body{
			min-height: 100vh;
			width: 100%;
			background: #BFDBC5;
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
	        border-radius: 7px;
	      	
      }
      
     
      #nav
      {
       	background-color: #FFE5EC;
       
      }
      
      
      button
      {
      	 background-color: #62529c;
	        border: none;
	        color: #fff;
	        padding: 10px 30px;
	        text-decoration: none;
	        margin: 3px 2px;
	        cursor: pointer;
	        border-radius: 7px;
	        bottom: 2PX;
      }
</style>
</head>
<body>
	<center>
	 <%
			String error=(String)session.getAttribute("error");
	 		error=null;
	 		session.setAttribute("error", error);
	 		
		 	String name = (String)session.getAttribute("nm1");		 
	 %>
		
		<div>
			<div float=80% align="center">
					<h1>Shopping Cart For Book Store</h1>	
			</div>
		 
		 	<div float=20% align="center" id="nav">
		 					<%
				if(name==null)
				{
			%>	 
				<button> <a href="LoginAdminPage.jsp" style="color: #FFF;" >Admin Login</a> </button>
				
		 		<button> <a href="LoginCustomerPage.jsp" style="color: #FFF;" >Customer Login</a> </button>
		 	<%
				}
				else
				{
		 	%>
		 		<button> <a href="Index.jsp?log=1" style="color: #FFF;" > Log Out</a> </button>
		 		<button> <a href="./BooksInCartServlet" style="color: #FFF;" > My Cart</a> </button>
		 		<button> <a href="./MyOrdersServlet" style="color: #FFF;" > My Orders</a> </button>
		 		
		 	<%
				}
		 	%>
		 	</div>
		
		<h2>
		<%
			if(name!=null)
			{
				out.print("Welcome, "+name); 
			}
			else
			{
				out.print("Welcome, Customer"); 
			}
			session.setAttribute("Name", name);
		%>
		</h2>
		
		
		<table border="1" >
			<br>
			<tr>
				<th>Book Name</th>
				<th>Author</th>
				<th>Price</th>
			</tr>
			
			<%
			try{
				ResultSet rs=(ResultSet)session.getAttribute("rs1");
				ResultSet rs1 = (ResultSet)session.getAttribute("rs2");
				
				ArrayList li = new ArrayList();
				
				
				int c=0;//c is used to restart flow (when condition is true)
				while(rs1.next())
				{
					li.add(rs1.getString("Books_ID"));
				}

				while(rs.next())
				{
					for(int i=0;i<li.size();i++)
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
				<td><a href="Book.jsp?BKID=<%= rs.getString("Books_ID")%>"><%= rs.getString("Books_Name") %> </a> </td>
				<td><%= rs.getString("Author") %></td>
				<td><%= rs.getInt("Price") %></td>
			</tr>
			
			<%
				}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			%>
		
		</table>
	</div>
	</center>
</body>
</html>