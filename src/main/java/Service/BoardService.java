package Service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import DTO.boardDTO;
import Mapper.BoardMapper;
import dbutil.SqlSessionInit;

public class BoardService implements IBoardService {

	@Override
	public List<boardDTO> getAllBoards() {
		List<boardDTO> boards = new ArrayList<>();
		try (SqlSession session = SqlSessionInit.getSqlSession()) {
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			boards = mapper.getAllBoards();
		} catch (Exception e) {
			System.err.println("Error retrieving boards from database: " + e.getMessage());
		}
		return boards;
	}

	@Override
	public boardDTO getBoardById(int no, String id, String title) {
		try (SqlSession session = SqlSessionInit.getSqlSession()) {
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			boardDTO board = mapper.getBoardById(no, id, title);
			return board;
		}
	}

	@Override
	public boolean insertBoard(boardDTO board) {
		try (SqlSession session = SqlSessionInit.getSqlSession()) {
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			int result = mapper.insertBoard(board);
			if (result > 0) {
				session.commit();
				return true;
			} else {
				session.rollback();
				return false;

			}
		}
	}

	@Override
	public boolean updateBoard(boardDTO board) {
		try (SqlSession session = SqlSessionInit.getSqlSession()) {
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			int result = mapper.updateBoard(board);
			if (result > 0) {
				session.commit();
				return true;
			} else {
				session.rollback();
				return false;

			}
		}
	}

	@Override
	public boolean deleteBoard(int no) {
		try (SqlSession session = SqlSessionInit.getSqlSession()) {
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			int result = mapper.deleteBoard(no);
			if (result > 0) {
				session.commit();
				return true;
			} else {
				session.rollback();
				return false;

			}
		}
	}
}
