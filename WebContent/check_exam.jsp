<%@page import="java.sql.*" %>
<%
String email=(String)session.getAttribute("email");
String field=request.getParameter("coursename");
System.out.println(field);
try {
	Connection con = null;
      Class.forName("com.mysql.cj.jdbc.Driver");
      System.out.println("Driver Class Loaded");
      con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
      System.out.println("Connection Established");
      PreparedStatement stmt=con.prepareStatement("select * from exam_student where email=? and coursename=?");
      stmt.setString(1, email);
      stmt.setString(2, field);
      ResultSet res=stmt.executeQuery();
      if(res.next())
      {
    	  out.println("Already Written");
      }
      else{
    	  response.sendRedirect("student_exam.jsp?coursename="+field);
      }
      
      
}
catch(Exception e){
	out.println(e);
}

%>