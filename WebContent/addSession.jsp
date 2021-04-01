<%@page import="java.sql.*,java.util.*"%>
<%
String coname=request.getParameter("coursename");
String topics=request.getParameter("topics");
String sl=request.getParameter("shareablelink");
String fname=request.getParameter("firstname");
String lname=request.getParameter("lastname");
String phno=request.getParameter("phone");

int id=0;
String email="";
try{
	Connection con = null;
      Class.forName("com.mysql.cj.jdbc.Driver");
      System.out.println("Driver Class Loaded");
      con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
      System.out.println("Connection Established");
      PreparedStatement stmt1=con.prepareStatement("select max(id) from student");
      ResultSet rs=stmt1.executeQuery();
      if(rs.next()){
    	  id=rs.getInt(1)+1;
    	  email="Session - "+id;
    	  
      }
      PreparedStatement stmt=con.prepareStatement("insert into student values(?,?,?,?,?,?,?)");
      stmt.setString(1, email);
      stmt.setInt(2,id);
      stmt.setString(5,coname);
      stmt.setString(7,topics);
      stmt.setString(7,sl);
      stmt.setString(3,fname);
      stmt.setString(4,lname);
      stmt.setString(6,phno);

      
     
      
     
     
      int n=stmt.executeUpdate();
      if(n>0){
    	  response.sendRedirect("session_info.jsp");
      }
      con.close();
      
}
catch(Exception e) {
	out.println(e);
}




%>