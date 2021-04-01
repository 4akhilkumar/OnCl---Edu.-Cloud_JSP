<%@page import="java.sql.*" %>
<%
String sno=request.getParameter("sno");
String admin=(String)session.getAttribute("admin_email");
String faculty=(String)session.getAttribute("faculty_email");

try {
	Connection con = null;
      Class.forName("com.mysql.cj.jdbc.Driver");
      System.out.println("Driver Class Loaded");
      con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
      System.out.println("Connection Established");
      PreparedStatement stmt=con.prepareStatement("delete from announcement where sno=?");
      stmt.setString(1, sno);
      int n=stmt.executeUpdate();
      if(n>0){
    	  if(admin != null) {
        	  response.sendRedirect("announcement_info.jsp");
    	  }
    	  else {
    		  response.sendRedirect("announcements_info_faculty.jsp");
    	  }
      }
}
catch(Exception e){
	out.println(e);
}
%>