package kr.or.ddit.board.dao;

import java.util.List;

import kr.or.ddit.vo.BoardVO;

public interface IBoardDAO {
	
	//목록(리스트)
	//리스트 자체를 불러오는 거니까 매개변수 필요없음
	public List<BoardVO> selectList();
	
	//상세보기
	//어떤 게시물의 상세보기를 불러올 것이냐?
	//게시글 번호로 검증할 것 -> 매개변수
	//반환값은 VO객체 전부를 가져와야할 것 -> BoardVO
	public BoardVO selectDetail(int bno);
	
	//등록
	//반환값 : 성공여부를 int로 반환, 1일 경우에 성공하는 걸로..
	//매개변수는 vo객체 전체!
	public int insert(BoardVO bvo);
	
	//수정
	//반환값 : 성공여부를 int로 반환, 1일 경우에 성공하는 걸로..
	//매개변수는 vo객체
	public int update(BoardVO bvo);
	
	//삭제
	//반환값 : 성공여부를 int로 반환, 1일 경우에 성공하는 걸로..
	//어떤 글을 삭제할지 검증만 하면 되니까 상세보기와 똑같이 글번호만 가져오면 됨
	public int delete(int bno);
	
	//조회수
	//작업 성공 여부를 int형으로 받음, 성공하면 1인걸로...
	//해당 게시글의 조회수를 증가시키므로 매개변수는 VO객체!
	public int updateHit(BoardVO bvo);
	
}
