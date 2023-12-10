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

@WebServlet("/WelcomeAdminServlet")
public class WelcomeAdmin extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Driver Loaded in Welcome Admin servlet");
			
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3308/bookshopee", "root", "root");
			System.out.println("Connection Success");
			
			Statement stm = con.createStatement();
			ResultSet rs = stm.executeQuery("select * from books");
			
			
			
			Statement stm2 = con.createStatement();
			ResultSet rs1 = stm2.executeQuery("select * from removedbooks");
			
			
			HttpSession session = req.getSession();
			session.setAttribute("rs1", rs);
			session.setAttribute("rs2", rs1);	
			resp.sendRedirect("WelcomeAdminPage.jsp");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
