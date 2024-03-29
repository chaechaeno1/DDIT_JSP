<%@page import="kr.or.ddit.vo.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 수정</title>
</head>

<style>
section{
	width: 50%;
	margin: 0 auto;
	text-align: center;
	border: 1px solid black;
	padding: 20px;
}
table{
	margin: 0 auto;
}


</style>


<body>
		<% 
			request.setCharacterEncoding("utf-8");
		
			BoardVO boardvo = (BoardVO) request.getAttribute("boardvo");
			
		%>
		<c:set var="path" value="<%= request.getContextPath() %>"></c:set>
		<c:set var="boardvo" value="<%= boardvo %>"></c:set>
<section>	
		<h1>게시판 수정</h1>
		
		<br />
		<hr />
		<br />
		
		<form action="${path}/BoardModify.do?boardNo=${boardvo.getBo_no()}" method="post">
			<table border="1" style="width: 100%;">
				<tr>
					<th width="30%">제목</th>
					<td width="70%">
						<input type="text" name="title" style="width: 95%;" value="${boardvo.getBo_title()}" />
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea name="content" style="width: 95%; height: 100px;" wrap="soft">${boardvo.getBo_content()}</textarea>
					</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>
						<input type="text" name="writer" style="width: 95%;" value="${boardvo.getBo_writer()}" />
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="submit">수정</button>
						<a href="${path}/">게시판 목록</a>
					</td>
				</tr>
			</table>
		</form>
		</section>	
	</body>
</html>