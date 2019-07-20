<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Process</title>
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

String Username=request.getParameter("loginemail");
String Password=request.getParameter("loginpassword");
	//String Username="11620066";
	//String Password="Ludhiana@123";
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
        String sql=" Select * from user where rollno='"+Username+"' and password='"+Password+"' ";
		stmt=con.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		

		 if( rs.next() ){
				System.out.println("found record");
				
				Cookie cookie = new Cookie("roll",Username);
				response.addCookie(cookie);
				
			RequestDispatcher dispatcher=request.getRequestDispatcher("index1.jsp");
			dispatcher.forward(request, response);
		
		 }	
		 else{
			 System.out.println("failure");
			 out.print("<h1>LOGIN IS FAILURE </h1>");
				
		 }
		 %>



</body>
</html>