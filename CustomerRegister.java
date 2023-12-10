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

@WebServlet("/CustomerRegisterServlet")
public class CustomerRegister extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//Code for get bookid and Qty 
		HttpSession session = req.getSession();
		String bkid =(String) session.getAttribute("BookId");
		int Qty =(int) session.getAttribute("qty");
		int cid = (int)session.getAttribute("Cid");
		System.out.println(bkid+" "+Qty);
		
		//code for get data from jsp page
		String nm = req.getParameter("name");
		String ad = req.getParameter("address");
		long phn = Long.parseLong(req.getParameter("phn"));
		
		//Code For date 
				Date date = new Date();
				java.sql.Date sql;
				date=new java.sql.Date(date.getTime());
				System.out.println(nm+" "+ad+" "+phn+" date="+date);
				
		
		//Code For Validation
		String num="1234567890";
		
		int i,j,result=0;
		char[] num1=num.toCharArray();		
		char [] name1=nm.toCharArray();
	
		

		for(i=0;i<num1.length;i++)
		{
			
			for(j=0;j<name1.length;j++)
			{
				if(num1[i] == name1[j])
				{
					result=1;
					
				}
				
			}
			
		}
		
		if(result !=1)	
		{		
		//code for getting data from database
		
				try {
					Class.forName("com.mysql.cj.jdbc.Driver");
					System.out.println("Driver Loaded in CustomerRegister servlet");
					
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3308/bookshopee", "root", "root");
					System.out.println("Connection Success;");
					PreparedStatement pstm = con.prepareStatement("select * from books where Books_ID=?");
					pstm.setString(1, bkid);
					ResultSet rs1 = pstm.executeQuery();
					
					String bnm=null;
					String anm=null;
					int price=0,total=0;
					
					while(rs1.next())
					{
						bnm=rs1.getString("Books_Name");
						anm=rs1.getString("Author");
						price=rs1.getInt("Price");
					}
					total= price*Qty;
					
					
					System.out.println("Data Base data:");
					System.out.println(bnm+" "+anm+" "+price+" total="+total);
					
					//code for inset data in database
					PreparedStatement pstm1= con.prepareStatement("insert into customer_details (Customer_Name,Phone,Address,Qty,Total,Book_ID,Date,cust_id) values(?,?,?,?,?,?,?,?)");
					//Customer_Name,Phone,Address,Qty,Total,Book_ID,Date
					pstm1.setString(1, nm);
					pstm1.setLong(2,phn);
					pstm1.setString(3, ad);
					pstm1.setInt(4, Qty);
					pstm1.setInt(5, total);
					pstm1.setString(6, bkid);
					pstm1.setDate(7, (java.sql.Date) date);
					pstm1.setInt(8,cid);
					
					i = pstm1.executeUpdate();
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
					System.out.println("Connection close");
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		else
		{
			session.setAttribute("msg", "Don't use digits in name ");
			
			resp.sendRedirect("./CustomerServlet");
		}
		
	}
}
