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

@WebServlet("/CancelOrderInformationServlet")
public class CancelOrderInformation extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		int oid=(int) session.getAttribute("OID");
		
		System.out.println("OrderId="+oid);
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Driver Loaded in ReciveOrderInformationServlet");
			
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3308/bookshopee", "root", "root");
			System.out.println("Connection Success");
			
			PreparedStatement pstm = con.prepareStatement("select * from customer_Details where Order_Id=?");
			pstm.setInt(1, oid);
			ResultSet rs=pstm.executeQuery();
			
			PreparedStatement pstm1 = con.prepareStatement("select * from cancleorder where Order_Id=?");
			pstm1.setInt(1, oid);
			ResultSet RS=pstm1.executeQuery();
				
			session.setAttribute("rs1", rs);
			session.setAttribute("RS1", RS);
			resp.sendRedirect("CancelOrderInformation.jsp");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
