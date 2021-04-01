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
  <title>View Marks | OnCl - Edu. Cloud</title>

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
      * {
            box-sizing: border-box;
        }

        body {
            font-family: Arial, Helvetica, sans-serif;
        }

        /* Float four columns side by side */
        .column {
            float:inherit;
            width: 25%;
            padding: 0 10px;
        }

        /* Remove extra left and right margins, due to padding */
        .row {margin: 0 -5px;}

        /* Clear floats after the columns */
        .row:after {
            content: "";
            display: table;
            clear: both;
        }

        /* Responsive columns */
        @media screen and (max-width: 600px) {
        .column {
                width: 100%;
                display: block;
                margin-bottom: 20px;
            }
        }

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

        @media (min-width: 992px){
        .external-collapse.navbar-collapse {
            display: -webkit-box!important;
            display: -ms-flexbox!important;
            display: flex!important;
            }
        }

        @media screen and (min-width: 376px){
            .header_img {
                height: 30px;
                width: 30px;
                margin-bottom: 5px;
            }
        }

        @media screen and (max-width: 376px){
            .header_img {
                height: 25px;
                width: 25px;
                margin-bottom: 5px;
            }
        }

        @media screen and (min-width: 400px){
            .header_title {
                font-size: 25px;
            }
        }

        @media screen and (max-width: 376px){
            .header_title {
                font-size: 21px;
            }
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

    <%@include file="navbar_student.jsp" %>

  <div style="padding: 10px;">
    <table id="dtBasicExample" class="table table-striped table-bordered table-sm" cellspacing="0" width="100%">
        <thead>
        <tr>
            <th class="th-sm"> <b> Registration ID </b>
    
            </th>
            <th class="th-sm"> <b> Full Name </b>
    
            </th>
            <th class="th-sm"> <b> E - Mail </b>
    
            </th>
            <th class="th-sm"> <b> Enterprise Programming </b>
    
            </th>
            <th class="th-sm"> <b> Mathematical Programming </b>
    
            </th>
            <th class="th-sm"> <b> Data Science </b>
    
            </th>
            <th class="th-sm"> <b> Technical Skills </b>
    
            </th>
            <th class="th-sm"> <b> Computer Networks and Security </b>
    
            </th>
        </tr>
        </thead>
        <tbody>
        
        <%
        int ep=0,ds=0,cns=0,mp=0,ts=0;        
        try{
        	Connection con = null;
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("Driver Class Loaded");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
            System.out.println("Connection Established");
            PreparedStatement stmt=con.prepareStatement("select * from student where email=?");
            stmt.setString(1, email);
            ResultSet rs=stmt.executeQuery();
            PreparedStatement stmt1=con.prepareStatement("select score from exam_student where coursename=? and email=?");
            while(rs.next()){
              stmt1.setString(1,"Enterprise Programming");
          	  stmt1.setString(2, rs.getString(1));
          	  ResultSet rs1=stmt1.executeQuery();
          	  if(rs1.next()){
          		ep=rs1.getInt("score");
          	  }
          	  else {
          	   	ep=0;
          	  }

          	  stmt1.setString(1,"Mathematical Programming");
        	  stmt1.setString(2, rs.getString(1));
        	  ResultSet rs2=stmt1.executeQuery();
        	  if(rs2.next()){
        		  mp=rs2.getInt("score");
        		  
        	  }
        	  else{
        		  mp=0;
        	  }
        	  
        	  stmt1.setString(1,"Data Science");
        	  stmt1.setString(2, rs.getString(1));
        	  ResultSet rs3=stmt1.executeQuery();
        	  if(rs3.next()){
        		  ds=rs3.getInt("score");
        		  
        	  }
        	  else{
        		  ds=0;
        	  } 
        	  
        	  stmt1.setString(1,"Technical Skills");
        	  stmt1.setString(2, rs.getString(1));
        	  ResultSet rs4=stmt1.executeQuery();
        	  if(rs4.next()){
        		  ts=rs4.getInt("score");
        		  
        	  }
        	  else{
        		  ts=0;
        	  } 
        	  
        	  stmt1.setString(1,"Computer Networks and Security");
        	  stmt1.setString(2, rs.getString(1));
        	  ResultSet rs5=stmt1.executeQuery();
        	  if(rs5.next()){
        		  cns=rs5.getInt("score");
        		  
        	  }
        	  else{
        		  cns=0;
        	  }          	    
            	%>
            	<tr>
            	<td><%=rs.getString(2) %></td>
            	<td><%=studentname %></td>
            	<td><%=rs.getString(1) %></td>
            	<td><%=ep %></td>
            	<td><%=mp %></td>
            	<td><%=ds %></td>
            	<td><%=ts %></td>
            	<td><%=cns %></td>
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
            <th> <b> Registration ID </b>
            </th>
            <th> <b> Full Name </b>
            </th>
            <th> <b> E - Mail </b>
            </th>
            <th> <b> Enterprise Programming </b>
            </th>
            <th> <b> Mathematical Programming </b>
            </th>
            <th> <b> Data Science </b>
            </th>
            <th> <b> Technical Skills </b>
            </th>
            <th> <b> Computer Networks and Security </b>    
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
                            <li><a href="fullcalendar.html">Academic Calendar</a></li>
                            <li><a href="#">Our Faculty - Our Strength</a></li>
                            <li><a href="#">Programs Offered</a></li>
                            <li><a href="#">Photo Gallery</a></li>
                        </ul>
                    </div>
                    <div class="col-sm-6 col-md-3 item">
                        <h3 class="font-weight-bold" style="font-weight: bold; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;font-size: large;"> Faculty </h3>
                        <ul>
                            <li><a href="login.html">Login OnCl</a></li>
                            <li><a href="current_openings.html">Current Openings</a></li>
                            <li><a href="#">Exam Section</a></li>
                            <li><a href="https://mail.office365.com/" target="_blank">Mail Login</a></li>
                            <li><a href="staff_grievance.html">Staff Grievance</a></li>
                        </ul>
                    </div>
                    <div class="col-sm-6 col-md-3 item">
                        <h3 class="font-weight-bold" style="font-weight: bold; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;font-size: large;"> Student </h3>
                        <ul>
                            <li><a href="login.html">Login OnCl</a></li>
                            <li><a href="#">Student Magazines</a></li>
                            <li><a href="https://mail.office365.com/" target="_blank">Mail Login</a></li>
                            <li><a href="admissions.html">Admissions</a></li>
                            <li><a href="student_grievance.html">Student Grievance</a></li>
                        </ul>
                    </div>
                    <div class="col-sm-6 col-md-3 item">
                        <h3 class="font-weight-bold" style="font-weight: bold; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;font-size: large;"> Institute </h3>
                        <ul>
                            <li><a href="institute.html">Our Mission</a></li>
                            <li><a href="#">About Us</a></li>
                            <li><a href="https://goo.gl/maps/WiBhwHTGJseb1o7q9" target="_blank">Visit & Maps</a></li>
                            <li><a href="#">Contact Us</a></li>
                            <li><a href="#">Privacy Policy</a></li>
                        </ul>
                    </div>

                    <!-- <div class="footer__"> -->
                        <div class="col-md-12 item text" id="footer__">
                            <img src="whin.png" style="width:30px; height: 30px; margin-right: 2px;">
                            <span class="font-weight-bold" style="font-weight: bold; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;font-size: large;"> OnCl - Edu. Cloud </span>
                            <p>The OnCl - Edu. Cloud is an web application which works on providing the solutions in Education field to help the people. <br> The WhiN is parent organization (founded in 2020) of OnCl - Edu. Cloud.</p>
                        </div>
                        <div class="col-md-12 item social">
                            <a href="https://github.com/4akhilkumar" target="_blank"><i class="icon ion-social-github"></i></a>
                            <a href="https://t.me/#" target="_blank"><i class="fa fa-telegram"></i></a>
                            <a href="mailto:4akhilkumar@gmail.com" target="_blank"><i class="icon ion-email"></i></a>
                            <a href="https://linkedin.com/#" target="_blank"><i class="fa fa-linkedin"></i></a>
                        </div>
                    <!-- </div> -->
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