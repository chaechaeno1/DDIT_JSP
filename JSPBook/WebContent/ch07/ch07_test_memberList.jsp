<%@page import="kr.or.ddit.ch07.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.ddit.ch07.MemberDAO"%>
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
							1. 로그인 성공 후, 넘어왔을때 'a001님! 환영합니다!' 메세지 출력을 완성해주세요.
								- 이때 a001은 로그인 시 사용한 아이디입니다
							2. 회원 목록에 저장되어있는 회원 모두를 출력해주세요.
							
								[로그아웃]
								───────────────────────────────────────────────────
									이미지	|		회원정보		|		버튼
								───────────────────────────────────────────────────
											|	아이디 : a001		|	
									이미지	|	비밀번호 : 1234	|	[상세정보]
											|	이름 : 홍길동		|	
											|	성별 : 남자		|
								───────────────────────────────────────────────────
								...
								...
								
							3. 회원등록 버튼을 클릭 시, 회원 가입 페이지로 이동하여 회원 등록을 진행할 수 있도록 해주세요.
									 
						 -->
						 
						 <%
						 	request.setCharacterEncoding("utf-8");
						 	String id = (String)session.getAttribute("id");
						 	out.print("<p>"+id+"님! 환영합니다!" +"<br>");
						 	out.print("<input type ='button' value='로그아웃' onclick='location.href='ch07_test_signin.jsp''>");
						 	MemberDAO dao = MemberDAO.getInstance();
                    		ArrayList<MemberVO> memList = dao.getMemberList();
                    		
                    		out.print("<table class ='table table-bordered' width='100%'>");
                    		out.print("<tr><th>이미지</th><th>회원정보</th><th>버튼</th></tr>");
                    		for(int i = 0 ; i < memList.size(); i++)
                    		{	
                    			MemberVO vo = memList.get(i);
                    			/* String path = "./resources/file/" + vo.getFilename(); */
                    			String fileUploadPath = request.getContextPath()+ "/file/" + vo.getFilename();
                    			StringBuilder sb = new StringBuilder();
                    			
                    			sb.append("<tr><td><img src='"+request.getContextPath()+"'style='width:100%'></td>");
                    			sb.append("<td>아이디 :" + vo.getMem_id()+"<br>");
                    			sb.append("비밀번호 : "+vo.getMem_pw()+"<br>");
                    			sb.append("이름 : "+vo.getMem_name()+"<br>");
                    			sb.append("성별 : "+vo.getMem_sex()+"</td>");
                    			sb.append("<td><input type='button' value='상세정보'></td></tr>");
                    			out.print(sb.toString());
                    			
                    		}
                    		out.print("</table>");
                    		
                    	%>
                    	<input type="button" value="회원등록" onclick="location.href='ch07_test_signup.jsp'">
						 	
						 
						 
						 
						 
						 
						 
                    </div>
                </div>
            </div>
        </div>
    </section>

    <%@ include file="/pageModule/footer.jsp" %>

    <%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>