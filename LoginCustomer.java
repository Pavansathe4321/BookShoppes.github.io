import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginCustomerServlet")
public class LoginCustomer extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String em = req.getParameter("email");
		String p  = req.getParameter("pass");
		
		System.out.println(em+" "+p);
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Driver loaded in Admin Login Servlet");
			
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3308/bookshopee", "root", "root");
			System.out.println("Connection susscess");
			
			Statement stm = con.createStatement();
			ResultSet rs = stm.executeQuery("select * from custregister");
			
			int count=0;
			String name=null;
			String email=null;
			int id=0;
			while(rs.next())
			{
				
				if(em.equals(rs.getString("email")) && p.equals(rs.getString("password")))
				{
					System.out.println("Login success");
					name=rs.getString("name");
					email=rs.getString("email");
					id=rs.getInt("Id");
					
					HttpSession session= req.getSession();
					session.setAttribute("nm1", name);
					session.setAttribute("Email", email);
					session.setAttribute("Cid", id);
					
					resp.sendRedirect("Index.jsp");
					count=1;
					break;
				}
				
			}
			
			if(count!=1)
			{
				HttpSession session = req.getSession();
				session.setAttribute("error", "Invalid credentials");
				resp.sendRedirect("LoginCustomerPage.jsp");
			}
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
