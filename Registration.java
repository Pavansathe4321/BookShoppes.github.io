import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/RegistrationServlet")
public class Registration extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String log=(String)req.getParameter("log");
		
		if(log!=null)
		{
			String name=null;
			session.setAttribute("nm1", name);			
		}
		resp.sendRedirect("./WelcomeAdminServlet");
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		
		String nm= req.getParameter("name");
		String add=req.getParameter("address");
		long mob=Long.parseLong(req.getParameter("mob"));
		String em= req.getParameter("email");
		String ps= req.getParameter("pass");
		int code = 0;
		 String abc=req.getParameter("abc");
		 System.out.println(abc);
		
		
		System.out.println(nm+" "+add+" "+mob+" "+em+" "+ps);
		
		
		
		
		try {
			
			abc = req.getParameter("abc");
			
			 if(abc==null)
			 {
				 throw new NullPointerException("Choose your role Admin Or Cutomer");
			 }
			
			 System.out.println("Register As="+abc);
			 
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Driver Loaded in Register Servlet");
			
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3308/bookshopee", "root", "root");
			System.out.println("Connection success");

			if(abc.equals("Admin"))
			{
				 code= Integer.parseInt(req.getParameter("otp"));
				 if(code==0)
				 {
					 throw new NumberFormatException();
				 }
				 
				PreparedStatement pstm1=con.prepareStatement("select * from adminregister where email=?");
				pstm1.setString(1, em);
				
				ResultSet rs=pstm1.executeQuery();
				String email=null;
				long mobile=0;
				while(rs.next())
				{
					mobile=rs.getLong("mobile");
					email=rs.getString("email");
				}
				
				if(em.equals(email) || mobile== mob)
				{
					resp.sendRedirect("Registration.jsp");
					session.setAttribute("alert", "Alredy register");
				}
				
				
				PreparedStatement pstm=con.prepareStatement("insert into adminregister (name,address,mobile,email,password)values(?,?,?,?,?)");
				pstm.setString(1, nm);
				pstm.setString(2, add);
				pstm.setLong(3, mob);
				pstm.setString(4, em);
				pstm.setString(5, ps);
				
				int i=0;
				if(code==1111)
				{
					 i = pstm.executeUpdate();
				}
				if(i!=0 )
				{
					System.out.println("Register success");
					resp.sendRedirect("LoginAdminPage.jsp");
				}
				else
				{
					System.out.println("Erorr");
					resp.sendRedirect("Registration.jsp");
				}
			}
			else
			{
				PreparedStatement pstm1=con.prepareStatement("select * from custregister where email=?");
				pstm1.setString(1, em);
				
				ResultSet rs=pstm1.executeQuery();
				String email=null;
				long mobile=0;
				while(rs.next())
				{
					mobile=rs.getLong("mobile");
					email=rs.getString("email");
				}
				
				if(em.equals(email) || mobile== mob)
				{
					resp.sendRedirect("Registration.jsp");
					session.setAttribute("alert", "Alredy register");
				}
				
				PreparedStatement pstm=con.prepareStatement("insert into custregister(name,address,mobile,email,password)values(?,?,?,?,?)");
				pstm.setString(1, nm);
				pstm.setString(2, add);
				pstm.setLong(3, mob);
				pstm.setString(4, em);
				pstm.setString(5, ps);
				
				int i = pstm.executeUpdate();
				
				if(i!=0 )
				{
					System.out.println("Register success");
					resp.sendRedirect("LoginCustomerPage.jsp");
				}
				else
				{
					System.out.println("Erorr");
					resp.sendRedirect("Registration.jsp");
				}
			}
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		catch(NullPointerException e)
		{
			session.setAttribute("alert", e.getMessage());
			resp.sendRedirect("Registration.jsp");
			
		}
		catch (NumberFormatException e) {
			session.setAttribute("alert", "Enter Right Admin Code For Admin Registration");
			resp.sendRedirect("Registration.jsp");
			
		}
	}
}
