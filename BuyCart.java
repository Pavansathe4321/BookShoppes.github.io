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

@WebServlet("/BuyCartServlet")
public class BuyCart extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			HttpSession session = req.getSession();
			int cid= (int)session.getAttribute("Cid");
			System.out.println("Customer id="+cid);
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Driver Loaded in Add Cart Servlet");
			
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3308/bookshopee", "root", "root");
			System.out.println("Connection Success");
			
			PreparedStatement pstm = con.prepareStatement("select * from cart where CustId=?");
			pstm.setInt(1, cid);			
			ResultSet rs = pstm.executeQuery();
			
			PreparedStatement pstm1 = con.prepareStatement("select * from custregister where Id=?");
			pstm1.setInt(1, cid);
			System.out.println("Execute Query");
			ResultSet rs1 = pstm1.executeQuery();				
		
			session.setAttribute("RS", rs1);
			
			int buycart=1;
			
			session.setAttribute("rs1", rs);
			session.setAttribute("BUYCART", buycart);
			
			resp.sendRedirect("CustomerPage.jsp");
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
