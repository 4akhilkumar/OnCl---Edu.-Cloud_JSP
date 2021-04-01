<%@page import="java.sql.*" %>

<%
String faculty__firstname="";
String faculty__lastname="";
String faculty_name="";
String coursename=request.getParameter("coursename");;
String email=(String)session.getAttribute("faculty_email");

try {
	Connection con = null;
      Class.forName("com.mysql.cj.jdbc.Driver");
      System.out.println("Driver Class Loaded");
      con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
      System.out.println("Connection Established");
      PreparedStatement stmt=con.prepareStatement("select * from faculty where email=?");
      stmt.setString(1, email);
      ResultSet rs=stmt.executeQuery();
      if(rs.next()){
    	  faculty__firstname=rs.getString(3);
    	  faculty__lastname=rs.getString(4);
    	  coursename=rs.getString(8);
    	  faculty_name=(new StringBuilder()).append(faculty__firstname).append(" "+faculty__lastname).toString();
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

  <!-- Bootstrap core CSS -->
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <!-- Material Design Bootstrap -->
  <link rel="stylesheet" href="css/mdb.min.css">
  <!-- Your custom styles (optional) -->
  <link rel="stylesheet" href="css/style.css">

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
				  <a title="<%=faculty_name %>"><span class="_username"> <%=faculty_name %> </span></a>
			  </div>
		      <ul class="User-Dropdown">
                 <li><span> <i class="fas fa-chalkboard-teacher"></i> </span> <a href="faculty_dashboard.jsp">Dashboard</a></li>
		         <li><span> <i class="fas fa-user-circle"></i> </span> <a href="#">My Profile</a></li>
		         <li><span><i class="fas fa-sign-out-alt"></i></span> <a href="logout.jsp">Logout</a></li>
		      </ul>
			</div>
       	</div>  
    </nav>
  
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

</body>
</html>