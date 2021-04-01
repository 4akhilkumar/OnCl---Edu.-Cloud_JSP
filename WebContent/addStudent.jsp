<%@page import="java.sql.*,java.util.*"%>

<%
String fname=request.getParameter("firstname");
String lname=request.getParameter("lastname");
String gender=request.getParameter("gender");
String phno=request.getParameter("phone");
String branch=request.getParameter("branch");
String cgpa=request.getParameter("cgpa");
String fee=request.getParameter("fee");
String address=request.getParameter("address");

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
    	  email=id+"@kluniversity.in";    	  
      }
      PreparedStatement stmt=con.prepareStatement("insert into student values(?,?,?,?,?,?,?,?,?,?,?)");
      stmt.setString(1, email);
      stmt.setInt(2,id);
      stmt.setString(3,fname);
      stmt.setString(4,lname);
      stmt.setString(5,gender);
      stmt.setString(6,phno);
      stmt.setString(7,branch);
      stmt.setString(8,cgpa);
      stmt.setString(9,address);
      stmt.setString(10,pwd);
      stmt.setString(11,fee);
 
      int n=stmt.executeUpdate();
      if(n>0){
    	  response.sendRedirect("student_info.jsp");
      }
      con.close();     
}
catch(Exception e) {
	out.println(e);
}

%>