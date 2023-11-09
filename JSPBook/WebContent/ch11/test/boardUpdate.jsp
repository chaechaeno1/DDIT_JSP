<%@page import="kr.or.ddit.ch11.vo.BoardVO"%>
<%@page import="kr.or.ddit.ch11.vo.BoardFileVO"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="java.io.File"%>
<%@page import="kr.or.ddit.ch11.dao.BoardRepository"%>
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
						1. 게시글 수정을 처리해주세요.
							> 수정 성공 후, 상세보기 페이지(boardView.jsp)로 이동해주세요.
							> 수정 실패 후, 에러 페이지(exceptionBoard_error.jsp)로 이동해주세요.
					 -->
					 
					<%
							request.setCharacterEncoding("UTF-8");
					
							int no = Integer.parseInt(request.getParameter("no"));
						
							//웹 애플리케이션상의 절대 경로
							String realFolder = request.getServletContext().getRealPath("/resources/images");
							String enctype = "UTF-8"; //인코딩 타입
						
							int maxSize = 5 * 1024 * 1024; //최대 업로드 될 파일 크기(5MB)	
						
							File folder = new File(realFolder);
							if(!folder.exists()){
								folder.mkdirs();
							}
							
							DiskFileUpload upload = new DiskFileUpload();
							
							
							List items = upload.parseRequest(request); //일반 데이터, 파일데이터 모두 담음
							Iterator params = items.iterator();
							
							BoardRepository dao = BoardRepository.getInstance();
							
							//보드에다가 글 번호 가져오기!!!
							BoardVO board = dao.getBoardById(no);
							
							
							while(params.hasNext()){
								FileItem item = (FileItem)params.next();
							
								if(item.isFormField()){ //일반 데이터일때
									String fieldName = item.getFieldName();
									String value = item.getString("UTF-8");
									
									//일반적인 input 요소로 넘어온 name(key)을 이용하여 값을 할당
									if(fieldName.equals("writer")){
										board.setWriter(value);
									}else if(fieldName.equals("title")){
										board.setTitle(value);
									}else if(fieldName.equals("content")){
										board.setContent(value);
									}
								}else{		//파일 데이터일때 
									String fileFieldName = item.getFieldName(); //요청 파라미터 이름
									String fileName = item.getName(); //저장 파일의 이름
									String contentType = item.getContentType(); //파일 컨텐츠타입
									long fileSize = item.getSize(); //파일 크기 정보
									File saveFile = new File(realFolder + "/" + fileName);
									item.write(saveFile); //파일 복사
									
									//파일 객체 생성 및 저장
									BoardFileVO fileVO = new BoardFileVO();
									fileVO.setFileSize(fileSize);
									fileVO.setFileName(fileName);
									fileVO.setContentType(contentType);
									
									board.setFileVO(fileVO);
									
								}
							
							}
							
							
							
							dao.updateBoard(board);
							
							response.sendRedirect("boardView.jsp?no="+board.getNo());

							


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