<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.ddit.ch07.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.annotation.MultipartConfig" %>
<%@ page import="javax.servlet.http.Part" %>    
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
							1. 회원가입 폼에서 넘겨받은 일반 데이터, 파일 데이터를 전달받아서 일반 데이터와 파일명을 저장하여
								회원 객체 하나를 저장 후, 회원 목록에 해당하는 리스트에 저장하여 목록 페이지에서 리스트 데이터를
								활용할 수 있도록 해주세요.
							2. 회원가입이 완료되면, ch07_test_signin.jsp로 이동하여 로그인을 진행할 수 있도록 해주세요.
						 -->
						 
						  <%
		                        String id = request.getParameter("id");
		                        String pw = request.getParameter("pw");
		                        String name = request.getParameter("name");
		                        String gender = request.getParameter("gender");
		
		                        // 파일 업로드 작업
		                        String fileName = null;
		                        String fileUploadPath = "C:\\upload";
		                        File file = new File(fileUploadPath);
		
		                        if (!file.exists()) {
		                            file.mkdirs();
		                        }
		
		                        DiskFileUpload upload = new DiskFileUpload();
		                        upload.setSizeMax(5 * 1024 * 1024);  // 최대 파일 크기 설정
		                        upload.setSizeThreshold(4 * 1024 * 1024);  // 임시 저장 경로 크기 설정
		                        upload.setRepositoryPath(fileUploadPath);  // 파일 임시 저장 경로 설정
		
		                        List items = upload.parseRequest(request);
		                        Iterator params = items.iterator();
		
		                        int maxSize = 4 * 1024 * 1024;
		
		                        while (params.hasNext()) {
		                            FileItem fileItem = (FileItem) params.next();
		
		                            if (fileItem.isFormField()) {
		                                String fname = fileItem.getFieldName();
		                                String value = fileItem.getString("UTF-8");
		                                out.println(fname + "=" + value + "<br/>");
		                            } else {
		                                String fileFieldName = fileItem.getFieldName();
		                                fileName = fileItem.getName(); // 파일명 설정
		
		                                File newFile = new File(fileUploadPath + File.separator + fileName);
		
		                                if (maxSize < fileItem.getSize()) {
		                                    out.println("파일 크기를 초과하였습니다!<br/>");
		                                } else {
		                                    fileItem.write(newFile);  // 파일 복사
		                                }
		                            }
		                        }
		
		                        MemberVO member = new MemberVO();
		                        member.setMem_id(id);
		                        member.setMem_pw(pw);
		                        member.setMem_name(name);
		                        member.setMem_sex(gender);
		                        member.setFilename(fileName);
		
		                        ArrayList<MemberVO> memberList = (ArrayList<MemberVO>) pageContext.getAttribute("memberList");
		                        if (memberList == null) {
		                            memberList = new ArrayList<>();
		                        }
		
		                        memberList.add(member);
		                        pageContext.setAttribute("memberList", memberList);
		
		                        response.sendRedirect("ch07_test_signin.jsp");
                        %>
						    

						 
						 
                    </div>
                </div>
            </div>
        </div>
    </section>

    <%@ include file="/pageModule/footer.jsp" %>

    <%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>