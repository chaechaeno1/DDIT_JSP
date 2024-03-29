<%@page import="kr.or.ddit.ch11.dao.BoardRepository"%>
<%@page import="kr.or.ddit.ch11.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>쉽게 배우는 JSP 웹 프로그래밍</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
	<%@ include file="/pageModule/headPart.jsp" %>
</head>
<body>
	<%@ include file="/pageModule/header.jsp" %>

    <div class="breadcrumbs" style="padding-top:40px;">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">JSP 개요</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="/">INDEX</a></li>
                        <li>CH01</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <section class="about-us section">
        <div class="container">
            <div class="row align-items-center justify-content-center">
                <div class="col-lg-12 col-md-12 col-12">
                    <div class="content-left wow fadeInLeft" data-wow-delay=".3s">
					<!-- 
						1. 게시판 수정 페이지를 작성해주세요.
						
						[출력 예]
						
						게시글 등록
						─────────────────────────────
						제목 : 제목입니다1
						작성자 : 홍길동
						내용 : 내용입니다1
						─────────────────────────────
						[ 수정  ] [ 목록 ]
						
						2. 수정 버튼 클릭 시, 게시글 수정(boardUpdate.jsp)을 진행해주세요.
						3. 목록 버튼 클릭 시, 목록 페이지(boardList.jsp)로 이동해주세요. 
					 -->
					 
					 
					  <%
					 	int no = Integer.parseInt(request.getParameter("no"));
					 
					 	BoardVO boardvo = BoardRepository.getInstance().getBoardById(no);
					 %>
					 
					 
					 <h4>게시판 수정</h4>
					 <hr>
					 <form action="boardUpdate.jsp?no=<%=no %>" method="post" enctype="multipart/form-data" id="updateForm">
						  <table width="100%" class="table table-bordered">
						  	<tr>
						  		<td width="30%">제목</td>
						  		<td width="70%"><input type="text" name="title" value="<%= boardvo.getTitle()%>"></td>
						  	</tr>
						  	<tr>
						  		<td width="30%">내용</td>
						  		<td width="70%">
						  			<textarea name="content" cols="100" rows="10"><%= boardvo.getContent()%></textarea>
						  		</td>
						  	</tr>
						  	<tr>
						  		<td width="30%">파일</td>
						  		<td width="70%"><input type="file" name="file"></td>
						  	</tr>
						  	<tr>
						  		<td width="30%">첨부파일 내용</td>
						  		<td width="70%"><a href="${pageContext.request.contextPath}/resources/images/<%=boardvo.getFileVO().getFileName()%>"><%=boardvo.getFileVO().getFileName()%></a></td>
						  	</tr>
						  	<tr>
						  		<td colspan="2">
						  			<input type="submit" value="수정" name="updateBtn" id="updateBtn">
									<input type="button" value="취소" name="deleteBtn" id="deleteBtn" onclick="location.href='boardList.jsp'">
						  		</td>
						  	</tr>
						  	
						  </table>
					 </form>
					 
					 
					 
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>