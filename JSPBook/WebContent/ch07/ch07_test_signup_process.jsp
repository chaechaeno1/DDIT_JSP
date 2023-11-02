<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="java.io.File"%>
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
							1. 회원가입 폼에서 넘겨받은 일반 데이터, 파일 데이터를 전달받아서 일반 데이터와 파일명을 저장하여
								회원 객체 하나를 저장 후, 회원 목록에 해당하는 리스트에 저장하여 목록 페이지에서 리스트 데이터를
								활용할 수 있도록 해주세요.
							2. 회원가입이 완료되면, ch07_test_signin.jsp로 이동하여 로그인을 진행할 수 있도록 해주세요.
						 -->
						 
						 
						 <%
						 	String fileUploadPath = "C:\\upload";
						 
						 	File file = new File(fileUploadPath);
						 	
						 	if(!file.exists()){
						 		file.mkdirs();
						 	}
						 	
						 	DiskFileUpload upload = new DiskFileUpload();
						 	
						 	upload.setSizeMax(5*1024*1024);
						 	upload.setSizeThreshold(4 * 1024 * 1024); 	
							upload.setRepositoryPath(fileUploadPath);
							
							List items = upload.parseRequest(request);
							Iterator params = items.iterator();
							
							int maxSize = 4 * 1024 * 1024;
							
							while(params.hasNext()){
								FileItem fileitem = (FileItem) params.next();
								
								if(fileitem.isFormField()){
									String name = fileitem.getFieldName();
									String value = fileitem.getString("UTF-8");
									out.println(name + "=" + value + "<br/>");
								}else{						
									String fileFieldName = fileitem.getFieldName();	//요청 파라미터의 이름	
									String fileName = fileitem.getName();	//파일명
									String contentType = fileitem.getContentType();	//파일 컨텐츠 타입(Mimetype)
									long fileSize = fileitem.getSize();
									
									File newFile = new File(fileUploadPath + "/" + fileName);
									
									//최대 크기를 넘어버림(최대사이즈보다 큰 파일이 업로드 됨)
									if(maxSize < fileSize){
										out.println("파일 크기를 초과하였습니다!<br/>");
										
									}else{
										fileitem.write(newFile);	//파일 복사
										
									}
									
									out.println("───────────────────────────────────<br/>");
									out.println("요청 파라미터 이름 : "+ fileFieldName + "<br/>");
									out.println("저장 파일 이름 : "+ fileName + "<br/>");
									out.println("파일 컨텐츠 타입 : "+ contentType + "<br/>");
									out.println("파일 크기 : "+ fileSize + "<br/>");
													
								}
								
							}
							
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