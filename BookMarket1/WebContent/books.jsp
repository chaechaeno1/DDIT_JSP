<%@page import="java.util.ArrayList"%>
<%@page import="dao.BookRepository"%>
<%@page import="vo.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>도서 목록</title>
</head>
<body>
	<%@ include file="menu.jsp" %>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-4">도서 목록</h1>
		</div>
	</div>

	<%
		BookRepository dao = BookRepository.getInstance();
		ArrayList<Book> listOfBooks = dao.getAllBooks();
	
	%>
	
			<%
		
			for(int i = 0; i < listOfBooks.size(); i++){
				Book book = listOfBooks.get(i);
			
				
		%>

	<div class="container">	
		<div class="row">
			<div class="col-md-3" align="center">	
				<img src="${pageContext.request.contextPath}/resources/images/<%=book.getFilename()%>" width="60%">
			</div>
			

			<div class="col-md-10">	
				<h5 ><b>서명 : <%=book.getName()%></b></h5>
				<p style="padding-top: 10px">설명 : <%=book.getDescription()%></p> 
				<p>저자 : <%=book.getAuthor() %>| 출판사: <%=book.getPublisher()%> | 가격:<%=book.getUnitPrice() %>원</p>
			</div>	
			<div class="col-md-2"  style="padding-top: 60px">						    			 
				<a href="book.jsp?id=<%=book.getBookId()%>" class="btn btn-secondary" role="button"> 상세정보 &raquo;></a>				
			</div>
		<%		
			}
		%>				
		</div> 
		<hr>
	</div>	
	<%@ include file="footer.jsp" %>
</body>
</html>
