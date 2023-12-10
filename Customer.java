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

@WebServlet("/CustomerServlet")
public class Customer extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		String name =(String) session.getAttribute("Name");
		System.out.println("Name: "+name);
		
		String bkid = (String) session.getAttribute("BookId");			
		System.out.println("Book Id in Customer Servlet="+bkid);
	
		String email = (String)session.getAttribute("Email");
		System.out.println(email);
		
		int Qty = Integer.parseInt(req.getParameter("Qty"));			
		System.out.println("Qty:"+Qty);
		
		
		
		String btn = req.getParameter("purchase");
		System.out.println("button="+btn);
		
		
		
		if(btn.equals("AddCart"))
		{
			
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				System.out.println("Driver Loaded in Customer Servlet");
				
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3308/bookshopee", "root", "root");
				System.out.println("Connection Success");
				
				PreparedStatement pstm = con.prepareStatement("select * from books where Books_ID=?");
				pstm.setString(1, bkid);
				
				ResultSet rs = pstm.executeQuery();
				
				session.setAttribute("rs1", rs);
				session.setAttribute("qty", Qty);	
				if(name!=null)
				{
					session.setAttribute("qty", Qty);	
					resp.sendRedirect("./AddToCartServlet");					
				}
				else
				{
					session.setAttribute("msg", "Please Login First");
					resp.sendRedirect("PurchasePage.jsp");
				}
				
				
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
							
				
		}
		else
		{
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Driver Loaded in Customer Servlet");
			
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3308/bookshopee", "root", "root");
			System.out.println("Connection Success");
			
			PreparedStatement pstm = con.prepareStatement("select * from books where Books_ID=?");
			pstm.setString(1, bkid);
			
			ResultSet rs = pstm.executeQuery();
			
			session.setAttribute("rs1", rs);
			session.setAttribute("qty", Qty);	
			if(name!=null)
			{
				PreparedStatement pstm1 = con.prepareStatement("select * from custregister where email=?");
				pstm1.setString(1, email);
				System.out.println("Execute Query");
				ResultSet rs1 = pstm1.executeQuery();	
				int pc=0;
				session.setAttribute("BUYCART", pc);
				session.setAttribute("RS", rs1);
				resp.sendRedirect("CustomerPage.jsp");					
			}
			else
			{
				session.setAttribute("msg", "Please Login First");
				resp.sendRedirect("PurchasePage.jsp");
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
}
