<%@page import="java.sql.*,java.util.*,java.io.*,java.lang.*" %>
<%

String subject=request.getParameter("subject");
String announcement=request.getParameter("announcement");
String facultyname=request.getParameter("facultyname");
String faculty_email=(String)session.getAttribute("faculty_email");
String faculty_phno=request.getParameter("faculty_phno");

try {
	Connection con = null;
      Class.forName("com.mysql.cj.jdbc.Driver");
      System.out.println("Driver Class Loaded");
      con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
      System.out.println("Connection Established");
      PreparedStatement stmt=con.prepareStatement("insert into announcement(subject,announcement,facultyname,faculty_email,faculty_phno) values(?,?,?,?,?)");
      stmt.setString(1,subject);
      stmt.setString(2,announcement);
      stmt.setString(3,facultyname);
      stmt.setString(4,faculty_email);
      stmt.setString(5,faculty_phno);

      int n=stmt.executeUpdate();
      if(n>0){
    	  response.sendRedirect("announcement_info.jsp");
      }
      
      con.close();
      
}
catch(Exception e) {
	out.println(e);
}

%>