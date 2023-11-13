package kr.or.ddit.board.service;

import java.util.List;

import kr.or.ddit.board.dao.BoardDAOImpl;
import kr.or.ddit.board.dao.IBoardDAO;
import kr.or.ddit.vo.BoardVO;

public class BoardServiceImpl implements IBoardService {
	
	//싱글톤패턴
	private IBoardDAO dao;
	private static BoardServiceImpl service;
	private BoardServiceImpl() {
		dao = BoardDAOImpl.getInstance();
	}
	public static BoardServiceImpl getInstance() {
		if(service == null) service = new BoardServiceImpl();
		return service;
	}
	

	@Override
	public List<BoardVO> selectBoardList() {
		return dao.selectBoardList();
	}

	@Override
	public BoardVO selectBoardDetail(int boardNo) {
		return dao.selectBoardDetail(boardNo);
	}

	@Override
	public int insertBoard(BoardVO boardVO) {
		return dao.insertBoard(boardVO);
	}

	@Override
	public int updateBoard(BoardVO boardVO) {
		return dao.updateBoard(boardVO);
	}

	@Override
	public int deleteBoard(int boardNo) {
		return dao.deleteBoard(boardNo);
	}

	@Override
	public int setCountHit(BoardVO boardvo) {
		return dao.setCountHit(boardvo);
	}

}
