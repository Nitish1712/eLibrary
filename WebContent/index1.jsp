<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<frameset rows="22%,*">
	<frame src="frame1_logged.jsp" frameborder="0" style="border-color: #222930;"/>
<frameset cols="25%,*">
	<frame src="frame3_logged.html" name="f1" frameborder="0" style="border-color: #222930;" />
	<frame src="frame2.html" name="f2" frameborder="0" style="border-color: #222930;"/>
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
	System.out.println("cookie before logout is "+rolluser);
    
	if(rolluser==null){
		request.setAttribute("Error", "Session has Ended. Please Login ");
		RequestDispatcher rd=request.getRequestDispatcher("index.html");
		rd.forward(request,response);
	}
 %>
</frameset>
</html>

