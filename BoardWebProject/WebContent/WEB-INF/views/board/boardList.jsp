<%@page import="java.util.List"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="kr.or.ddit.board.dao.BoardDAOImpl"%>
<%@page import="kr.or.ddit.vo.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- taglib core 추가 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<title>게시판 목록</title>
</head>

<style>
section{
	width: 70%;
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


<body>
		<% 
			request.setCharacterEncoding("utf-8");
			// 서블릿에서 보내온 자료 받기
			List<BoardVO> boardList = (List<BoardVO>) request.getAttribute("boardList");
			//System.out.println("boardList : " + boardList);
		%>
		<c:set var="path" value="<%= request.getContextPath() %>"></c:set>
		<c:set var="boardList" value="<%= boardList %>"></c:set>
<section>	
		<h1>게시판 목록</h1>
		
		<br />
		<hr />
		<br />
		
		<table border="1" style="width: 100%;">
			<tr>
				<th width="10%">번호</th>
				<th width="40%">제목</th>
				<th width="20%">작성자</th>
				<th width="20%">작성일</th>
				<th width="10%">조회수</th>
			</tr>
			<c:choose>
				<c:when test="${boardList ne null}">
					<c:forEach var="boardVo" items="${boardList}">
						<tr>
							<td>${boardVo.getBo_no() }</td>
							<td>
								<a href="${path}/BoardDetail.do?boardNo=${boardVo.getBo_no()}">${boardVo.getBo_title() }</a>
							</td>
							<td>${boardVo.getBo_writer() }</td>
							<td>${boardVo.getBo_date() }</td>
							<td>${boardVo.getBo_hit() }</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="5">등록된 게시글이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
			<tr>
				<td colspan="5">
					<input type="button" value="글쓰기" onclick="location.href='${path}/BoardInsert.do'">
				</td>
			</tr>
		</table>
		
</section>			
	</body>
</html>