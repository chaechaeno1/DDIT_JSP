package kr.or.ddit.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.util.MybatisUtil;
import kr.or.ddit.vo.BoardVO;


/*
 * <mapper> namespace -> board
 */
public class BoardDAOImpl implements IBoardDAO {
	
	//싱글톤 패턴
	private static BoardDAOImpl dao;
	private SqlSession sqlSession;
	public static IBoardDAO getInstance() {
		if(dao == null) dao = new BoardDAOImpl();	
		return dao;
	}
	
	

	@Override 
	public List<BoardVO> selectBoardList() {
		SqlSession session = null;
		List<BoardVO> boardList = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			boardList = session.selectList("board.selectBoardList");
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
			
		}
	
		return boardList;
		
	}
	

	@Override
	public BoardVO selectBoardDetail(int boardNo) {
		SqlSession session = null;
		BoardVO board = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			board = session.selectOne("board.selectBoardDetail",boardNo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
			
		}
	
		return board;
	}

	@Override
	public int insertBoard(BoardVO boardVO) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.insert("board.insertBoard", boardVO);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
			
		}
	
		return cnt;
	}

	@Override
	public int updateBoard(BoardVO boardVO) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.update("board.updateBoard",boardVO);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
			
		}
	
		return cnt;
	}

	@Override
	public int deleteBoard(int boardNo) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.delete("board.deleteBoard",boardNo);
			System.out.println(boardNo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
			
		}
	
		return cnt;
	}

	@Override
	public int setCountHit(BoardVO boardvo) {
		SqlSession session = null;
		int cnt = 0;
		
		try {
			session = MybatisUtil.getSqlSession();
			cnt = session.update("board.setCountHit",boardvo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null) session.close();
			
		}
	
		return cnt;
	}

}
