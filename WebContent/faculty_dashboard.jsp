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
    <title>Faculty Dashboard | OnCl - Edu. Cloud</title>

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

        /* Style the counter cards */
        .card {
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            padding: 16px;
            text-align: center;
            background-color: #ffffff;
            max-height: auto;
            cursor: pointer;
            overflow: hidden;
            transition: all 0.3s ease-out;
        }

        .card:hover {
            transform: translateY(-5px) scale(1.04) translateZ(0);
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
    </style>
  </head>
  <body>
  
    <%@include file="navbar_faculty.jsp" %>

    <div style="padding: 50px;">
      <div class="row" style="display: flex; justify-content: center; flex-wrap: wrap;">
        <div class="column">
            <div class="card" onclick="session_info()">
              <h3><span style="font-size: 100px; color: #4285f4" class="material-icons"> video_library </span></h3>
              <p style="font-family: 'Fredericka the Great', cursive; font-weight: 600; font-size: 20px; letter-spacing: 0.08em;">Course Sessions E - Cloud</p>
              <p style="font-family: 'Short Stack', cursive;">We help you in finding the session (online classes). You can pick it easily. 
                  As we provided detail information regarding every session.</p>
            </div>
        </div>

        <div class="column">
            <div class="card" onclick="announcements_info_faculty()">
              <h3><span style="font-size: 100px; color: #F1615C;" class="material-icons"> new_releases </span></h3>
              <p style="font-family: 'Fredericka the Great', cursive; font-weight: 600; font-size: 20px; letter-spacing: 0.08em;">News & Announcements</p>
              <p style="font-family: 'Short Stack', cursive;">Know what is going on...! Ah! We provide you info. regarding online competitve challenges, 
                  Massive Open Online Courses (MOOCS), etc.</p>
            </div>
        </div>

        <div class="column">
            <div class="card" onclick="exam_faculty()">
                <h3><span style="font-size: 100px; color: #fcc834;" class="material-icons"> assignment </span></h3>
                <p style="font-family: 'Fredericka the Great', cursive; font-weight: 600; font-size: 20px; letter-spacing: 0.08em;">Assignments & Exams</p>
                <p style="font-family: 'Short Stack', cursive;">You can Write the Exams online. You can Submit your assignments from where you are with 
                  your smart device. And also the faculty will evaluate them.</p>
            </div>
          </div>

        <div class="column">
            <div class="card" onclick="course_info()">
              <h3><span style="font-size: 100px; color: #76e989;" class="material-icons"> import_contacts </span></h3>
              <p style="font-family: 'Fredericka the Great', cursive; font-weight: 600; font-size: 20px; letter-spacing: 0.08em;">Courses Info.</p>
              <p style="font-family: 'Short Stack', cursive;">Get Complete Information of course registration details for which students registered. And also
              	  mode of study for that courses.</p>
            </div>
        </div>
        
        
      </div>
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
                            <li><a href="login.jsp">Login OnCl</a></li>
                            <li><a href="current_openings.html">Current Openings</a></li>
                            <li><a href="#">Exam Section</a></li>
                            <li><a href="https://mail.office365.com/" target="_blank">Mail Login</a></li>
                            <li><a href="staff_grievance.html">Staff Grievance</a></li>
                        </ul>
                    </div>
                    <div class="col-sm-6 col-md-3 item">
                        <h3 class="font-weight-bold" style="font-weight: bold; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;font-size: large;"> Student </h3>
                        <ul>
                            <li><a href="login.jsp">Login OnCl</a></li>
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

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
  <script>
      function course_info() {
        window.location.href = "courses_info_faculty.jsp";
      }
      function announcements_info_faculty() {
        window.location.href = "announcements_info_faculty.jsp";
      }
      function session_info() {
        window.location.href = "session_info_faculty.jsp";
      }
      function exam_faculty() {
        window.location.href = "exam_paper_faculty.jsp";
      }
  </script>
</html>