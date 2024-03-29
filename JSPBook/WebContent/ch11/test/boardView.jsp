<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.ddit.ch11.vo.BoardFileVO"%>
<%@page import="kr.or.ddit.ch11.vo.BoardVO"%>
<%@page import="kr.or.ddit.ch11.dao.BoardRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
						1. 게시글 상세보기를 출력해주세요.
							> JSTL을 활용해주세요. 
						
						[출력 예]
						
						게시판 상세보기
						──────────────────────────────────────────────
						제목 : 
						작성자 작성일 조회수
						──────────────────────────────────────────────
						내용
						──────────────────────────────────────────────
						
						[ 수정  ] [ 삭제  ] [ 목록  ]
						
						2. 수정 버튼 클릭 시, 수정 페이지(boardUpdateForm.jsp)로 이동합니다.
						3. 삭제 버튼 클릭 시, 해당 게시글이 삭제 처리 될 수 있도록 합니다.
							> "정말로 삭제하시겠습니까?" 알림창이 나타나고, [확인]버튼을 클릭 시 삭제가 처리(boardRemove.jsp) 될 수 있도록 해주세요.
							> "정말로 삭제하시겠습니까?" 알림창이 나타나고, [취소]버튼을 클릭 시 알림창이 꺼질 수 있게 해주세요.
						4. 목록 버튼 클릭 시, 목록 페이지(boardList.jsp)로 이동합니다.
					 -->
					 
					<%
						//<a href="boardView.jsp?no=${board.no}">에서 no을 받았음
						String no = request.getParameter("no");
						BoardRepository dao = BoardRepository.getInstance();
						BoardVO boardvo = dao.getBoardById(Integer.parseInt(no));
						
					%>
<%-- 					<c:set var="dao" value="<%= kr.or.ddit.ch11.dao.BoardRepository.getInstance() %>" /> --%>
<%-- 					<c:set var="boardList" value="${dao.selectBoardList()}" /> --%>
<%-- 					<c:set var="no" value="${dao.getNo()}" /> --%>
						<c:set value="<%=boardvo %>" var="board"/>
					 
					  
					 
					 <h4>게시판 상세보기</h4>
					 <hr>

					 <!-- 테이블 만들기 -->
					 <table width="100%" class="table table-bordered">
							<tr>
								<td width="20%">제목</td>
								<td width="50%">${board.title}</td>
							</tr>

							<tr>
								<td colspan="2">${board.writer} ${board.regDate}
									${board.hit}</td>
							</tr>

							<tr>
								<td colspan="2">${board.content}</td>
							</tr>

							<tr>
								<td width="20%">첨부파일</td>
								<!-- ${pageContext.request.contextPath} 추가하니까 잘됨!!!! -->
								<td width="50%"><a href="${pageContext.request.contextPath}/resources/images/${board.fileVO.fileName}" download>${board.fileVO.fileName}</a></td>
							</tr>

							<tr>
								<td colspan="2">
									<input type="button" name="updateBtn" id="updateBtn" value="수정" onclick="location.href='boardUpdateForm.jsp?no=${board.no}'">
									<input type="button" name="deleteBtn" id="deleteBtn" value="삭제" onclick="confirmDelete()">
									<input type="button" name="listBtn" id="listBtn" value="목록" onclick="location.href='boardList.jsp'">
								</td>
							</tr>
						</table>
					 

					 
					 
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>

<script>
function confirmDelete(){
	var result = confirm("정말로 삭제하시겠습니까?");
	if(result){
		location.href = "boardRemove.jsp?no=${board.no}"; /* 게시물 번호를 받아서 넘겨줘야 함 */
	}
}

</script>

</html>