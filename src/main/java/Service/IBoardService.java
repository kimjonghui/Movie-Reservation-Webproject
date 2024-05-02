package Service;

import java.util.List;

import DTO.boardDTO;

public interface IBoardService {
	// 모든 게시글 리스트를 조회
	List<boardDTO> getAllBoards();

	// 작성한 게시글만 조회하여 확인하는 메소드
	boardDTO getBoardById(int no, String id, String title);

	// 작성한 게시글을 insert 하는 메소드
	boolean insertBoard(boardDTO board);

	// 특정 게시글을 업데이트하는 메소드
	boolean updateBoard(boardDTO board);

	// 특정 게시글을 삭제하는 메소드
	boolean deleteBoard(int no);
}
