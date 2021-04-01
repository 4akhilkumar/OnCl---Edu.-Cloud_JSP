<%@page import="java.sql.*,java.util.*,java.io.*,java.lang.*" %>

<%

int id=0;

try{
	Connection con = null;
	 Class.forName("com.mysql.cj.jdbc.Driver");
     System.out.println("Driver Class Loaded");
     con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
     System.out.println("Connection Established");
     PreparedStatement stmt=con.prepareStatement("select max(id) from faculty");
     ResultSet rs=stmt.executeQuery();
     if(rs.next()){
    	 id=rs.getInt(1)+1;
     }
}
catch(Exception e){
	
}

String fname=request.getParameter("firstname");
String lname=request.getParameter("lastname");
String field=request.getParameter("field");
String years=request.getParameter("years");
String gender=request.getParameter("gender");
String phno=request.getParameter("phone");
String designation=request.getParameter("designation");
int salary=Integer.parseInt(request.getParameter("salary"));
String address=request.getParameter("address");

String email=id+"@kluniversity.in";
String Alphabet = "ABCDEFFGHIJKLMNOPQRSTUVWXYZ";
String alphabet = "abcdefghijklmnopqrstuvwxyz";
String numeric = "1234567890";
String special = "!@#$%^&*()";

StringBuilder characters = new StringBuilder();
Random random = new Random();
int length = 2;

for(int i = 0; i < length; i++) {
  int index = random.nextInt(alphabet.length());
  char randomChar = alphabet.charAt(index);
  characters.append(randomChar);
}

StringBuilder Characters = new StringBuilder();
length = 2;

for(int i = 0; i < length; i++) {
  int index = random.nextInt(Alphabet.length());
  char randomChar = Alphabet.charAt(index);
  Characters.append(randomChar);
}

StringBuilder numbers = new StringBuilder();
length = 2;

for(int i = 0; i < length; i++) {
  int index = random.nextInt(numeric.length());
  char randomChar = numeric.charAt(index);
  numbers.append(randomChar);
}

StringBuilder specials = new StringBuilder();
length = 2;

for(int i = 0; i < length; i++) {
  int index = random.nextInt(special.length());
  char randomChar = special.charAt(index);
  specials.append(randomChar);
}

String strongpwd = characters.toString() + numbers.toString() + specials.toString() + Characters.toString();

StringBuilder fpwd = new StringBuilder();
ArrayList<Integer> ind=new ArrayList<Integer>();
while(fpwd.length()<strongpwd.length())
{
    int index = random.nextInt(strongpwd.length());
    int flag=0;
    for(int i=0;i<ind.size();i++)
    {
        if(index==ind.get(i))
        {
            flag=1;
            break;
        }
    }
    if(flag==0)
    {
        ind.add(index);
      char randomChar = strongpwd.charAt(index);
	  fpwd.append(randomChar);
    }
}

String pwd = fpwd.toString();

try {
	Connection con = null;
      Class.forName("com.mysql.cj.jdbc.Driver");
      System.out.println("Driver Class Loaded");
      con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
      System.out.println("Connection Established");
      PreparedStatement stmt=con.prepareStatement("insert into faculty values(?,?,?,?,?,?,?,?,?,?,?)");
      stmt.setString(1,email);
      stmt.setInt(2,id);
      stmt.setString(3,fname);
      stmt.setString(4,lname);
      stmt.setString(5,gender);
      stmt.setString(6,pwd);
      stmt.setString(7,phno);
      stmt.setString(8,field);
      stmt.setString(9,designation);
      stmt.setInt(10,salary);
      stmt.setString(11,address);
      
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