<%@page import="java.sql.*,java.util.*,java.io.*,java.lang.*" %>
<%

String email=(String)session.getAttribute("student_email");
String id=request.getParameter("id");
String name=request.getParameter("name");
String course1=request.getParameter("course1");
String course2=request.getParameter("course2");
String course3=request.getParameter("course3");
String course4=request.getParameter("course4");
String course5=request.getParameter("course5");
String mos1=request.getParameter("mos1");
String mos2=request.getParameter("mos2");
String mos3=request.getParameter("mos3");
String mos4=request.getParameter("mos4");
String mos5=request.getParameter("mos5");

out.println(course1);

try {
	  Connection con = null;
      Class.forName("com.mysql.cj.jdbc.Driver");
      System.out.println("Driver Class Loaded");
      con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
      System.out.println("Connection Established");
      PreparedStatement stmt=con.prepareStatement("insert into courses values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
      stmt.setString(1,email);
      stmt.setString(2,id);
      stmt.setString(3,name);
      stmt.setString(4,course1);
      stmt.setString(5,mos1);
      stmt.setString(6,course2);
      stmt.setString(7,mos2);
      stmt.setString(8,course3);
      stmt.setString(9,mos3);
      stmt.setString(10,course4);
      stmt.setString(11,mos4);
      stmt.setString(12,course5);
      stmt.setString(13,mos5);

      int n=stmt.executeUpdate();
      if(n>0){
    	  out.println("<script type=\"text/javascript\">");
          out.println("alert('Courses Registration Done, Successfully!');"
              + "window.location.replace(\"student_dashboard.jsp\");");
          out.println("</script>");
      }
      else {
    	  out.println("<script type=\"text/javascript\">");
          out.println("alert('Oops! Something went wrong, Try again!');"
              + "window.location.replace(\"course_info_register.jsp\");");
          out.println("</script>");
      }
      con.close();
}
catch(Exception e) {
	out.println(e);
}

%>