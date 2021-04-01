<%@page import="java.sql.*" %>
<%
String email=request.getParameter("email");
String fname=request.getParameter("firstname");
String lname=request.getParameter("lastname");
String gender=request.getParameter("gender");
String phno=request.getParameter("phone");
String field=request.getParameter("field");
String designation=request.getParameter("designation");
int salary=Integer.parseInt(request.getParameter("salary"));
String address=request.getParameter("address");
try {
	Connection con = null;
      Class.forName("com.mysql.cj.jdbc.Driver");
      System.out.println("Driver Class Loaded");
      con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
      System.out.println("Connection Established");
      PreparedStatement stmt=con.prepareStatement("update faculty set firstname=?,lastname=?,gender=?,field=?,designation=?,salary=?,address=?,phno=? where email=?");
      stmt.setString(9,email);
      stmt.setString(1,fname);
      stmt.setString(2,lname);
      stmt.setString(3,gender);
      stmt.setString(4,field);
      stmt.setString(5,designation);
      stmt.setInt(6,salary);
      stmt.setString(7,address);
      stmt.setString(8,phno);
      
      
      int n=stmt.executeUpdate();
      if(n>0){
    	  response.sendRedirect("faculty_info.jsp");
      }
      con.close();
      
}
catch(Exception e) {
	out.println(e);
}

%>