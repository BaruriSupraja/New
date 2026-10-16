package pac11;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.*;

@WebServlet("/Arraylist")
public class Arraylist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url="jdbc:mysql://localhost:3306/school";
		String username="root";
		String password="barurichandrasekhar@885";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,username,password);
			PreparedStatement st=con.prepareStatement("select *from student1");
			ResultSet res=st.executeQuery();
			ArrayList <Object[]> Std =new ArrayList<>();
			while(res.next()) {
			Object[] values= { res.getString(1),
				res.getInt(2),
				res.getInt(3)	
			 };
			Std.add(values);
			}
			request.setAttribute("details",Std);
			request.getRequestDispatcher("/Output.jsp").forward(request,response);
			con.close();
		  }
		catch(Exception e) {
			e.printStackTrace();		
			}
	 }
}

