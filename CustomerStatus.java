import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CustomerStatusServlet")
public class CustomerStatus extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		int orid=(int) session.getAttribute("OrderId");
		
		System.out.println("Order Id in CustomerStutus Servlet="+orid);
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Driver Loaded in Welcome Page");
			
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3308/bookshopee", "root", "root");
			System.out.println("Connection Success");
			
			PreparedStatement pstm = con.prepareStatement("select * from customer_Details where Order_Id=?");
			pstm.setInt(1, orid);
			ResultSet rs=pstm.executeQuery();
			
			session.setAttribute("rs1", rs);
			
			resp.sendRedirect("CustomerOrderStatus.jsp");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		int orid=(int) session.getAttribute("OrderId");
		System.out.println("Order Id in CustomerStutus Servlet="+orid);
		
		Date date = new Date();
		java.sql.Date sql;
		date= new java.sql.Date(date.getTime());
	
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Driver Loaded in CustomerStatus Page");
			
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3308/bookshopee", "root", "root");
			System.out.println("Connection Success order Recived");
			
			PreparedStatement pstm1 = con.prepareStatement("select * from ReciveOrder where Order_Id=?");
			pstm1.setInt(1, orid);
			
			ResultSet rs = pstm1.executeQuery();
			int id = 0;			
			
			while(rs.next())
			{
				id=rs.getInt("Order_Id");
				
			}
			
			if(id!=orid)
			{
				PreparedStatement pstm = con.prepareStatement("insert into ReciveOrder values(?,?)");
				pstm.setInt(1, orid);
				pstm.setDate(2, (java.sql.Date) date);
			
				int i = pstm.executeUpdate();
				System.out.println("Order Recived");
				resp.sendRedirect("./CustomerOrdersServlet");
				
			}
			else {
				System.out.println("Alredy Recived");
				resp.sendRedirect("./CustomerOrdersServlet");
			}
			con.close();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	
}
