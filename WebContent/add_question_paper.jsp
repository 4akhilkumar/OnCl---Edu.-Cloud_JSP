<%@page import="java.sql.*,java.util.*,java.io.*,java.lang.*" %>
<%

String email=(String)session.getAttribute("faculty_email");
String coursename=request.getParameter("coursename");
String q1=request.getParameter("q1");

String q2=request.getParameter("q2");

String q3=request.getParameter("q3");

String q4=request.getParameter("q4");

String q5=request.getParameter("q5");

String q6=request.getParameter("q6");

try {
	Connection con = null;
      Class.forName("com.mysql.cj.jdbc.Driver");
      System.out.println("Driver Class Loaded");
      con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
      System.out.println("Connection Established");
      PreparedStatement stmt=con.prepareStatement("insert into exam_faculty values(?,?,?,?,?,?,?,?)");
      stmt.setString(1,email);
      stmt.setString(2,coursename);
      stmt.setString(3,q1);
      stmt.setString(4,q2);
      stmt.setString(5,q3);
      stmt.setString(6,q4);
      stmt.setString(7,q5);
      stmt.setString(8,q6);
      int n= stmt.executeUpdate();
      if(n>0){
    	  out.println("<script type=\"text/javascript\">");
          out.println("alert('Questions Paper is Ready and Student can write the exam now!');"
              + "window.location.replace(\"faculty_dashboard.jsp\");");
          out.println("</script>");
      }
      else{
    	  out.println("<script type=\"text/javascript\">");
          out.println("alert('Oops! Something went wrong. Try again!!');"
              + "window.location.replace(\"exam_paper_faculty.jsp\");");
          out.println("</script>");
      }
      con.close();
}
catch(Exception e) {
	out.println("Already, Questions had been added.");
}


%>