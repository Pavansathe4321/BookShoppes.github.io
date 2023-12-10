import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CustomerCartRegisterServlet")
public class CustomerCartRegister extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		int cid= (int)session.getAttribute("Cid");
		System.out.println("Customer id="+cid);
		
		String nm = req.getParameter("name");
		String ad = req.getParameter("address");
		long phn = Long.parseLong(req.getParameter("phn"));
		
		//Code For date 
				Date date = new Date();
				java.sql.Date sql;
				date=new java.sql.Date(date.getTime());
		
				System.out.println(nm+" "+ad+" "+phn+" date="+date);
		
		try {
			
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Driver Loaded in Add Cart Servlet");
			
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3308/bookshopee", "root", "root");
			System.out.println("Connection Success");
			
			PreparedStatement pstm = con.prepareStatement("select * from cart where CustId=?");
			pstm.setInt(1, cid);			
			ResultSet rs = pstm.executeQuery();
			System.out.println("Query Execute");
			
			String bid=null;
			int qty=0;
			int total=0;
			int i=0;		
			while(rs.next())
			{
				bid=rs.getString("BId");
				qty=rs.getInt("Qty");
				total=rs.getInt("Total");
				
				System.out.println(nm+" "+ad+" "+phn+" "+qty+" "+total+" "+bid+" "+date);
				PreparedStatement pstm1= con.prepareStatement("insert into customer_details (Customer_Name,Phone,Address,Qty,Total,Book_ID,Date,cust_id) values(?,?,?,?,?,?,?,?)");
				//Customer_Name,Phone,Address,Qty,Total,Book_ID,Date
				pstm1.setString(1, nm);
				pstm1.setLong(2,phn);
				pstm1.setString(3, ad);
				pstm1.setInt(4, qty);
				pstm1.setInt(5, total);
				pstm1.setString(6, bid);
				pstm1.setDate(7, (java.sql.Date) date);
				pstm1.setInt(8, cid);	
				i = pstm1.executeUpdate();
				if(i != 0)
				{
					System.out.println("Book Register");
					PreparedStatement pstm2 = con.prepareStatement("delete from cart where BId=?");
					pstm2.setString(1, bid);
					
					
					int j = pstm2.executeUpdate();
					
					if(j!=0)
					{
						System.out.println("book remove successfully");
						
					}
					else
					{
						System.out.println("Error");
					}
				}
				else
				{
					System.out.println("Error");
					resp.sendRedirect("CustomerPage.jsp");
				}
			}
			
			if(i != 0)
			{
				System.out.println("Order Register");
				resp.sendRedirect("ThankYou.jsp");
			}
			else
			{
				System.out.println("Error");
				resp.sendRedirect("CustomerPage.jsp");
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
