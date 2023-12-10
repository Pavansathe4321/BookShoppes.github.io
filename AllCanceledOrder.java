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

@WebServlet("/AllCanceledOrderServlet")
public class AllCanceledOrder extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Driver Loaded in Welcome Page");
			
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3308/bookshopee", "root", "root");
			System.out.println("Connection Success");
			
			Statement stm = con.createStatement();
			
			ResultSet rs=stm.executeQuery("select cancleorder.Order_ID,customer_Details.Customer_Name,Customer_Details.Phone,Customer_Details.Address,Customer_Details.Qty,Customer_Details.Total,customer_Details.Book_ID from Customer_Details right join cancleorder on Customer_Details.Order_ID=cancleorder.Order_ID");	
			HttpSession session = req.getSession();
			
			Statement stm1 = con.createStatement();			
			ResultSet count=stm1.executeQuery("select cancleorder.Order_ID,customer_Details.Customer_Name,Customer_Details.Phone,Customer_Details.Address,Customer_Details.Qty,Customer_Details.Total,customer_Details.Book_ID from Customer_Details right join cancleorder on Customer_Details.Order_ID=cancleorder.Order_ID");	
			session.setAttribute("count1", count);
			
			session.setAttribute("rs1", rs);
			
			
			resp.sendRedirect("AllCancelOrders.jsp");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
