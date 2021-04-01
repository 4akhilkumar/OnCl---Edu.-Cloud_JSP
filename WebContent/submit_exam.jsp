<%@page import="java.sql.*,java.util.*,java.io.*,java.lang.*" %>
<%

String email=(String)session.getAttribute("student_email");
String coursename=request.getParameter("coursename");
String q1=request.getParameter("q1");
String a1=request.getParameter("a1");
String q2=request.getParameter("q2");
String a2=request.getParameter("a2");
String q3=request.getParameter("q3");
String a3=request.getParameter("a3");
String q4=request.getParameter("q4");
String a4=request.getParameter("a4");
String q5=request.getParameter("q5");
String a5=request.getParameter("a5");
String q6=request.getParameter("q6");
String a6=request.getParameter("a6");
int score=0;

try {
	Connection con = null;
      Class.forName("com.mysql.cj.jdbc.Driver");
      System.out.println("Driver Class Loaded");
      con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
      System.out.println("Connection Established");
      PreparedStatement stmt=con.prepareStatement("insert into exam_student values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
      stmt.setString(1,email);
      stmt.setString(2,coursename);      
      stmt.setString(3,q1);
      stmt.setString(4,a1);
      stmt.setString(5,q2);
      stmt.setString(6,a2);
      stmt.setString(7,q3);
      stmt.setString(8,a3);
      stmt.setString(9,q4);
      stmt.setString(10,a4);
      stmt.setString(11,q5);
      stmt.setString(12,a5);
      stmt.setString(13,q6);
      stmt.setString(14,a6);
      stmt.setInt(15,score);
      int n=stmt.executeUpdate();
      if(n>0){
    	  out.println("<script type=\"text/javascript\">");
          out.println("alert('Successfully, Your Answer Sheet is Submitted.');"
              + "window.location.replace(\"student_dashboard.jsp\");");
          out.println("</script>");
      }
      else{
    	  out.println("<script type=\"text/javascript\">");
          out.println("alert('Oops! Something went wrong. Try again!!');"
              + "window.location.replace(\"stydent_dashboard.jsp\");");
          out.println("</script>");
      }
      con.close();
}
catch(Exception e) {
	out.println(e);
}

%>