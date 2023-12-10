import java.io.IOException;
import java.io.PrintWriter;
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

@WebServlet("/AddBookServlet")
public class AddBook extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String bkid= req.getParameter("bkid");
		String bnm= req.getParameter("bkname");
		String ba= req.getParameter("bkauthor");
		int price = Integer.parseInt(req.getParameter("bkprice"));
		
		HttpSession session = req.getSession();
		System.out.println(bkid+" "+bnm+" "+ba+" "+price);
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Driver Loaded in AddBookServlet");
			
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3308/bookshopee", "root", "root");
			System.out.println("Connection Success");
			
			PreparedStatement pstm = con.prepareStatement("insert into books values(?,?,?,?)");
			pstm.setString(1, bkid);
			pstm.setString(2,bnm);
			pstm.setString(3, ba);
			pstm.setInt(4, price);
			
			int i= pstm.executeUpdate();
			
			PrintWriter pw = resp.getWriter();
			if(i != 0)
			{
				System.out.println("Record inserted");
				resp.sendRedirect("AddNewBook.jsp");
				pw.write("Book Added");
			}
			else
			{
				System.out.println("Error occur");
				resp.sendRedirect("AddNewBook.jsp");
				pw.write("Somthing is Wrong");
			}
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			resp.sendRedirect("AddNewBook.jsp");
			session.setAttribute("record", "Use Different Book Id");
		}
	}
}
