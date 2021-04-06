<%@page import="java.sql.*" %>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <script src="https://kit.fontawesome.com/982d9630c6.js" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Fredoka+One&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Fredericka+the+Great&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Short+Stack&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Satisfy&display=swap" rel="stylesheet">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">

  <link rel="icon" href="whin.png" type="image/icon type">
  <title>Courses Info. | OnCl - Edu. Cloud</title>

  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
  <!-- Google Fonts Roboto -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
  <!-- Bootstrap core CSS -->
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <!-- Material Design Bootstrap -->
  <link rel="stylesheet" href="css/mdb.min.css">
  <!-- Your custom styles (optional) -->
  <link rel="stylesheet" href="css/style.css">
  <!-- MDBootstrap Datatables  -->
  <link href="css/addons/datatables.min.css" rel="stylesheet">

  <style>
        .footer-dark {
            padding:50px 0;
            color:#f0f9ff; 
            background-color:#282d32;
        }
  
        .footer-dark h3 {
            margin-top:0;
            margin-bottom:12px;
            font-weight:bold;
            font-size:16px;
        }
        
        .footer-dark ul {
            padding:0;
            list-style:none;
            line-height:1.6;
            font-size:14px;
            margin-bottom:0;
        }
        
        .footer-dark ul a {
            color:inherit;
            text-decoration:none;
            opacity:0.6;
        }
        
        .footer-dark ul a:hover {
            opacity:0.8;
        }
        
        @media (max-width:767px) {
            .footer-dark .item:not(.social) {
            text-align:center;
            padding-bottom:20px;
            }
        }
        
        .footer-dark .item.text {
            margin-bottom:36px;
        }
        
        @media (max-width:767px) {
            .footer-dark .item.text {
            margin-bottom:0;
            }
        }
        
        .footer-dark .item.text p {
            opacity:0.6;
            margin-bottom:0;
        }
        
        .footer-dark .item.social {
            text-align:center;
        }
        
        @media (max-width:991px) {
            .footer-dark .item.social {
            text-align:center;
            margin-top:20px;
            }
        }
        
        .footer-dark .item.social > a {
            font-size:20px;
            width:36px;
            height:36px;
            line-height:36px;
            display:inline-block;
            text-align:center;
            border-radius:50%;
            box-shadow:0 0 0 1px rgba(255,255,255,0.4);
            margin:0 8px;
            color:#fff;
            opacity:0.75;
        }
        
        .footer-dark .item.social > a:hover {
            opacity:0.9;
        }     

        @media screen and (min-width: 375px){
            #footer__ {
                padding-top: 10px;
            }
        }

        @media screen and (max-width: 375px){
            #footer__ {
                padding-top: 0;
            }
        }

        .bg-light {
            background-color: #ffffff!important;
        }

        table,th-sm {
            font-weight: bolder;
        }
  </style>
</head>
<body>

