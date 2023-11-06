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
<%@ include file="/pageModule/headPart.jsp"%>

</head>

<body>

	<%@ include file="/pageModule/header.jsp"%>


	<div class="breadcrumbs" style="padding-top: 40px;">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-6 col-md-6 col-12">
					<div class="breadcrumbs-content">
						<h1 class="page-title">유효성 검사</h1>
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-12">
					<ul class="breadcrumb-nav">
						<li><a href="/">INDEX</a></li>
						<li>CH08</li>
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

						<form action="process_s.jsp" name="loginForm" method="post"
							onsubmit="return submitEvent()">
							아이디 : <input type="text" name="id" id="id"><br>
							비밀번호 : <input type="text" name="pw" id="pw"><br>
							<input type="submit" value="전송">
						</form>

						<!-- onsubmit="return submitEvent()"으로 꼭!! 해주어야함. return 없으면 오류 발생 -->


						<!-- JQuery form을 이용한 submit 이벤트 -->
						
						
						
							<!-- 버튼 안에있는 submit을 컨트롤 하지 말고, 폼태그 안에있는 submit을 컨트롤해야함!!!!  -->
							<!--  -->
						

						<!-- JQuery click 이벤트 -->
						



					</div>
				</div>
			</div>
		</div>
	</section>



	<%@ include file="/pageModule/footer.jsp"%>

	<%@ include file="/pageModule/footerPart.jsp"%>


</body>
<script type="text/javascript">
	//자바스크립트 onsubmit 이벤트 처리
	function submitEvent(){
		var id = document.loginForm.id.value;
		
		
	}
	
	

	//제이쿼리를 통한 이벤트 처리
	$(function() {
		// loginForm2을 선언하고나서 쓰는 이유
		// $("#loginForm2") 자체는 폼태그에 대한 객체
		// loginForm2은 객체에 대한 주소값을 가지고 있음
		// #loginForm2을 직접 선언하면 메모리가 계속 쌓임
		// 그래서 변수로 선언하고 주소값을 사용하는 것
		var loginForm2 = $("#loginForm2"); //변수 선언 및 초기화
		var loginForm3 = $("#loginForm3"); //변수 선언 및 초기화
		var loginBtn = $("#loginBtn"); //변수 선언 및 초기화
		
		
		

		loginForm2.submit(function(event) {
			var id = $('#id2').val();
			var pw = $('#pw2').val();

			if (id == "") {
				alert("아이디가 누락되었습니다.");
				return false; //submit을 블락하는 용도
			}
			if (pw == "") {
				alert("비밀번호가 누락되었습니다.");
				return false; //submit을 블락하는 용도
			}

		});
		
		
		loginBtn.on("click", function(){
				var id = $('#id3').val();
				var pw = $('#pw3').val();

				if (id == "") {
					alert("아이디가 누락되었습니다.");
					return false; //submit을 블락하는 용도
				}
				if (pw == "") {
					alert("비밀번호가 누락되었습니다.");
					return false; //submit을 블락하는 용도
				}
				
				loginForm3.submit(); //주체가 서브밋이 아닌 버튼 클릭이라 줄 수 있음.
				
				/* 아이디, 비번 입력하고 페이지는 넘어가나 아이디, 비밀번호가 null값으로 넘어가는 이유는
				process.jsp에서 getParameter는 id, pw로 받았지만
				loginForm3에서 name을 id3, pw3으로 설정하고 있기 때문임
				-> 두번째 방법도 동일하게 null값이 나옴
				*/

		})

	});
</script>

</html>