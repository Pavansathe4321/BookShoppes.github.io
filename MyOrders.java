import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/MyOrdersServlet")
public class MyOrders extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		int cid=(int)session.getAttribute("Cid");
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Driver Loaded in Myorder Servlet");
			
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3308/bookshopee", "root", "root");
			System.out.println("Connection success");
			
			PreparedStatement pstm= con.prepareStatement("select * from customer_details where cust_id=?");
			pstm.setInt(1, cid);
			ResultSet rs= pstm.executeQuery();
			
			String id=null;
			ArrayList<String>li = new ArrayList<>();
			while(rs.next())
			{
				id=rs.getString("Book_ID");
				System.out.println(id);
				PreparedStatement pstm1= con.prepareStatement("Select * from books where books_id=?");
				pstm1.setString(1, id);
				
				ResultSet r=pstm1.executeQuery();
				while(r.next())
				{
					li.add(r.getString(2));
				}
			}
			
			System.out.println("List");
			System.out.println(li);
			
			PreparedStatement pstm2= con.prepareStatement("select * from customer_details where cust_id=?");
			pstm2.setInt(1, cid);
			ResultSet rs1= pstm2.executeQuery();
		
			
			session.setAttribute("RS", rs1);
			session.setAttribute("li1", li);
			
			resp.sendRedirect("MyOrders.jsp");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
