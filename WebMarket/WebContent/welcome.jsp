<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Web Market</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"/>
</head>
<body>
	<%@include file="menu.jsp"%>
	
	<%/* 
		String greeting = "Welcome to Web Shopping Mall"; */
		String greeting = "도서 웹 쇼핑몰";
		String tagline = "Welcome to WebMarket!!";
	%>
	
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3"><%=greeting%></h1>
		</div>
	</div>
	
	
	<div class="container">
		<div class="text-center">
			<h3><%=tagline%></h3>
			<%-- <%
				Date day = new Date();
				String am_pm;
				int hour = day.getHours();
				int minute = day.getMinutes();
				int second = day.getSeconds();
				
				if(hour/12 == 0){
					am_pm = "AM";
				}else{
					am_pm = "PM";
					hour = hour - 12;
				}
				String CT = hour + ":" + minute + ":" + second + " " + am_pm;
				out.println("현재 접속 시간 : " + CT + "\n");
			%> --%>
		</div>
		<hr>
	</div>
	
	<%@include file="footer.jsp"%>


</body>
</html>