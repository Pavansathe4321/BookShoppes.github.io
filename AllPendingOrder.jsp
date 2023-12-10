<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>


<style >
	
		body{
			min-height: 100vh;
			width: 100%;
			background: #D6EAF8;
		}
		
		tr:nth-child(even) {
  			background-color: #D6EEEE;
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
	</style>

<body>
	<center>
		<h1>All Pending Orders</h1>
		<%		
			int j=0; 
		%>
		
		<table border="2" style="background: #FBEEE6">
			<tr> 
				<th> Sr.No </th>				
				<th> Order ID </th>
				<th> Customer Name </th>				
				<th> Phone </th>
				<th> Address </th>				
				<th> Qty  </th>
				<th> Total </th>
				<th> Book ID </th>
				<th> Order Date </th>
				
			</tr>
			
			<%
			try{
				ResultSet rs = (ResultSet)session.getAttribute("RS");	
				ResultSet rs1 = (ResultSet)session.getAttribute("RS1");
				ResultSet rs2 = (ResultSet)session.getAttribute("RS2");
				
				ArrayList<Integer>li1 = new ArrayList();
				
				while(rs1.next())
				{
					li1.add(rs1.getInt("Order_ID"));
				}
				
				ArrayList<Integer>li2 = new ArrayList();
				
				while(rs2.next())
				{
					li2.add(rs2.getInt("Order_ID"));
				}
				
				int count =0,i=0;
				while(rs.next())
				{
					
					for(i=0;i<li1.size();i++)
					{
						if(rs.getInt("Order_Id")==li1.get(i))
						{					
							count=1;						
							break;					
					 
						}
					}
					
					if(count==1)
					{
						count=0;
						continue;
					}
					
					for(i=0;i<li2.size();i++)
					{
						if(rs.getInt("Order_Id")==li2.get(i))
						{
						
							count=1;						
							break;					
			 
						}
					
					}
					
					if(count==1)
					{
						count=0;
						continue;
					}
					else{
					
				++j;
					
			%>
			<tr>
				<td> <% out.print(j); %></td>
				<td> <a href="OrederStatudIndex.jsp?OdId=<%= rs.getInt("Order_Id") %>" style="color: black;"><%= rs.getInt("Order_Id") %> </a> </td>
				<td> <%= rs.getString("Customer_Name") %> </td>
				<td> <%= rs.getLong("Phone") %> </td>
				<td> <%= rs.getString("Address") %> </td>
				<td> <%= rs.getInt("Qty") %> </td>
				<td> <%= rs.getInt("Total") %> </td>
				<td> <%= rs.getString("Book_ID") %> </td>
				<td> <%= rs.getDate("Date") %> </td>
			</tr>
			<%
					}
				}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			%>
		<h4> Total <% out.print(j); %> Orders are Pending..</h4>
		<br>			
		</table>
	
	
		<table cellpadding="20">
			<tr> 
				<td>
				 	<form action="./WelcomeAdminServlet">
						<input type="submit" value="Home"> 
					</form>
				</td>
				
				<td>
				
					<form action="./CustomerOrdersIndex.jsp">
						<input type="submit" value="Back"> 
					</form>
				</td>
			</tr>
		</table>
		
	</center>
	
</body>
</html>