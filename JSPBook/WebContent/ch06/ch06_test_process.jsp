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
                        <h1 class="page-title">폼 태그</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="/">INDEX</a></li>
                        <li>CH06</li>
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
							아이디 : a001
							비밀번호 : 12345
							이름 : 홍길동
							연락처 : 010-1234-1234
							성별 : 남자
							취미 : 운동 독서 영화 여행
							소개 : 안녕하세요! 반갑습니다!
								저는 홍길동이라고 합니다!
								
								
							출력은 JSTL을 이용한 출력으로 해주세요!	
						 -->
						 
						 <!--hobby는 하나의 이름으로 받기 -->
						 
						 <%
						 	request.setCharacterEncoding("utf-8");
						 
						 	String id = request.getParameter("id");
						 	String pw = request.getParameter("pw");
						 	String name = request.getParameter("name");
						 	String phone1 = request.getParameter("phone1");
						 	String phone2 = request.getParameter("phone2");
						 	String phone3 = request.getParameter("phone3");
						 	String phone = phone1 + phone2 + phone3; 
						 	
						 	String gender = request.getParameter("gender");
						 	String gen = "";
						 	
						 	if(gender.equals("M")){
						 		gen = "남자";
						 	}else{
						 		gen = "여자";
						 	}
						 	
						 	String hobby1 = request.getParameter("hobby1");	
						    String hobby2 = request.getParameter("hobby2");	
						    String hobby3 = request.getParameter("hobby3");	
						    String hobby4 = request.getParameter("hobby4");	
						    String hobby5 = request.getParameter("hobby5");	
						 	
						    if(hobby1 != null){
						    	hobby1 = "독서";
						    }
						    if(hobby2 != null){
						    	hobby2 = "운동";
						    }
						    if(hobby3 != null){
						    	hobby3 = "영화";
						    }
						    if(hobby4 != null){
						    	hobby4 = "음악";
						    }
						    if(hobby5 != null){
						    	hobby5 = "여행";
						    }
						    

									 	
						 	String comment = request.getParameter("comment");

						 %>
						 
						 
						 <c:set value="<%=id%>" var="mem_id"/>
						 <c:set value="<%=pw%>" var="mem_pw"/>
						 <c:set value="<%=name%>" var="mem_name"/>
						 <c:set value="<%=phone%>" var="mem_phone"/>
						 <c:set value="<%=gen%>" var="mem_gen"/>					 
						 <c:set value="<%=hobby1%>" var="mem_hobby1"/>
						 <c:set value="<%=hobby2%>" var="mem_hobby2"/>
						 <c:set value="<%=hobby3%>" var="mem_hobby3"/>
						 <c:set value="<%=hobby4%>" var="mem_hobby4"/>
						 <c:set value="<%=hobby5%>" var="mem_hobby5"/>
						 <c:set value="<%=comment%>" var="mem_comment"/>
						 
						 아이디 : <c:out value="${mem_id}"/> <br/>
						 비밀번호 : <c:out value="${mem_pw}"/><br/>
					 	 이름 : <c:out value="${mem_name }"/><br/>
					 	 핸드폰번호 : <c:out value="${mem_phone}"/><br/>
					 	 성별 : <c:out value="${mem_gen}"/><br/>
					 	 취미 : <c:out value="${mem_hobby}"/><br/>
					 	 소개 : <c:out value="${mem_comment}"/><br/>
					 	 
					 	 <!--  style="white-space:pre-wrap;"  -->
					 	 
		

                    </div>
                </div>
            </div>
        </div>
    </section>
 

 
	<%@ include file="/pageModule/footer.jsp" %>

    <%@ include file="/pageModule/footerPart.jsp" %>


</body>

</html>