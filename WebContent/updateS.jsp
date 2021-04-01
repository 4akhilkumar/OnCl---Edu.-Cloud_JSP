<%@page import="java.sql.*" %>

<%
String email=request.getParameter("email");
String fname=request.getParameter("firstname");
String lname=request.getParameter("lastname");
String gender=request.getParameter("gender");
String phno=request.getParameter("phone");
String branch=request.getParameter("branch");
String cgpa=request.getParameter("cgpa");
String fee=request.getParameter("fee");

String address=request.getParameter("address");
try {
	Connection con = null;
      Class.forName("com.mysql.cj.jdbc.Driver");
      System.out.println("Driver Class Loaded");
      con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
      System.out.println("Connection Established");
      PreparedStatement stmt=con.prepareStatement("update student set firstname=?,lastname=?,gender=?,branch=?,cgpa=?,address=?,phno=?,fee=? where email=?");
      stmt.setString(9,email);
      stmt.setString(1,fname);
      stmt.setString(2,lname);
      stmt.setString(3,gender);
      stmt.setString(4,branch);
      stmt.setString(5,cgpa);
      stmt.setString(7,phno);
      stmt.setString(6,address);
      stmt.setString(8,fee);
      
      int n=stmt.executeUpdate();
      if(n>0){
    	  response.sendRedirect("student_info.jsp");
      }
      con.close();
      
}
catch(Exception e) {
	out.println(e);
}

%>