<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Records</title>
<style>
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
     border: 2px solid black;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
     border: 2px solid black;
}

tr:nth-child(even) {
    background-color: #dddddd;
}
</style>

</head>
<body>

 <table>
 
 <tr><th>Book Code</th><th>Book Name</th><th>Author</th><th>Publisher</th><th>Issued Date</th><th>Due Date</th><th>Subject</th></tr>
 <%@ page import="java.util.*" %>
 <%@ page import="java.sql.Connection" %>
 <%@ page import="java.sql.DriverManager" %>
 <%@ page import="java.sql.ResultSet" %>
 <%@ page import="java.sql.Statement" %>

 <% 

	Statement stmt=null;
	Connection con=null;

    
    

Cookie cookie = null;
Cookie[] cookies = null;
cookies = request.getCookies();

String rollno=null;
if( cookies != null ) {
    
    for (int i = 1; i < cookies.length; i++) {
       cookie = cookies[i];
       rollno=cookie.getValue();
    }
 } 


	
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
	String  sql=" Select * from books where issuedto ='"+rollno+"' " ;
	
	stmt=con.createStatement();
	
		ResultSet rs = stmt.executeQuery(sql);
		
		int count =0;

		 while( rs.next() ){
         	
	       count++;
		 %>
        
 <tr>
 <td><%= rs.getString(1) %></td>
 <td><%= rs.getString(2) %></td>
 <td><%= rs.getString(3) %></td>
 <td><%= rs.getString(4) %></td>
 <td><%= rs.getString(6) %></td>
 <td><%= rs.getString(7) %></td>
 <td><%= rs.getString(8) %></td>
 
 </tr>
 <%
 }
		if(count==0) out.print("No Record Found");
 %>
 </table>
 </body>
</html>
 