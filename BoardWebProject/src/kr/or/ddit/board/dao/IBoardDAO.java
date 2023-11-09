package kr.or.ddit.board.dao;

import java.util.List;

import kr.or.ddit.vo.BoardVO;

/*
 * 게시물 등록(insert), 삭제(delete), 수정(update), 목록(select), 조회수(update)
 * 상세보기(select)
 */
public interface IBoardDAO {

	
	
	/**
	 * DB의 Board테이블의 전체 데이터를 가져와 List에 담아서 반환하는 메서드
	 * @return BoardVO객체를 저장하고 있는 list객체
	 */
	public List<BoardVO> selectBoardList();
	
	

	/**
	 * 게시글 번호를 매개변수로 받아서 해당 게시글 정보를 가져와 반환하는 메서드
	 * 
	 * @param boardNo 검색할 게시글 번호
	 * @return 게시글 번호에 맞는 자료가 있으면 해당 게시글 정보를 갖는 BoardVO객체, 자료가 없으면 null 반환
	 */
	public BoardVO selectBoardDetail(int boardNo);
	
	
	/**
	 * BoardVO에 담겨진 자료를 DB에 insert하는 메서드
	 * 
	 * @param boardVO DB에 insert할 자료가 저장된 BoardVO객체
	 * @return 작업성공 1, 작업실패 0 
	 */
	public int insertBoard(BoardVO boardVO);
	
	
	/**
	 * BoardVO에 저장된 자료를 이용하여 update 작업을 수행하는 메서드
	 * 
	 * @param boardVO 수정할 자료가 저장된 BoardVO객체
	 * @return 작업성공 1, 작업실패 0
	 */
	public int updateBoard(BoardVO boardVO);
	
	
	/**
	 * 게시글 번호를 매개변수로 받아서 해당 게시글 정보를 삭제하는 메서드
	 * 
	 * @param boardNo 삭제할 게시글 번호
	 * @return 작업성공 1, 작업실패 0
	 */
	public int deleteBoard(int boardNo);
	
	
	//bo_hit 조회수 증가
	
	/**
	 * 게시글 번호를 매개변수로 받아서 해당 게시글의 조회수를 증가시키는 메서드
	 * @param boardNo 조회수를 증가할 게시글 번호
	 * @return 작업성공 1, 작업실패 0
	 */
	public int setCountHit(int boardNo);
	
	
}
