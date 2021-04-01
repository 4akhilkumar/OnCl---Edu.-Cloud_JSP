<%@page import="java.sql.*,java.util.*,java.io.*,java.lang.*" %>

<%
String coursename=request.getParameter("coursename");
String topics=request.getParameter("topics");
String shareablelink=request.getParameter("shareablelink");
String facultyname=request.getParameter("facultyname");
String faculty_email=(String)session.getAttribute("faculty_email");
String faculty_phno=request.getParameter("faculty_phno");

try {
	Connection con = null;
      Class.forName("com.mysql.cj.jdbc.Driver");
      System.out.println("Driver Class Loaded");
      con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
      System.out.println("Connection Established");
      PreparedStatement stmt=con.prepareStatement("insert into sessions(coursename,topics,shareablelink,facultyname,faculty_email,faculty_phno) values(?,?,?,?,?,?)");
      stmt.setString(1,coursename);
      stmt.setString(2,topics);
      stmt.setString(3,shareablelink);
      stmt.setString(4,facultyname);
      stmt.setString(5,faculty_email);
      stmt.setString(6,faculty_phno);

      int n=stmt.executeUpdate();
      if(n>0){
    	  response.sendRedirect("session_info_faculty.jsp");
      }
      con.close();
}
catch(Exception e) {
	out.println(e);
}
%>