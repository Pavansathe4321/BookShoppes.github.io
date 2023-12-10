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

@WebServlet("/CustomerOrdersServlet")
public class CustomerOrders extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Driver Loaded in Welcome Page");
			
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3308/bookshopee", "root", "root");
			System.out.println("Connection Success");
			
			Statement stm = con.createStatement();
			ResultSet rs=stm.executeQuery("select * from customer_Details");
			
			Statement stm1 = con.createStatement();
			ResultSet RS=stm1.executeQuery("select Order_Id from reciveorder");
			
			Statement stm2 = con.createStatement();
			ResultSet RS1=stm2.executeQuery("select Order_Id from cancleorder");
			
			
			HttpSession session = req.getSession();
			session.setAttribute("rs1", rs);
			session.setAttribute("RS1", RS);
			session.setAttribute("RS2", RS1);
			resp.sendRedirect("CustomerOrdersPage.jsp");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
