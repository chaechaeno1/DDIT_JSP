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
							1. 로그인 페이지를 작성해주세요.
							** 아래 처럼 만들어주세요.
							아이디 : _________
							비밀번호 : __________
							[  로그인   ]
							
							2. 로그인 처리는 login_process.jsp 로 요청해주세요.
							> 회원가입을 진행하지 않고, 특정 아이디/비밀번호를 정해서 로그인 처리해주세요.
						 -->
						 
						 
						 <!-- 로그인 실패 시, alert창을 띄우기 위한 error 설정 -->
						 <%
								String error = request.getParameter("error");
								if(error != null){
						%>
						
						<script> alert("로그인 실패!") </script>		
						
						<%			
								}
						%>
						 
						 <form action="login_process.jsp" method="post" id="loginForm">
						 	아이디 : <input type="text" name="id" id="id"><br>
						 	비밀번호 : <input type="text" name="pw" id="pw"><br>
						 	<input type="button" id="loginBtn" value="로그인">
						 
						 </form>
						 

                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>


<script>
//제이쿼리
//id, pw 검증은 여기서 하는 게 아님 (-> 프로세스에서 하는 것)
//여기서는 아이디, 비번 칸이 빈칸인지 아닌지만 검증
$(function(){
	var loginBtn = $("#loginBtn");
	var loginForm = $("#loginForm");
	
	loginBtn.on("click", function(){
		var id = $("#id").val();	
		var pw = $("#pw").val();	
		
		if(id == null || id == ""){
			alert("아이디를 입력해주세요.");
			$("#id").focus();
			return false;
		}
		
		if(pw == null || pw == ""){
			alert("비밀번호를 입력해주세요.");
			$("#pw").focus();
			return false;
		}
		
		loginForm.submit();
		
	});
	
});



</script>





</html>