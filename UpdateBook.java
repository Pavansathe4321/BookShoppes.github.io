import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/UpdateBookServlet")
public class UpdateBook extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session= req.getSession();
		String sbkid = (String) session.getAttribute("bookid");
		System.out.println("sbkid="+sbkid);
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Driver Loaded in UpdateBook servlet");
			
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3308/bookshopee", "root", "root");
			System.out.println("Connection Success");
			
			PreparedStatement pstm = con.prepareStatement("select * from books where Books_ID=?");
			pstm.setString(1, sbkid);
			ResultSet rs = pstm.executeQuery();
			
			session.setAttribute("rs1", rs);
			
			resp.sendRedirect("UpdateBookWithIdPage.jsp");
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
		
		String bkid= req.getParameter("bkid");
		String bnm= req.getParameter("bkname");
		String ba= req.getParameter("bkauthor");
		int price = Integer.parseInt(req.getParameter("bkprice"));
		
		System.out.println(bkid+" "+bnm+" "+ba+" "+price);
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Driver Loaded in AddBookServlet");
			
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3308/bookshopee", "root", "root");
			System.out.println("Connection Success");
			
			PreparedStatement pstm = con.prepareStatement("update books set Books_Name=?,Author=?, Price=? where Books_ID=?");
			pstm.setString(4, bkid);
			pstm.setString(1,bnm);
			pstm.setString(2, ba);
			pstm.setInt(3, price);
			
			int i= pstm.executeUpdate();
			
			PrintWriter pw = resp.getWriter();
			if(i != 0)
			{
				System.out.println("Record updated");
				resp.sendRedirect("./WelcomeAdminServlet");
				pw.write("Book Updated");
			}
			else
			{
				System.out.println("Error occur");
				resp.sendRedirect("UpdateBookWithIdPage.jsp");
				pw.write("Somthing is Wrong");
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
