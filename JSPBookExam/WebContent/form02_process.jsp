<%@page import="java.util.Vector"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%
		
		request.setCharacterEncoding("utf-8");
	
		Enumeration params = request.getParameterNames();
		
		while(params.hasMoreElements()){
			StringBuffer info = new StringBuffer((String)params.nextElement());
			out.println(info + " : ");
			
			String value = request.getParameter(info.toString());
			/* toString() 메서드를 사용하면 StringBuffer를 String 자료형으로 변경  */
			out.println(value+"<br/>");
		}
		
		
	%> 
	
</body>
</html>