<%@include file="navbar_faculty.jsp" %>

  <div style="padding: 10px;">
    <table id="dtBasicExample" class="table table-striped table-bordered table-sm" cellspacing="0" width="100%">
        <thead>
        <tr>
            <th class="th-sm"> <b> Student Email </b>
    
            </th>
            <th class="th-sm"> <b> Student Name </b>
    
            </th>
            
            <%HttpSession ht= request.getSession();
              String field=String.valueOf(ht.getAttribute("field"));
              
            %>
            <th class="th-sm"> <b> <%=field %> </b>
    
            </th>
            <th class="th-sm"> <b> View Exam  </b>
    
            </th>
            <th class="th-sm"> <b> Exam Marks  </b>
    
            </th>
        </tr>
        </thead>
        <tbody>
        
        <%
        try{
        	int marks=0;
        	Connection con = null;
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("Driver Class Loaded");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
            System.out.println("Connection Established");
            PreparedStatement stmt=con.prepareStatement("select * from courses where course1=?");
            PreparedStatement stmt1=con.prepareStatement("select score from exam_student where coursename=? and email=?");
            stmt.setString(1, field);
            
            ResultSet rs=stmt.executeQuery();
            while(rs.next()) {
            	stmt1.setString(1,field);
            	  stmt1.setString(2, rs.getString(1));
            	  ResultSet res1=stmt1.executeQuery();
            	  if(res1.next()){
            		marks=res1.getInt("score");
            	  }
            	  else {
            	   	marks=0;
            	  }
            	
            	%>
            	<tr>
            	
            	<td><%=rs.getString(1) %></td>
            	<td><%=rs.getString(3) %></td>
            	<td><%=rs.getString(5) %></td>
		      	<td><a href="view_exam_answers.jsp?email=<%=rs.getString(1) %>"><i class="fas fa-eye"></i></a></td>
		      	<td><%=marks %></td>
            	</tr>
            	<% 
            }
            PreparedStatement stmt2=con.prepareStatement("select * from courses where course2=?");
            stmt2.setString(1, field);
            
            ResultSet rs2=stmt2.executeQuery();
            while(rs2.next()) {
            	stmt1.setString(1,field);
            	  stmt1.setString(2, rs2.getString(1));
            	  ResultSet res2=stmt1.executeQuery();
            	  if(res2.next()){
            		marks=res2.getInt("score");
            	  }
            	  else {
            	   	marks=0;
            	  }
            	%>
            	<tr>

            	<td><%=rs2.getString(1) %></td>
            	<td><%=rs2.getString(3) %></td>
            	<td><%=rs2.getString(7) %></td>
		      	<td><a href="view_exam_answers.jsp?email=<%=rs2.getString(1) %>"><i class="fas fa-eye"></i></a></td>
		      	<td><%=marks %></td>
            	</tr>
            	<% 
            }
            PreparedStatement stmt3=con.prepareStatement("select * from courses where course3=?");
            stmt3.setString(1, field);
            
            ResultSet rs3=stmt3.executeQuery();
            while(rs3.next()) {
            	stmt1.setString(1,field);
          	  stmt1.setString(2, rs3.getString(1));
          	  ResultSet res3=stmt1.executeQuery();
          	  if(res3.next()){
          		marks=res3.getInt("score");
          	  }
          	  else {
          	   	marks=0;
          	  }
            	
            	%>
            	<tr>

            	<td><%=rs3.getString(1) %></td>
            	<td><%=rs3.getString(3) %></td>
            	<td><%=rs3.getString(9) %></td>
		      	<td><a href="view_exam_answers.jsp?email=<%=rs3.getString(1) %>"><i class="fas fa-eye"></i></a></td>
		      	<td><%=marks %></td>
            	</tr>
            	<% 
            }
            PreparedStatement stmt4=con.prepareStatement("select * from courses where course4=?");
            stmt4.setString(1, field);
            
            ResultSet rs4=stmt4.executeQuery();
            while(rs4.next()) {
            	stmt1.setString(1,field);
            	  stmt1.setString(2, rs4.getString(1));
            	  ResultSet res4=stmt1.executeQuery();
            	  if(res4.next()){
            		marks=res4.getInt("score");
            	  }
            	  else {
            	   	marks=0;
            	  }
            	%>
            	<tr>
            	<%System.out.println(rs4.getInt(2)); %>
            	<td><%=rs4.getString(1) %></td>
            	<td><%=rs4.getString(3) %></td>
            	<td><%=rs4.getString(11) %></td>
		      	<td><a href="view_exam_answers.jsp?email=<%=rs4.getString(1) %>"><i class="fas fa-eye"></i></a></td>
		      	<td><%=marks %></td>
            	</tr>
            	<% 
            }
            PreparedStatement stmt5=con.prepareStatement("select * from courses where course5=?");
            stmt5.setString(1, field);
            
            ResultSet rs5=stmt5.executeQuery();
            while(rs5.next()) {
            	stmt1.setString(1,field);
          	  stmt1.setString(2, rs5.getString(1));
          	  ResultSet res5=stmt1.executeQuery();
          	  if(res5.next()){
          		marks=res5.getInt("score");
          	  }
          	  else {
          	   	marks=0;
          	  }
            	%>
            	<tr>

            	<td><%=rs5.getString(1) %></td>
            	<td><%=rs5.getString(3) %></td>
            	<td><%=rs5.getString(13) %></td>
		      	<td><a href="view_exam_answers.jsp?email=<%=rs5.getString(1) %>"><i class="fas fa-eye"></i></a></td>
		      	<td><%=marks %></td>
            	</tr>
            	<% 
            }
            
        }
        catch(Exception e){
        	out.println(e);
        }
        %>
        
        </tbody>      
        <tfoot>
        <tr>
            <th class="th-sm"> <b> Student Email </b>
    
            </th>
            <th class="th-sm"> <b> Student Name </b>
    
            </th>
            <th class="th-sm"> <b> <%=field %> </b>
    
            </th>
            <th class="th-sm"> <b> View Exam </b>
    
            </th>
            <th class="th-sm"> <b> Exam Marks </b>
    
            </th>
        </tr>
        </tfoot>
    </table>
  </div>

    <div class="footer-dark">
        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-md-3 item">
                        <h3 class="font-weight-bold" style="font-weight: bold; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;font-size: large;"> Explore </h3>
                        <ul>
                            <li><a href="home.html">Home</a></li>
                            <li><a href="https://www.kluniversity.in/site/acadcal.htm" target="_blank">Academic Calendar</a></li>
                            <li><a href="https://www.kluniversity.in/flist.aspx" target="_blank">Our Faculty - Our Strength</a></li>
                            <li><a href="https://www.kluniversity.in/programmes.aspx" target="_blank">Programs Offered</a></li>
                            <li><a href="https://www.kluniversity.in/PGalleries.aspx" target="_blank">Photo Gallery</a></li>
                        </ul>
                    </div>
                    <div class="col-sm-6 col-md-3 item">
                        <h3 class="font-weight-bold" style="font-weight: bold; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;font-size: large;"> Faculty </h3>
                        <ul>
                            <li><a href="login.jsp">Login OnCl</a></li>
                            <li><a href="https://careers.kluniversity.in/" target="_blank">Current Openings</a></li>
                            <li><a href="https://www.kluniversity.in/es.aspx?id=0" target="_blank">Exam Section</a></li>
                            <li><a href="https://mail.office365.com/" target="_blank">Mail Login</a></li>
                            <li><a href="https://www.kluniversity.in/Staff-Grievances.aspx" target="_blank">Staff Grievance</a></li>
                        </ul>
                    </div>
                    <div class="col-sm-6 col-md-3 item">
                        <h3 class="font-weight-bold" style="font-weight: bold; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;font-size: large;"> Student </h3>
                        <ul>
                            <li><a href="login.jsp">Login OnCl</a></li>
                            <li><a href="https://www.kluniversity.in/Student-Magazine.aspx" target="_blank">Student Magazines</a></li>
                            <li><a href="https://mail.office365.com/" target="_blank">Mail Login</a></li>
                            <li><a href="https://www.kluniversity.in/admissions.aspx" target="_blank">Admissions</a></li>
                            <li><a href="https://www.kluniversity.in/stugri.aspx" target="_blank">Student Grievance</a></li>
                        </ul>
                    </div>
                    <div class="col-sm-6 col-md-3 item">
                        <h3 class="font-weight-bold" style="font-weight: bold; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;font-size: large;"> Institute </h3>
                        <ul>
                            <li><a href="https://www.kluniversity.in/Mission.aspx" target="_blank">Our Mission</a></li>
                            <li><a href="https://www.kluniversity.in/Mission.aspx" target="_blank">About Us</a></li>
                            <li><a href="https://goo.gl/maps/WiBhwHTGJseb1o7q9" target="_blank">Visit & Maps</a></li>
                            <li><a href="https://www.kluniversity.in/contact.aspx" target="_blank">Contact Us</a></li>
                            <li><a href="https://www.kluniversity.in/privacy.aspx" target="_blank">Privacy Policy</a></li>
                        </ul>
                    </div>
                      <div class="col-md-12 item text" id="footer__">
                          <img src="whin.png" style="width:30px; height: 30px; margin-right: 2px;">
                          <span class="font-weight-bold" style="font-weight: bold; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;font-size: large;"> OnCl - Edu. Cloud </span>
                          <p>The OnCl - Edu. Cloud is an web application which works on providing the solutions in Education field to help the people. <br> The WhiN is parent organization (founded in 2020) of OnCl - Edu. Cloud.</p>
                      </div>
                      <div class="col-md-12 item social">
                          <a href="https://github.com/4akhilkumar" target="_blank"><i class="icon ion-social-github"></i></a>
                          <a href="https://t.me/activare" target="_blank"><i class="fa fa-telegram"></i></a>
                          <a href="mailto:4akhilkumar@gmail.com" target="_blank"><i class="icon ion-email"></i></a>
                          <a href="https://www.linkedin.com/in/n-v-n-s-pavan-radha-krishna-kumar-9184641b0/" target="_blank"><i class="fa fa-linkedin"></i></a>
                      </div>
                </div>
            </div>
        </footer>
    </div>

  <!-- jQuery -->
  <script type="text/javascript" src="js/jquery.min.js"></script>
  <!-- Bootstrap tooltips -->
  <script type="text/javascript" src="js/popper.min.js"></script>
  <!-- Bootstrap core JavaScript -->
  <script type="text/javascript" src="js/bootstrap.min.js"></script>
  <!-- MDB core JavaScript -->
  <script type="text/javascript" src="js/mdb.min.js"></script>
  <!-- Your custom scripts (optional) -->
  <script type="text/javascript"></script>
  <!-- MDBootstrap Datatables  -->
  <script type="text/javascript" src="js/addons/datatables.min.js"></script>
  
  <script>
    $(document).ready(function () {
    $('#dtBasicExample').DataTable();
    $('.dataTables_length').addClass('bs-select');
    });
  </script>

</body>
</html>