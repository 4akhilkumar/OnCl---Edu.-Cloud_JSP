<%@page import="java.sql.*" %>
<%

String sno=request.getParameter("sno");
String subject=request.getParameter("subject");
String announcement=request.getParameter("announcement");
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
      PreparedStatement stmt=con.prepareStatement("update announcement set subject=?,announcement=?,facultyname=?,faculty_phno=? where sno=?");
      stmt.setString(5,sno);
      stmt.setString(1,subject);
      stmt.setString(2,announcement);
      stmt.setString(3,facultyname);
      stmt.setString(4,faculty_phno);      
      
      int n=stmt.executeUpdate();
      if(n>0) {
    	  if(faculty_email != null) {
        	  response.sendRedirect("announcements_info_faculty.jsp");
    	  }
    	  else {
	    	  response.sendRedirect("announcement_info.jsp");  
    	  }
      }
      con.close();
      
}
catch(Exception e) {
	out.println(e);
}

%>