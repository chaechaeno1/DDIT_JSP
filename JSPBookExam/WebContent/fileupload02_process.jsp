<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	
		String fileUploadPath = "C:\\upload";
	
		File file = new File(fileUploadPath);
		
		if(!file.exists()){
			file.mkdirs();
		}
		
		DiskFileUpload upload = new DiskFileUpload();
		upload.setSizeMax(5 * 1024 * 1024);
		upload.setSizeThreshold(4 * 1024 * 1024);
		upload.setRepositoryPath(fileUploadPath);
		
		List items = upload.parseRequest(request);
		Iterator params = items.iterator();
		
		while(params.hasNext()){
			FileItem fileItem = (FileItem) params.next();
			
			//요청 파라미터 이름, 저장 파일 이름, 파일 콘텐츠 유형, 파일크기 출력
			if(!fileItem.isFormField()){
				String fileFieldName = fileItem.getFieldName();
				String fileName = fileItem.getName();
				String contentType = fileItem.getContentType();
				long fileSize = fileItem.getSize();
				
				File newFile = new File(fileUploadPath + "/" + fileName);
				fileItem.write(newFile);		
				
				out.println("요청 파라미터 이름 : "+ fileFieldName + "<br/>");
				out.println("저장 파일 이름 : "+ fileName + "<br/>");
				out.println("파일 콘텐츠 유형 : "+ contentType + "<br/>");
				out.println("파일크기 출력 : "+ fileSize + "<br/>");
				
			}
			
			
			
		}
		
	%>

</body>
</html>