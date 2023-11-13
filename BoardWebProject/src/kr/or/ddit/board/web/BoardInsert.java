package kr.or.ddit.board.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.vo.BoardVO;

/**
 * Servlet implementation class BoardInsert
 */
@WebServlet("/BoardInsert.do")
public class BoardInsert extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String jspPage = "/WEB-INF/views/board/boardInsert.jsp";
		request.getRequestDispatcher(jspPage).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String writer = request.getParameter("writer");
				
		BoardVO boardvo = new BoardVO();
		boardvo.setBo_title(title);
		boardvo.setBo_content(content);
		boardvo.setBo_writer(writer);
		
		IBoardService service = BoardServiceImpl.getInstance();
		int insert = service.insertBoard(boardvo);
		
		if(insert > 0) {
			response.sendRedirect(request.getContextPath() + "/BoardList.do");
		}else { 
			response.sendRedirect(request.getContextPath() + "/BoardInsert.do");
		}
	}

}