<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%session.removeAttribute("roll");
	session.invalidate();
	RequestDispatcher rd=request.getRequestDispatcher("index.html");
	rd.forward(request,response);
	Cookie cookie = null;
	Cookie[] cookies = null;
	cookies = request.getCookies();

	if( cookies != null ) {
	    
	    for (int i = 1; i < cookies.length; i++) {
	       cookie = cookies[i];
	    	cookie.setValue(null);
	    	System.out.println("cookie after logout is "+cookie.getValue());
	    }
	 } 

%>
</body>
</html>