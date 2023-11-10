<%@page import="kr.or.ddit.vo.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
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
	ArrayList<BoardVO> boardList = (ArrayList<BoardVO>)request.getAttribute("boardList");

%>

<!-- 게시판 목록 List -->
<section id="listForm">
    <h2>글 목록</h2>
    <hr>
    <table border="1">
        <tr>
            <th width="10%">번호</th>
            <th width="45%">제목</th>
            <th width="15%">작성자</th>
            <th width="20%">작성일</th>
            <th width="10%">조회수</th>
        </tr>
        <% 
        if(boardList == null || boardList.isEmpty()){ 
        
        %>
            <tr>
                <td colspan="5">조회할 글 목록이 없습니다.</td>
            </tr>
		<%
        }
		
		%>

    </table>
</section>

</body>
</html>