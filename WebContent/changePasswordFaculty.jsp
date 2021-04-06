<%@page import="java.sql.*" %>
<%@page import="java.net.InetAddress" %>

<%
String email=request.getParameter("email");
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
    <title>Change Password | OnCl Account Recovery</title>

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
            background-image: url("login.webp");
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

        .bg-light {
            background-color: #ffffff!important;
        }

        form label {
            font-weight:bold;
        }
        
        ::-webkit-input-placeholder { /* Edge */
		  color: red;
		}
		
		:-ms-input-placeholder { /* Internet Explorer 10-11 */
		  color: red;
		}
		
		::placeholder {
		  color: red;
		}
    </style>
  </head>
  <body>
  
    <%@include file="navbar.jsp" %>

    <div id="login" style="padding-top: 50px; padding-bottom: 50px;">
        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12" style="border-radius: 5px;">
                        <form id="login-form" class="form" action="changeFaculty.jsp?email=<%=email%>" method="post">
                            <h3 class="text-center text-info"><i class="fas fa-lock"></i> <b> Change Password </b> </h3>
                            <div class="form-group">
                                <label for="password" class="text-info"><i class="fa fa-key" aria-hidden="true"></i> Enter Your New Password:</label><br>
                                <input type="password" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*_=+-]).{8,}$" title="Enter a Strong Password" name="password" id="password" class="form-control" placeholder="Enter New Password" required>
                            </div>
                            <div class="form-group">
                                <button type="submit" name="submit" class="btn btn-info"><i class="fas fa-check-square"></i> <b> Submit </b> </button>
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
      

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>