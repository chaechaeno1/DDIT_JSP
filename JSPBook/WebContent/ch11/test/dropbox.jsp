<%@page import="kr.or.ddit.ch11.vo.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.ddit.ch11.dao.BoardRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
						첨부한 파일들을 확인 할 수 있는 자료실 페이지를 구성해주세요.
						- 자료실을 구성하는데 필요한 내용 모두는 board를 작성했던 방식을 참고하여 작성한다.
						
						1. 파일의 유형에 따라 유형에 맞는 default 이미지로 리스트를 구성하세요.
						
						[출력 예]
						
						자료실
						[pdf]	[excel]	[excel]	[ppt]
						[image] [txt]	[word]	[txt]
						[etc]	[etc]	[pdf]	[ppt]
						[...]
						
						목록 
					 -->
					 
					 
					 <h4>메뉴 박스</h4>
					 <hr>
					 <input type="button" value="게시판" id="boardBtn" onclick ="location.href='boardList.jsp'">
					 <input type="button" value="자료실" id="dropboxBtn" onclick ="location.href='dropbox.jsp'">
					 <input type="button" value="로그아웃" id="logout" onclick="location.href='login.jsp'">
					 <hr>
					 <h3>자료실</h3>
					 <hr>
					 
					 
					 <!-- 스크립틀릿으로 할 때 왜 적용이 안되는지??? -->
					<c:set var="dao" value="<%= BoardRepository.getInstance() %>" />
					<c:set var="boardList" value="${dao.selectBoardList()}" />		 
					 
					 
					 <c:set value="${boardList}" var="board" />
					 
					  <!-- 이미지 들어갈 공간 만들기 -->
					 <table width="100%" class="table table-striped table-bordered table-hover">

					 						 			
					 	<c:choose>		
							<c:when test="${empty boardList}">
								<tr>
									<th>조회하실 이미지가 존재하지 않습니다.</th>
								</tr>
							</c:when>
							
							<c:otherwise>
								<c:forEach items="${boardList}" var="board"> <!-- forEach에도 var 설정 해주어야함!! -->
								<tr>
									<td>
									<div style="width:300px;">
										<img alt="${board.fileVO.fileName}" src="${pageContext.request.contextPath}/resources/images/${board.fileVO.fileName }" width="10%" height="10%">
									</div>
										파일명 : <a href="${pageContext.request.contextPath }/resources/images/${board.fileVO.fileName }" download>${board.fileVO.fileName}</a><br>
										크기 : ${board.fileVO.fileSize}<br>
									</td>
								</tr>
								
								</c:forEach>

							</c:otherwise>
						
						</c:choose>
					 	
					 </table>
					 
					 
					 
					 
					 
					 
					 
					 
					 
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>