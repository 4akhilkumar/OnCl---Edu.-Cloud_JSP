<%@page import="java.sql.*" %>

<%
int sno=Integer.parseInt(request.getParameter("sno"));
String coursename="";
String topics="";
String shareablelink="";
String facultyname="";
String faculty_email="";
String faculty_phno="";

try {
	Connection con = null;
      Class.forName("com.mysql.cj.jdbc.Driver");
      System.out.println("Driver Class Loaded");
      con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
      System.out.println("Connection Established");
      PreparedStatement stmt=con.prepareStatement("select * from sessions where sno=?");
      stmt.setInt(1, sno);
      ResultSet rs=stmt.executeQuery();
      if(rs.next()){
    	  coursename=rs.getString(2);
    	  topics=rs.getString(3);
    	  shareablelink=rs.getString(4);
    	  facultyname=rs.getString(5);
    	  faculty_email=rs.getString(6);
    	  faculty_phno=rs.getString(7);
      }
}
catch(Exception e){
	out.println(e);
}
%>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <script src="https://kit.fontawesome.com/982d9630c6.js" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Potta+One&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Fredoka+One&display=swap" rel="stylesheet">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">

    <link rel="icon" href="whin.png" type="image/icon type">
    <title> Modify Session Info. | OnCl - Edu. Cloud</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Material Design Bootstrap -->
    <link rel="stylesheet" href="css/mdb.min.css">
    <!-- Your custom styles (optional) -->
    <link rel="stylesheet" href="css/style.css">
    <!-- MDBootstrap Datatables  -->
    <link href="css/addons/datatables.min.css" rel="stylesheet">
    
    <style>
        body {
            margin: 0;
            padding: 0;
            background-image: url("register.webp");
            background-repeat: no-repeat;
            background-size: cover;
            background-color: #ffffff;
        }

        #login .container #login-row #login-column #login-box {
            max-width: 600px;
            background-color: #ffffff;
        }

        #login .container #login-row #login-column #login-box #login-form {
            padding: 20px;
        }

        #login .container #login-row #login-column #login-box #login-form #register-link {
            margin-top: -85px;
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

        form label {
            font-weight:bold;
        }
        
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

        .bg-light {
            background-color: #ffffff!important;
        }
        .User-area {
			 width: 45px;
			 height: 45px;
			 position: relative;
			 cursor: pointer;
		}
		 .User-area > .User-avtar {
			 width: 100%;
			 height: 100%;
			 border-radius: 30px;
			 border: 2px solid #fff;
			 box-shadow: 0px 0px 12px -5px #000;
		}
		 .User-area > .User-avtar > img {
			 width: 100%;
			 height: 100%;
			 border-radius: 30px;
		}
		 .User-avtar .badge {
			 position: absolute;
			 right: -5px;
			 bottom: -2px;
			 width: 18px;
			 height: 18px;
			 background: #fff;
			 border-radius: 50%;
			 box-shadow: -3px 3px 3px -3px rgba(214, 214, 214, 0.78);
		}
		 .User-avtar .badge i {
			 font-weight: normal;
			 font-size: 11px;
			 margin-left: 4px;
			 margin-top: 5px;
			 vertical-align: text-top;
			 color: #080707;
		}
		 .badge i {
			 -moz-transition: all 0.3s linear;
			 -webkit-transition: all 0.3s linear;
			 transition: all 0.3s linear;
		}
		 .__opened .badge i {
			 margin-top: 2px;
			 -ms-transform: rotate(180deg);
			 -moz-transform: rotate(180deg);
			 -webkit-transform: rotate(180deg);
			 transform: rotate(180deg);
		}
		 .User-avtar span {
			 width: 80px;
			 font-size: 13px;
			 position: absolute;
			 display: inline-block;
			 min-width: 90px;
			 top: 14px;
			 left: -100px;
			 font-weight: bold;
			 white-space: nowrap;
			 overflow: hidden;
			 text-overflow: ellipsis;
		}
		 .User-Dropdown {
			 display: none;
			 position: absolute;
			 border-radius: 7px;
			 background: #fff;
			 box-shadow: 0px 0px 8px rgba(214, 214, 214, 0.78);
			 list-style: none;
			 padding: 0 20px;
			 width: 170px;
			 margin: 0;
			 top: 70px;
			 right: -9%;
		}
		 .User-Dropdown:before {
			 content: "";
			 position: absolute;
			 width: 0;
			 height: 0;
			 margin-left: -0.5em;
			 right: 0px;
			 box-sizing: border-box;
			 border: 7px solid black;
			 border-color: transparent transparent #fff #fff;
			 transform-origin: 0 0;
			 transform: rotate(135deg);
			 box-shadow: -3px 3px 3px -3px rgba(214, 214, 214, 0.78);
		}
		 .User-Dropdown.U-open {
			 display: block;
		}
		 .User-Dropdown > li {
			 padding: 0px;
			 line-height: 47px;
			 border-bottom: 1px solid rgba(215, 215, 215, 0.17);
		}
		 .User-Dropdown > li:last-child {
			 border-bottom: 0px;
		}
		 .User-Dropdown > li > a {
			 font-size: 13px;
			 padding: 15px 25px 16px 10px;
			 text-decoration: none;
			 color: #1787e0;
			 transition: all 0.2s ease-out;
		}
		 .User-Dropdown > li:before {
			 content: '';
			 width: 0px;
			 height: 40px;
			 position: absolute;
			 background: #2196f3;
			 margin-top: 4px;
			 border-radius: 0 1px 1px 0;
			 left: 0px;
			 transition: all 0.2s ease;
		}
		 .User-Dropdown > li:hover:before {
			 width: 5px;
			 border-radius: 30px;
		}
		 .User-Dropdown > li a:hover {
			 margin-left: 5px;
		}
        @media screen and (max-width: 426px){
            ._username {
                visibility:hidden;
            }
        }
    </style>
  </head>
  <body>

	<nav class="navbar sticky-top navbar-light bg-light">
        <a class="navbar-brand" style="font-family: 'Potta One', cursive;" href="home.html">
            <img src="whin.png" width="30" height="30" style="margin-bottom: 5px;" class="d-inline-block align-top" alt="OnCl Logo">
            <span class="header_title" style="font-weight: 500; font-family: 'Fredoka One', cursive;"> <span style="color: tomato;">O</span><span style="color: #5f95eb;">n</span><span style="color: rgb(118, 233, 137);">C</span><span style="color: #fcc834">l</span> - Edu. Cloud </span>
        </a>
        <div style="justify-content: flex-end;" class="row">
	        <div class="User-area">
			  <div class="User-avtar">
				  <img alt="avatar" src="avatar.webp" style="width:40px; height:40px; border-radius: 50%;">
				  <a title="<%=facultyname %>"><span class="_username"> <%=facultyname %> </span></a>
			  </div>
		      <ul class="User-Dropdown">
                 <li><span> <i class="fas fa-chalkboard-teacher"></i> </span> <a href="faculty_dashboard.jsp">Dashboard</a></li>
		         <li><span> <i class="fas fa-user-circle"></i> </span> <a href="#">My Profile</a></li>
		         <li><span><i class="fas fa-sign-out-alt"></i></span> <a href="logout.jsp">Logout</a></li>
		      </ul>
			</div>
       	</div>  
    </nav>

    <div id="login" style="padding-top: 50px; padding-bottom: 50px;">
        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12" style="border-radius: 5px;">
                        <form id="login-form" class="form" action="updateSe.jsp?sno=<%=sno %>" method="post">
                            <h3 class="text-center text-info"><i class="fas fa-video"></i> <b>Modify Session Info.</b> </h3>
                            <div class="form-group">
                                <label for="select" class="text-info"><i class="fas fa-book"></i> Course Name:</label><br>
                                <select class="form-control" name="coursename" required>
                                    <option value="<%=coursename %>">Selected Course Name is <%=coursename %></option>
                                    <option value="Software Engineering">Software Engineering</option>
                                    <option value="Mathematical Programming">Mathematical Programming</option>
                                    <option value="Data Science">Data Science</option>
                                    <option value="Technical Skills">Technical Skills</option>
                                    <option value="Enterprise Programming">Enterprise Programming</option>
                                    <option value="Computer Networks and Security">Computer Networks and Security</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="topics" class="text-info"><i class="fas fa-scroll"></i> Topics:</label><br>
                                <textarea name="topics" id="topics" class="form-control" placeholder="Topics" placeholder="Topics" required><%=topics %></textarea>
                            </div>
                            <div class="form-group">
                                <label for="shareablelink" class="text-info"><i class="fas fa-link"></i> Shareable Link:</label><br>
                                <textarea name="shareablelink" id="shareablelink" class="form-control" placeholder="Shareable Link" required><%=shareablelink %></textarea>
                            </div>
                            <div class="form-group">
                                <label for="facultyname" class="text-info"><i class="fas fa-user-tie"></i> Faculty Name:</label><br>
                                <input type="text" name="facultyname" id="facultyname" class="form-control" value='<%=facultyname%>' readonly>
                            </div>
                         	<div class="form-group">
                                <label for="faculty_email" class="text-info"><i class="fa fa-envelope" aria-hidden="true"></i> Faculty E - Mail:</label><br>
                                <input type="email" name="faculty_email" id="faculty_email" class="form-control" value=<%=faculty_email %> readonly>
                            </div>
                            <div class="form-group">
                                <label for="faculty_phno" class="text-info"><i class="fa fa-phone" aria-hidden="true"></i> Faculty Phone No.:</label><br>
                                <input type="number" name="faculty_phno" id="faculty_phno" class="form-control" value=<%=faculty_phno %> readonly>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-info"><i class="fas fa-video"></i> <b>Modify Session Info.</b> </button>
                            </div>
                        </form>
                    </div>
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
                </div>
            </div>
        </footer>
    </div>
    
    <script>
    $('.User-avtar').click(function(event) {
  	  event.stopPropagation();
  	  if( $(".User-Dropdown").hasClass( "U-open" ) ){
  	      $('.User-avtar').removeClass('__opened');
  	          $('.User-Dropdown').removeClass("U-open");
  	  }
  	  else {
  	      $('.User-avtar').addClass('__opened');
  	          $('.User-Dropdown').addClass("U-open");
  	  }
  	});
  	$(document).click(function() {
  	      $('.User-avtar').removeClass('__opened');
  	  $('.User-Dropdown').removeClass("U-open");
  	});
  </script>
     
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>