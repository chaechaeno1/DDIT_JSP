<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 1~10 까지의 짝수 출력 -->
	<c:forEach begin="0" end="10" step="2" var="k">
		<c:out value="${k }"/>
	</c:forEach>
	<br/>
	
	<c:forEach begin="0" end="10" step="1" var="k">
		<c:if test="${k % 2 == 0}">
			<c:out value="${k }"/>
		</c:if>
	</c:forEach>
	


</body>
</html>