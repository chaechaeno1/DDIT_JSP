<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
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
                        <h1 class="page-title">내장 객체</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="/">INDEX</a></li>
                        <li>CH05</li>
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
							넘겨받은 데이터를 아래와 같이 출력해주세요.
							
							아이디 : a001
							비밀번호 : 1234
							이름 : 홍길동
							성별 : 남자
							핸드폰번호 : 010-1234-1234
							주소 : 대전광역시 중구 요류동 대덕인재 개발원
							
							데이터 출력은 1) 스크립틀릿과 표현문을 이용한 방식 1개
									 2) JSTL을 이용한 방식 1개
									 총 2가지 방식으로 출력
									 
							*** 데이터 출력 후, 5초 뒤에 네이버 홈페이지로 이동시켜주세요.		 
						 -->
						 
						 <%
						 	request.setCharacterEncoding("utf-8");
						 	String id = request.getParameter("id");
						 	String pw = request.getParameter("pw");
						 	String name = request.getParameter("name");
						 	String gender = request.getParameter("gender");
						 	String tel1 = request.getParameter("tel1");
						 	String tel2 = request.getParameter("tel2");
						 	String tel3 = request.getParameter("tel3");
						 	String addr = request.getParameter("addr");
						 	
						 	if(gender.equals("Male")){
						 		gender = "남자";
						 	}else{
						 		gender = "여자";
						 	}
						 	
						 	String mem_tel = tel1+"-"+tel2+"-"+tel3;
						 	
						 %>
						 
						 <p>스크립틀릿/표현문 이용한 출력</p>
						아이디 : <%=id %><br/>
						비밀번호 : <%=pw %><br/>
						이름 : <%=name %><br/>
						성별 : <%=gender %><br/>
						핸드폰번호 : <%=mem_tel%><br/>
						주소 : <%=addr %>
						
						<hr/>
						
						<p>JSTL을 이용한 출력</p>
						<c:set value="<%=id %>" var="mem_id"/>
						<c:set value="<%=pw %>" var="mem_pw"/>
						<c:set value="<%=name %>" var="mem_name"/>
						<c:set value="<%=gender %>" var="mem_gender"/>
						<c:set value="<%=mem_tel %>" var="mem_tel"/>
						<c:set value="<%=addr %>" var="mem_addr"/>
						아이디 : <c:out value="${mem_id}"/> <br/>
						비밀번호 : <c:out value="${mem_pw}"/><br/>
						이름 : <c:out value="${mem_name }"/><br/>
						성별 : <c:out value="${mem_gender }"/><br/>
						핸드폰번호 : <c:out value="${mem_tel}"/><br/>
						주소 : <c:out value="${mem_addr }"/>
						
						
						<%-- <%
						 	response.setHeader("Refresh", "5; URL=http://www.naver.com");
						 %> --%>
						 
						 

                    </div>
                </div>
            </div>
        </div>
    </section>
 

 
	<%@ include file="/pageModule/footer.jsp" %>

    <%@ include file="/pageModule/footerPart.jsp" %>


</body>
<script type="text/javascript">
	var a = 0;
	var pTag = document.getElementById("p1");
	
	// [방법 1]
	setInterval(() => {
		a++;
		pTag.innerHTML = a + "초 뒤에 이동합니다!";
		if(a == 5)
			location.href = "https://www.naver.com";
	}, 1000);
	
	// [방법 2]
// 	setTimeout(() => {
// 		location.href = "https://www.naver.com";
// 	}, 5000);
</script>

</html>