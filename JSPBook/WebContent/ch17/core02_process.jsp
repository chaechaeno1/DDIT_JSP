<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>쉽게 배우는 JSP 웹 프로그래밍</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
	<%@ include file ="/pageModule/headPart.jsp" %>

</head>

<body>
 
    <%@ include file ="/pageModule/header.jsp" %>
 

    <div class="breadcrumbs" style="padding-top:40px;">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">JSP 표준 태그 라이브러리</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="/">INDEX</a></li>
                        <li>CH17</li>
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

						
						<%
							//core02에서 넘겨받은 값
							String number = request.getParameter("number");
						
						%>
						
						<!-- 
							c:when 태그를 사용하여 조건문 number % 2 == 0 이 참이면 출력하도록 out 태그를 작성
							위 조건문에 해당하지 않으면 c:otherwise가 실행되도록 작성
							(c:when과 반대의 결과)
							
						 -->
						
						<c:set value="<%=number %>" var="number"/>
						
						<!-- c:when과 c:otherwise는 반드시 c:choose안에서 실행해야함 -->
						<c:choose>
							<c:when test="${number % 2 == 0}">
								<c:out value="${number}"/>는(은) 짝수입니다.
							</c:when>
							<c:otherwise>
								<c:out value="${number}"/>는(은) 홀수입니다.
							</c:otherwise>
						</c:choose>
						
						
						 
						

                    </div>
                </div>
            </div>
        </div>
    </section>
 

 
	<%@ include file="/pageModule/footer.jsp" %>

    <%@ include file="/pageModule/footerPart.jsp" %>


</body>

</html>