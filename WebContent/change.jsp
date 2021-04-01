<%@page import="java.sql.*" %>
<%
String email=request.getParameter("email");
String pwd=request.getParameter("password");
try{
   Connection con = null;
    Class.forName("com.mysql.jdbc.Driver");
      System.out.println("Driver Class Loaded");
      con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
      System.out.println("Connection Established");
      PreparedStatement stmt=con.prepareStatement("update student set password=? where email=?");
      stmt.setString(1, pwd);
      stmt.setString(2, email);
      int n=stmt.executeUpdate();
      if(n>0){
    	  out.println("<script type=\"text/javascript\">");
          out.println("alert('Password Changed Successfully!');"
              + "window.location.replace(\"login.jsp\");");
          out.println("</script>");
      }
      else {
    	  out.println("<script type=\"text/javascript\">");
          out.println("alert('Oops! Something went wrong, Try again!');"
              + "window.location.replace(\"login.jsp\");");
          out.println("</script>");
      }
 }
 catch(Exception e){
 }
%>