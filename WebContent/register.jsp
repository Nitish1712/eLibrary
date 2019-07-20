<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.util.*" %>
 <%@ page import="java.sql.Connection" %>
 <%@ page import="java.sql.DriverManager" %>
 <%@ page import="java.sql.ResultSet" %>
 <%@ page import="java.sql.Statement" %>

 <% 

	Statement stmt=null;
	Connection con=null;


//String FirstName="Deeepti";
//String LastName="Deeepti";
//String Email="Deeepti";
//String Rollno="Deeepti";
//String Branch="Deeepti";
//String Semester="Deeepti";
//String Password="Deeepti";



String FirstName=request.getParameter("fname");

String LastName=request.getParameter("lname");
String Email=request.getParameter("email");
String Rollno=request.getParameter("uname");
String Branch=request.getParameter("branch");
String Semester=request.getParameter("semester");
String Password=request.getParameter("passcode");
	System.out.println(FirstName);
	System.out.println(LastName);
	System.out.println(Email);
	System.out.println(Rollno);
	System.out.println(Branch);
	System.out.println(Semester);
	System.out.println(Password);
	System.out.println("\n");
	
try {
		Class.forName("com.mysql.jdbc.Driver");
		System.out.println("--Driver Loaded--");
		String url="jdbc:mysql://localhost:3307/webd";
        con = DriverManager.getConnection(url,"root","");
        System.out.println("--Connection Esatblished--");
	}
	catch(Exception e) {
		System.out.println("Error while loading or connecting :"+ e);
	}
    	
		String sql=" Insert into user values('"+FirstName+"','"+LastName+"','"+Email+"','"+Branch+"','"+Semester+"','"+Password+"','"+Rollno+"')";
		stmt=con.createStatement();
		stmt.executeUpdate(sql);
		System.out.println("--Record Inserted--");
           response.sendRedirect("login1.html");  
	
		
		%>



</body>
</html>