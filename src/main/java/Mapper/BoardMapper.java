package Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import DTO.boardDTO;

public interface BoardMapper {
	@Select("SELECT * FROM board")
	@Results(id = "BoardMapper", value = { @Result(property = "Id", column = "id", id = true),
			@Result(property = "title", column = "title"), @Result(property = "date", column = "date"),
			@Result(property = "postwritten", column = "postwritten") })
	List<boardDTO> getAllBoards();

	@Select("SELECT * FROM board WHERE no=#{no} and id = #{id} and title = #{title}")
	@ResultMap("BoardMapper")
	boardDTO getBoardById(@Param("no") int no, @Param("id") String id, @Param("title") String title);

	@Insert("INSERT INTO board (id, title, date, postwritten) VALUES (#{id}, #{title}, #{date}, #{postwritten})")
	int insertBoard(boardDTO board);

	// 업데이트 쿼리 추가
	@Update("UPDATE board SET title=#{title}, date=#{date}, postwritten=#{postwritten} WHERE no=#{no} and id=#{id}")
	int updateBoard(boardDTO board);

	// 삭제 쿼리 추가
	@Delete("DELETE FROM board WHERE no=#{no}")
	int deleteBoard(@Param("no") int no);
}