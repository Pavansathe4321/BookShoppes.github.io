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

@WebServlet("/RemoveBookServlet")
public class RemoveBook extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session= req.getSession();
		String sbkid = (String) session.getAttribute("bookid1");
		System.out.println("sbkid="+sbkid);
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Driver Loaded in get Remove Book Servlet");
			
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3308/bookshopee", "root", "root");
			System.out.println("Connection Success");
			
			PreparedStatement pstm=con.prepareStatement("Select * from books where Books_ID=?");
			pstm.setString(1, sbkid);
			
			ResultSet rs = pstm.executeQuery();
			String bnm=null;
			String ba=null;
			int price = 0;
			
			while(rs.next())
			{
				bnm=rs.getString("Books_Name");
				ba=rs.getString("Author");
				price=rs.getInt("Price");
			}
			
			System.out.println(sbkid+" "+bnm+" "+ba+" "+price);
			
			
			PreparedStatement pstm1 = con.prepareStatement("insert into removedbooks values(?,?,?,?)");
			pstm1.setString(1,sbkid);
			pstm1.setString(2,bnm);
			pstm1.setString(3,ba);
			pstm1.setInt(4,price);
			
			int i = pstm1.executeUpdate();
			PrintWriter pw = resp.getWriter();
			if(i != 0)
			{
				System.out.println("Record inserted in removed Books");
				resp.sendRedirect("./WelcomeAdminServlet");
			
			}		
			else
			{
				System.out.println("Error occur");
			
				pw.write("Somthing is Wrong");
			}
			
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
		System.out.println("Book id="+bkid);
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Driver Loaded in Remove Book Servlet");
			
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3308/bookshopee", "root", "root");
			System.out.println("Connection Success");
			
			PreparedStatement pstm=con.prepareStatement("Select * from books where Books_ID=?");
			pstm.setString(1, bkid);
			
			ResultSet rs = pstm.executeQuery();
			String bnm=null;
			String ba=null;
			int price = 0;
			
			while(rs.next())
			{
				bnm=rs.getString("Books_Name");
				ba=rs.getString("Author");
				price=rs.getInt("Price");
			}
			
			System.out.println(bkid+" "+bnm+" "+ba+" "+price);
			
			PreparedStatement pstm1 = con.prepareStatement("insert into removedbooks values(?,?,?,?)");
			pstm1.setString(1, bkid);
			pstm1.setString(2,bnm);
			pstm1.setString(3, ba);
			pstm1.setInt(4, price);
		
			int i = pstm1.executeUpdate();
			PrintWriter pw = resp.getWriter();
			if(i != 0)
			{
				System.out.println("Record inserted in removed Books");
				resp.sendRedirect("./WelcomeAdminServlet");
				pw.write("Book Deleted");
			}		
			else
			{
				System.out.println("Error occur");
				//resp.sendRedirect("UpdateBookPage.jsp");
				pw.write("Somthing is Wrong");
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
