<%@page import="java.sql.*" %>

<%

String sno=request.getParameter("sno");
String coursename=request.getParameter("coursename");
String topics=request.getParameter("topics");
String shareablelink=request.getParameter("shareablelink");
String facultyname=request.getParameter("facultyname");
String faculty_phno=request.getParameter("faculty_phno");

String admin_email = (String)session.getAttribute("admin_email");
String faculty_email = (String)session.getAttribute("faculty_email");

try {
	Connection con = null;
      Class.forName("com.mysql.cj.jdbc.Driver");
      System.out.println("Driver Class Loaded");
      con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
      System.out.println("Connection Established");
      PreparedStatement stmt=con.prepareStatement("update sessions set coursename=?,topics=?,shareablelink=?,facultyname=?,faculty_email=?,faculty_phno=? where sno=?");
      stmt.setString(7,sno);
      stmt.setString(1,coursename);
      stmt.setString(2,topics);
      stmt.setString(3,shareablelink);
      stmt.setString(4,facultyname);
      stmt.setString(5,faculty_email);
      stmt.setString(6,faculty_phno);      
      
      int n=stmt.executeUpdate();
      if(n>0) {
    	  if(faculty_email != null) {
        	  response.sendRedirect("session_info_faculty.jsp");
    	  }
    	  else {
	    	  response.sendRedirect("session_info.jsp");  
    	  }
      }
      con.close();
      
}
catch(Exception e) {
	out.println(e);
}

%>