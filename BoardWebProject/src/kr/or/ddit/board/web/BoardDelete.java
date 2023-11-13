package kr.or.ddit.board.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.vo.BoardVO;

/**
 * Servlet implementation class BoardDetail
 */
@WebServlet("/BoardDelete.do")
public class BoardDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String boardNo = request.getParameter("boardNo");
		System.out.println(boardNo);

		
		int iboardno = Integer.parseInt(boardNo);
		System.out.println(iboardno);
		
		// 게시판 상세 정보 가져오기
		IBoardService service = BoardServiceImpl.getInstance();
		int delete = service.deleteBoard(iboardno);
		
		if(delete > 0) { 
			response.sendRedirect(request.getContextPath() + "/BoardList.do");
		}else { 
			response.sendRedirect(request.getContextPath() + "/BoardDetail.do?boardNo=" + iboardno);
		}
		
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}