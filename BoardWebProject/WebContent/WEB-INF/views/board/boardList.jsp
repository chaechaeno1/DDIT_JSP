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
<script src="${pageContext.request.contextPath}/js/board.js"></script>

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
<script>

mypath = "<%= request.getContextPath()%>";

//ajax를 따로 관리하는 js 들어갈 공간
$(function(){
	$.boardList();
	
})

</script>

<body>


<!-- 게시판 목록 List -->
<section id="listForm">
    <h2>글 목록</h2>
    <hr>
    <table border="1" class="boardListTable">
       
    </table>
</section>

</body>
</html>