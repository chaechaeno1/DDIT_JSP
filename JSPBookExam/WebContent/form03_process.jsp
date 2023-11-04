<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h3>선택한 과일</h3>
	<%
		request.setCharacterEncoding("utf-8");
	
		String[] fruits = request.getParameterValues("fruit");
		
		if(fruits != null){
			for(String selectFruit : fruits){
				out.print(selectFruit + " ");
			}
		}else{
			out.print("");
		}
		
		
		
	%>
	
	

	
	
	
	
	
</body>
</html>