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
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
		String email = request.getParameter("email");
	
		StringBuffer sb = new StringBuffer();
		sb.append("이름 : " + name + "<br/>");
		sb.append("주소 : " + addr + "<br/>");
		sb.append("이메일 : " + email);
		
		out.print(sb);
		
	%>
	
	
	
	<!-- 
		StringBuffer는 문자열을 추가하거나 변경할 때 주로 사용하는 자료형
		1. append
		2. insert
		3. substring
	 -->
	
</body>
</html>