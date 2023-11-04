<%@page import="vo.Book"%>
<%@page import="dao.BookRepository"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="java.io.File"%>
<%@ page contentType="text/html; charset=utf-8"%>

<!-- 
	processAddBook은 넘겨받은 파라미터들을 이용해서 파일데이터와 일반데이터를 
	DiskFileUpload 객체를 이용해서 값을 바인딩하는 문제니까~ 채워넣어주면 될거에요 ^^
 -->


<%
	// (1) 인코딩 설정
	request.setCharacterEncoding("utf-8");


	// (2) 절대 경로 설정
	String realFolder = request.getServletContext().getRealPath("/resources/images");
	String enctype = "UTF-8";
	
	// (3) 업로드 될 최대 파일 크기
	int maxSize = 5 * 1024 * 1024;
	
	
	// (4) 경로가 담긴 파일 생성 후, 없다면 생성하도록 하는 if문 작성
	File folder = new File(realFolder);
	if(!folder.exists()){
		folder.mkdirs();
	}
	
	DiskFileUpload upload = new DiskFileUpload();
	upload.setSizeMax(1000000); //최대크기
	upload.setSizeThreshold(maxSize); //메모리상에 저장할 최대 크기
	upload.setRepositoryPath(realFolder); //업로드된 파일을 임시로 저장할 경로
	
	List items = upload.parseRequest(request); //일반 데이터, 파일데이터 모두 담음
	Iterator params = items.iterator();
	
	// 데이터 저장 변수 설정
	String bookId = ""; 		// 책 ID
	String name= "";		// 책이름
	String unitPrice= "";	// 가격
	String author= "";		// 저자
	String publisher= "";	// 출판사	
	String releaseDate= "";  // 출판일(월/년)
	String totalPages= ""; 	// 페이지수
	String description= "";	// 설명
	String category= ""; 	// 분류
	String unitsInStock= ""; 	// 재고개수
	String condition= ""; 	// 신제품
	String filename= "";		// 파일명

	
	while(params.hasNext()){
		FileItem item = (FileItem)params.next();
	
		if(item.isFormField()){ //일반 데이터일때
			String fieldName = item.getFieldName();
			
			//일반적인 input 요소로 넘어온 name(key)을 이용하여 값을 할당
			if(fieldName.equals("bookId")){
				bookId = item.getString(enctype);
			}else if(fieldName.equals("name")){
				name = item.getString(enctype);
			}else if(fieldName.equals("unitPrice")){
				unitPrice = item.getString(enctype);
			}else if(fieldName.equals("author")){
				author = item.getString(enctype);
			}else if(fieldName.equals("description")){
				description = item.getString(enctype);
			}else if(fieldName.equals("publisher")){
				publisher = item.getString(enctype);
			}else if(fieldName.equals("category")){
				category = item.getString(enctype);
			}else if(fieldName.equals("unitsInStock")){
				unitsInStock = item.getString(enctype);
			}else if(fieldName.equals("condition")){
				condition = item.getString(enctype);
			}else if(fieldName.equals("releaseDate")){
				releaseDate = item.getString(enctype);
			}else if(fieldName.equals("totalPages")){
				totalPages = item.getString(enctype);
			}
		}else{		//파일 데이터일때 
			String fileFieldName = item.getFieldName(); //요청 파라미터 이름
			filename = item.getName(); //저장 파일의 이름
			String contentType = item.getContentType(); //파일 컨텐츠타입
			long fileSize = item.getSize(); //파일 크기 정보
			File saveFile = new File(realFolder + "/" + filename);
			item.write(saveFile); //파일 복사
			
		}
	
	}
	
	
	//가격을 문자에서 숫자로 변경
	Integer price;
	if(unitPrice.isEmpty()){
		price = 0;
	}else{
		price = Integer.valueOf(unitPrice);
	}
	
	// 재고수를 문자에서 숫자로 변경
	long stock;
	if(unitsInStock.isEmpty()){
		stock = 0;
	}else{
		stock = Long.valueOf(unitsInStock);
	}
	
	// 페이지수를 문자에서 숫자로 변경
	long pages;
	if(totalPages.isEmpty()){
		pages = 0;
	}else{
		pages = Long.valueOf(totalPages);
	}	
	
	BookRepository dao = BookRepository.getInstance();
	
	Book book = new Book();
	book.setBookId(bookId);
	book.setAuthor(author);
	book.setCategory(category);
	book.setCondition(condition);
	book.setDescription(description);
	book.setFilename(filename);
	book.setName(name);
	book.setPublisher(publisher);
	book.setReleaseDate(releaseDate);
	book.setTotalPages(pages);
	book.setUnitPrice(price);
	book.setUnitsInStock(stock);
	
	dao.addBook(book);
	
	response.sendRedirect("books.jsp");
	
	
	
	
	
	
	
	
%>

