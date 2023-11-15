package kr.or.ddit.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.util.MybatisUtil;
import kr.or.ddit.vo.BoardVO;

// <mapper> namespace -> board
public class BoardDAOImpl implements IBoardDAO {
	
	//싱글톤 패턴
	// (1) 싱글톤 인스턴스를 저장할 private static 변수 선언
	private static BoardDAOImpl dao;

	// (2) SqlSession을 저장할 인스턴스 변수 선언
	private SqlSession sqlSession;

	// (3) getInstance 메서드를 통해 싱글톤 인스턴스를 반환
	public static IBoardDAO getInstance() {
	    // (3-1) 만약 dao가 null이라면, 즉 최초 호출 시에만 인스턴스 생성
	    if(dao == null) 
	        dao = new BoardDAOImpl();  // (3-2) 인스턴스 생성
	    return dao;  // (3-3) 싱글톤 인스턴스 반환
	}
	
	
	@Override
	public List<BoardVO> selectList() {
		SqlSession session = null;
		List<BoardVO> boardList = null;
		
		try {
			session = MybatisUtil.getSqlSession();
			
		} catch (Exception e) {
			
		}finally {
			
		}
		
		
		return null;
	}

	@Override
	public BoardVO selectDetail(int bno) {
		
		return null;
	}

	@Override
	public int insert(BoardVO bvo) {
		
		return 0;
	}

	@Override
	public int update(BoardVO bvo) {
		
		return 0;
	}

	@Override
	public int delete(int bno) {
		
		return 0;
	}

	@Override
	public int updateHit(BoardVO bvo) {
		
		return 0;
	}

}
