<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="java.util.Enumeration"%>
<%@page import="vo.Book"%>
<%@page import="dao.BookRepository"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	//(1) utf-8 인코딩
    	request.setCharacterEncoding("utf-8");
    

    	String realFolder = request.getServletContext().getRealPath("resources/images");
    	String enctype = "UTF-8";
    	
    	int maxSize = 5*2014*2014;
    
    	File folder = new File(realFolder);
    	if(!folder.exists()){
    		folder.mkdirs();
    	}
    	
    	DiskFileUpload upload = new DiskFileUpload();
    	upload.setSizeMax(1000000);
    	upload.setSizeThreshold(maxSize);
    	upload.setRepositoryPath(realFolder);
    	
    	List items = upload.parseRequest(request);
    	Iterator params = items.iterator(); 
    	
    	String bookId=""; 		    // 책 ID
    	String name="";			// 책이름
    	String unitPrice=""; 	// 가격
    	String author="";			// 저자
    	String description="" ;	// 설명
    	String publisher="" ;	    // 출판사
    	String category="" ; 		// 분류
    	String unitsInStock="" ; 		// 재고개수
    	String totalPages="" ; 		// 페이지수
    	String releaseDate="" ;   	// 출판일(월/년)
    	String condition="" ; 		// 신제품
    	String fileName="" ;		// 파일명

                
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
    			}else if(fieldName.equals("author")){
    				author = item.getString(enctype);
    			}else if(fieldName.equals("totalPages")){
    				totalPages = item.getString(enctype);
    			}else if(fieldName.equals("releaseDate")){
    				releaseDate = item.getString(enctype);
    		}else{		//파일 데이터일때 
    			String fileFieldName = item.getFieldName(); //요청 파라미터 이름
    			fileName = item.getName(); //저장 파일의 이름
    			String contentType = item.getContentType(); //파일 컨텐츠타입
    			long fileSize = item.getSize(); //파일 크기 정보
    			File saveFile = new File(realFolder + "/" + fileName);
    			item.write(saveFile); //파일 복사
    			
    		}
    	
    		}
    	}
        
        
    	
      	//(3) 문자로 입력받은 항목 중 가격, 재고수, 페이지수는 숫자로 변환
    	Integer price;
    	
    	if(unitPrice.isEmpty()){
    		price = 0;
    	}else{
    		price = Integer.valueOf(unitPrice);
    	}
    	
    	long stock;
    	
    	if(unitsInStock.isEmpty()){
    		stock = 0;
    	}else{
    		stock = Long.valueOf(unitsInStock);
    	}
    	
    	long pages;
    	
    	if(totalPages.isEmpty()){
    		pages=0;
    	}else{
    		pages= Long.valueOf(totalPages);
    	}
    	
    	
    	//(4) dao 생성 
    	BookRepository dao = BookRepository.getInstance();
        
    	//(5) 새로운 북 객체 생성 후 입력값 set
        Book book = new Book();
    	book.setAuthor(author);
    	book.setBookId(bookId);
    	book.setCategory(category);
    	book.setCondition(condition);
    	book.setDescription(description);
    	book.setName(name);
    	book.setPublisher(publisher);
    	book.setReleaseDate(releaseDate);
    	book.setTotalPages(pages);
    	book.setUnitPrice(price);
    	book.setUnitsInStock(stock);
    	book.setFilename(fileName);
    	
    	//(6) dao에 객체 추가 후,  books.jsp로 보내기
    	dao.addBook(book);
    	response.sendRedirect("books.jsp");
    	
    	
    	
    	
    %>
