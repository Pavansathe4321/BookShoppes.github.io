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

@WebServlet("/AddToCartServlet")
public class AddToCart extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		String name =(String) session.getAttribute("Name");
		System.out.println("Name: "+name);
		
		String bkid = (String) session.getAttribute("BookId");			
		System.out.println("Book Id in Customer Servlet="+bkid);
	
		int cid= (int)session.getAttribute("Cid");
		System.out.println("Customer id="+cid);
		
		int Qty=(int)session.getAttribute("qty");			
		System.out.println("Qty:"+Qty);
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Driver Loaded in Add Cart Servlet");
			
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3308/bookshopee", "root", "root");
			System.out.println("Connection Success");
			
			PreparedStatement pstm = con.prepareStatement("select * from books where Books_ID=?");
			pstm.setString(1, bkid);
			
			ResultSet rs = pstm.executeQuery();
			
			String bname=null;
			String bauthor=null;
			int price=0;
			int total=0;
			
			while(rs.next())
			{
				bname=rs.getString("Books_Name");
				bauthor=rs.getString("Author");
				price=rs.getInt("Price");
			}
			
			total=price*Qty;
			System.out.println(bname+" "+bauthor+" "+price+" "+total);
			
			PreparedStatement pstm1= con.prepareStatement("insert into cart(CustId,BId,BName,Author,Price,Qty,Total) values(?,?,?,?,?,?,?)");
			pstm1.setInt(1, cid);
			pstm1.setString(2, bkid);
			pstm1.setString(3,bname);
			pstm1.setString(4, bauthor);
			pstm1.setInt(5, price);
			pstm1.setInt(6, Qty);
			pstm1.setInt(7, total);
			
			int i = pstm1.executeUpdate();
			
			if(i!=0)
			{
				System.out.println("book added successfully");
				resp.sendRedirect("./BooksInCartServlet");
			}
			else
			{
				System.out.println("Error");
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
