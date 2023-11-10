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
 * Servlet implementation class BoardList
 */
@WebServlet("/BoardList.do")
public class BoardList extends HttpServlet {
	private static final long serialVersionUID = 1L;



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		IBoardService service = BoardServiceImpl.getInstance();
		
		
		//출력할 글 리스트 가져오기
		List<BoardVO> boardList = service.selectBoardList();
		
		//List 결과를 request에 저장
		request.setAttribute("boardList", boardList);
		
		//WEB-INF
		String jspPage = "/WEB-INF/views/board/boardListAct.jsp";
		
		//view페이지 설정 -> forward
		request.getRequestDispatcher(jspPage).forward(request, response);
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
