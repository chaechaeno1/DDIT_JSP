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


@WebServlet("/BoardDetail.do")
public class BoardDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String boardNo = request.getParameter("boardNo");
		System.out.println(boardNo);

		
		int iboardno = Integer.parseInt(boardNo);
		
		// 게시판 상세 정보 가져오기
		IBoardService service = BoardServiceImpl.getInstance();
		BoardVO boardvo = service.selectBoardDetail(iboardno);
		
		// 게시판 조회수 1 증가
		int hit = boardvo.getBo_hit();
		BoardVO hitVo = new BoardVO();
		hitVo.setBo_no(iboardno);
		hitVo.setBo_hit(hit);
		int hitCount = service.setCountHit(hitVo);
		
		request.setAttribute("boardvo", boardvo);
		
		String jspPage = "/WEB-INF/views/board/boardDetail.jsp";
		request.getRequestDispatcher(jspPage).forward(request, response);
	}

//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		
//	}

}