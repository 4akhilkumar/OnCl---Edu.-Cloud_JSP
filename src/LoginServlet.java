import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/loginform")
public class LoginServlet extends HttpServlet {
	public void service(HttpServletRequest req,HttpServletResponse res) throws IOException ,ServletException {
		res.setContentType("text/html");
		PrintWriter out=res.getWriter();
		String email=req.getParameter("email");
		String pwd=req.getParameter("password");
		try {
			Connection con = null;
		      Class.forName("com.mysql.cj.jdbc.Driver");
		      System.out.println("Driver Class Loaded");
		      con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
		      System.out.println("Connection Established");
		      PreparedStatement stmt=con.prepareStatement("select * from admin where email=? and password=?");
		      stmt.setString(1, email);
		      stmt.setString(2, pwd);
		      ResultSet rs=stmt.executeQuery();
		      HttpSession session=req.getSession();
//		      session.setMaxInactiveInterval(60);
		      
//		      if(session != null) {
			      if(rs.next()) {
			    	  session.setAttribute("admin_email", email);
			    	  res.sendRedirect("admin_dashboard.jsp");
			    	  System.out.println("Admin Dashboard Accessed.");
			      }
			      else {
			    	  PreparedStatement stmt1=con.prepareStatement("select * from faculty where email=? and password=?");
				      stmt1.setString(1, email);
				      stmt1.setString(2, pwd);
				      ResultSet rs1=stmt1.executeQuery();
				      if(rs1.next()) {
				    	  session.setAttribute("faculty_email", email);
				    	  PreparedStatement pstmt=con.prepareStatement("select * from faculty where email=?");
				    	  pstmt.setString(1, email);
				    	  ResultSet rs3=pstmt.executeQuery();
				    	  while(rs3.next()) {
				    	  session.setAttribute("field", rs3.getString(8));}
				    	  res.sendRedirect("faculty_dashboard.jsp");
				    	  System.out.println("Faculty Dashboard Accessed.");
				      }
				      else {
				    	  PreparedStatement stmt2=con.prepareStatement("select * from student where email=? and password=?");
					      stmt2.setString(1, email);
					      stmt2.setString(2, pwd);
					      ResultSet rs2=stmt2.executeQuery();
					      if(rs2.next()) {
					    	  session.setAttribute("student_email", email);
					    	  res.sendRedirect("student_dashboard.jsp");
					    	  System.out.println("Student Dashboard Accessed.");
					      }
					      else {
					    	  out.println("<script type=\"text/javascript\">");
					          out.println("alert('E - Mail or Password Incorrect!');"
					          		+ "window.location.replace(\"login.jsp\");");
					          out.println("</script>");
					      }  
				      }
			      }
//		      }
//		      else {
//		    	  res.sendRedirect("home.html");
//		    	  System.out.println("Session Timed Out!!");
//		      }
		}
		catch(Exception e) {
			System.out.println(e);
		}
	}
}