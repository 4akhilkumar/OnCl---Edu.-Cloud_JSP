<%@page import="java.sql.*" %>

<% 
String email=request.getParameter("email");
String marks=request.getParameter("marks");
String field=(String)session.getAttribute("field");

try {
	Connection con = null;
      Class.forName("com.mysql.cj.jdbc.Driver");
      System.out.println("Driver Class Loaded");
      con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
      System.out.println("Connection Established");
      PreparedStatement stmt=con.prepareStatement("update exam_student set score=? where email=? and coursename=?");
      stmt.setString(1, marks);
      stmt.setString(2, email);
      stmt.setString(3, field);
      int n=stmt.executeUpdate();
      if(n>0){
    	  out.println("<script type=\"text/javascript\">");
          out.println("alert('Evaluation Done, Marks Added!');"
              + "window.location.replace(\"faculty_dashboard.jsp\");");
          out.println("</script>");
      }
      else{
    	  out.println("<script type=\"text/javascript\">");
          out.println("alert('Oops! Something went wrong. Try again!!');"
              + "window.location.replace(\"faculty_dashboard.jsp\");");
          out.println("</script>");
      }
      out.println(n);
}
catch(Exception e){
	out.println(e);
}
%>