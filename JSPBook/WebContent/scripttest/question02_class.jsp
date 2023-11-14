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
                        <h1 class="page-title">Script Test</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="/">INDEX</a></li>
                        <li>01</li>
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
                   		<div class="table-responsive">
							<caption>앞(SEM PC 자리)</caption>
							<table class="table table-bordered" width="100%" style="text-align:center; font-size:24px;">
								<tr width="100%" height="80px">
									<td width="10%">김지호</td>
									<td width="10%">홍창용</td>
									<td width="10%">김선욱</td>
									<td width="10%">김영진</td>
									<td width="20%"></td>
									<td width="10%">이건정</td>
									<td width="10%">최룡</td>
									<td width="10%">강민택</td>
									<td width="10%">강진석</td>
								</tr>
								<tr height="80px">
									<td>장낙훈</td>
									<td>최성동</td>
									<td>한동욱</td>
									<td>송시운</td>
									<td></td>
									<td>김민채</td>
									<td>정소현</td>
									<td>최예원</td>
									<td></td>
								</tr>
								<tr height="80px">
									<td>박상협</td>
									<td>전승표</td>
									<td>민지현</td>
									<td></td>
									<td></td>
									<td>전민균</td>
									<td>하지웅</td>
									<td></td>
									<td></td>
								</tr>
								<tr height="80px">
									<td></td>
									<td>조현준</td>
									<td>신찬섭</td>
									<td>서강민</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
							</table>
							<p id="process">진행 Process를 나타내주세요!</p>
						</div>
						<hr/><br/>
						
						<button type="button" id="clickBtn">출력</button>
						<div id="output"></div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <%@ include file="/pageModule/footer.jsp" %>

    <%@ include file="/pageModule/footerPart.jsp" %>
</body>
<script type="text/javascript">
$(function(){
	
	
	var nameBox = ""; //이름을 담을 공간(텍스트를 가져옴)
	var elementBox; //Element를 담을 공간(td자체를 의미함)
	var flag = false; //첫번째 클릭인지 두번째 클릭인지 스위칭.
	
	$("td").on("click",function(){
		
		//첫번째 클릭과 두번째 클릭을 나누어 처리
		if(flag){ //두번째 클릭 시
			flag = false; 	//두번째 클릭 했음!
			elementBox.html($(this).html());	//this는 두번째 누른 element가 되고
			
			$("#process").html(nameBox + "님과 " + $(this).html() + "님을 변경합니다!");
			$(this).html(nameBox); //지금 눌렀던 공간에는 처음 클릭했던 nameBox가 넣어짐
			
			//초기화
			nameBox = "";
			elementBox = null;
			$("td").css("background-color","white");
		
		}else{	  //첫번째 클릭 시
			flag = true;	// 먼저 클릭했음
			nameBox = $(this).html();	//이름을 담는다
			elementBox = $(this);		
			$(this).css("background-color", "yellow");
			
			$("#process").html(nameBox + "님과 ");
			
		}
		
	});
	
	
	//출력버튼 눌렀을 때!
	$("#clickBtn").on("click",function(){
		$("#output").html(""); //output 공간 초기화
		
		var tds = document.getElementsByTagName("td"); //모든 td를 다 가져옴
		var html = "<table class='table table-bordered' style='text-align:center; font-size:24px;'><tr>";
		
		//반복문 돌리기(내 이름인지 아닌지에 따라 애니메이션 적용 달라짐)
		for(var i = 1; i <= tds.length; i++){
			//첫번째 검증
			if(tds[i-1].innerText == "조현준"){
				html += "<td width='10%'><marquee><font color='blue'>"+ tds[i-1].innerText +"</font></marquee></td>";
				
			}else{
				html += "<td width='10%'>"+ tds[i-1].innerText +"</td>";
				
				
			}
			
			//1줄에 9칸이므로 9칸이 넘어가면 다음 행 만들기. 인덱스는 0부터 시작이므로 0~8이 9칸!
			if(i % 9 == 0){ //9의 배수일 때
				html += "</tr><tr>";
				
			}
			
		}
		html += "</table>";
		$("#output").html(html);
		
	});
	
	
	
	

}); //function 끝
</script>
</html>