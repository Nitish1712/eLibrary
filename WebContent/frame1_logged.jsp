<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Frame1</title>
</head>
<body>
<style type="text/css">
		div.button{
			text-decoration-style: all;
			font-family: Monotype Corsiva;
			font-size: 25px;
			border: 2px solid white;
			border-radius: 15px;
			text-align: center;
			text-decoration-color: white;
			width: 24%;
			position: relative;
			float: left;
			padding-top: 5px;
			padding-bottom: 5px;
			height: 30px;
			transition: all 0.6s;
			border-spacing: 10px;
			margin-top: 20px;
			border-top: transparent;
		}
		div.button:hover{
			background-color: #006899;
			transform: scale(1.2);
			z-index: 30;
		}
		.element{
			float: right;
			transition: all 1s;
			animation: pulse 1s 0s infinite;
		}

		@keyframes pulse{
		0%{
			transform: scale(0.8);
		}
		50%{
			transform: scale(1);
			color: yellow;
		}
		100%{
			transform: scale(0.8) ;
		}
	}
		a{
			color: white;
		}
	</style>
</head>
<body BGCOLOR="#222222">
<img src="Public/nit_logo.png" width="100px" height="90px"  style=" float:left; display:inline;">
<font size="40px" color="white" style="inline;" ><center>NIT KURUKSHETRA</center></font>
<font style="color:#4EB1BA; font-family: cursive; font-size: 15px; ">&nbsp&nbsp<div class="element"><u>New Books Available</u> </div></font><font style="color:#4EB1BA; font-family: cursive; font-size: 25px; ">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspWelcome
 <% 

response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setDateHeader("Expires",0);
response.setHeader("Pragma","no-cache");

Cookie cookie = null;
Cookie[] cookies = null;
cookies = request.getCookies();

String rolluser=null;
if( cookies != null ) {
    
    for (int i = 1; i < cookies.length; i++) {
       cookie = cookies[i];
       rolluser=cookie.getValue();
       out.print(rolluser);
    }
 } 
if(rolluser==null){
	request.setAttribute("Error", "Session has Ended. Please Login ");
	RequestDispatcher rd=request.getRequestDispatcher("index.html");
	rd.forward(request,response);
}




%><br></font>
<div class="button">
<a href="frame2.html" target="f2">Home</a>
</div>
<div class="button">
<a href="download.html" target="f2">Download</a></div>
<div class="button">
<a href="searchbook.html" target="f2">Search Books</a>
</div>
<div class="button">
<a href="home.html" target="f2">Contact Us</a>
</div>
</div>
</body>
</html>