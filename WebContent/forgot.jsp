<%@page import="java.sql.*" %>
<% 
String email=request.getParameter("email");
try{
  Connection con = null;
   Class.forName("com.mysql.jdbc.Driver");
     System.out.println("Driver Class Loaded");
     con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
     System.out.println("Connection Established");
     PreparedStatement stmt=con.prepareStatement("select email from faculty where email=?");
     stmt.setString(1, email);
     ResultSet rs=stmt.executeQuery();
     if(rs.next()){
      response.sendRedirect("changePasswordFaculty.jsp?email="+email);
     }
     else{
      PreparedStatement stmt1=con.prepareStatement("select email from student where email=?");
      stmt1.setString(1, email);
         ResultSet rs1=stmt1.executeQuery();
         if(rs1.next()){
          response.sendRedirect("changePassword.jsp?email="+email);
         }
         else{
          response.sendRedirect("forgot_password.jsp");
         }
     }
}
catch(Exception e){
  out.println(e);
}
%>