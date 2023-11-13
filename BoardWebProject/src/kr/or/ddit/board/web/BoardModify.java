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
 * Servlet implementation class BoardModify
 */
@WebServlet("/BoardModify.do")
public class BoardModify extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("utf-8");
		
		String boardNo = request.getParameter("boardNo");
		int iboardNo = Integer.parseInt(boardNo);
		
		IBoardService service = BoardServiceImpl.getInstance();
		BoardVO boardvo = service.selectBoardDetail(iboardNo);
		
		request.setAttribute("boardvo", boardvo);
		
		String jspPage = "/WEB-INF/views/board/boardModify.jsp";
		request.getRequestDispatcher(jspPage).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String writer = request.getParameter("writer");
		String boardNo = request.getParameter("boardNo");
		int iboardNo = Integer.parseInt(boardNo);
		System.out.println("title : " + title);
		System.out.println("content : " + content);
		System.out.println("writer : " + writer);
		System.out.println("boardNo : " + boardNo);
		
		BoardVO boardvo = new BoardVO();
		boardvo.setBo_no(iboardNo);
		boardvo.setBo_title(title);
		boardvo.setBo_content(content);
		boardvo.setBo_writer(writer);
		
		IBoardService service = BoardServiceImpl.getInstance();
		int update = service.updateBoard(boardvo);
		
		if(update > 0) {
			response.sendRedirect(request.getContextPath() + "/BoardDetail.do?boardNo=" + boardNo);
		}else { 
			response.sendRedirect(request.getContextPath() + "/BoardModify.do?boardNo=" + boardNo);
		}
		
	}

}