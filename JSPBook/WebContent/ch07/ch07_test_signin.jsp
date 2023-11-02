<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                        <h1 class="page-title">파일업로드</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="/">INDEX</a></li>
                        <li>CH07</li>
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
							1. 아이디, 비밀번호, 로그인 버튼을 이용하여 
								ch07_test_signin_process.jsp로 이동하여 로그인 처리 해주세요.
							2. 로그인 시, 등록된 회원이 존재하지 않는 경우, '존재하지 않는 회원입니다!'
								메세지가 출력되게 해주세요.
							3. 회원가입 버튼을 생성하고, 회원 가입 버튼을 클릭 시 회원가입 페이지로 이동합니다.
						 -->
						 
						 
						 <form action="ch07_test_signin_process.jsp" method="post">
						 	아이디:<input type="text" name="id" id="id"/><br/>
						 	비밀번호:<input type="text" name="pw" id="pw"/><br/>
						 	<input type="submit" value="로그인"/>		
						 	<span></span>
						 	<br/>
						 	<br/>
						 	<a href="ch07_test_signup.jsp">회원가입</a>				 
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