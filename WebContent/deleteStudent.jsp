<%@page import="java.sql.*" %>
<%
String email=request.getParameter("email");
try {
	Connection con = null;
      Class.forName("com.mysql.cj.jdbc.Driver");
      System.out.println("Driver Class Loaded");
      con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
      System.out.println("Connection Established");
      PreparedStatement stmt=con.prepareStatement("delete from student where email=?");
      stmt.setString(1, email);
      int n=stmt.executeUpdate();
      if(n>0){
    	  response.sendRedirect("student_info.jsp");
      }
}
catch(Exception e){
	out.println(e);
}

%>