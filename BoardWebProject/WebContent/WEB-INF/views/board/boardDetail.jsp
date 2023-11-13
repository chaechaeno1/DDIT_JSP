<%@page import="kr.or.ddit.board.service.BoardServiceImpl"%>
<%@page import="kr.or.ddit.board.dao.BoardDAOImpl"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="kr.or.ddit.vo.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<%-- <script src="${pageContext.request.contextPath}/js/board.js"></script> --%>

<title>게시판 상세보기</title>
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
		
			//서블릿에서 받은 값 가져오기
			BoardVO boardvo = (BoardVO) request.getAttribute("boardvo");
			//System.out.println("boardvo : " + boardvo);
		%>
		<c:set var="path" value="<%= request.getContextPath() %>"></c:set>
		<c:set var="boardvo" value="<%= boardvo %>"></c:set>
<section>		
		<h1>게시판 상세보기</h1>
		
		<br />
		<hr />
		<br />
		
		<table border="1" style="width: 100%;">
			<colgroup>
				<col width="30%" />
				<col width="70%" />
			</colgroup>
			<tr>
				<th>제목</th>
				<td>${boardvo.getBo_title()}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<p style="white-space: pre-wrap">${boardvo.getBo_content()}</p>
				</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${boardvo.getBo_writer()}</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td>${boardvo.getBo_date()}</td>
			</tr>
			<tr>
				<td colspan="2">
					<a href="${path}/BoardModify.do?boardNo=${boardvo.getBo_no()}">수정</a>
					<a href="${path}/BoardDelete.do?boardNo=${boardvo.getBo_no()}">삭제</a>
					<a href="${path}/">게시판 목록으로 가기</a>
				</td>
			</tr>
		</table>
		</section>
	</body>
</html>