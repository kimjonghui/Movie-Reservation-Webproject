package Mapper;

import DTO.MovieDTO;
import org.apache.ibatis.annotations.*;

@Mapper
public interface MovieMapper {
	// 영화를 DB에서 찾아오는 메소드
	@Select("SELECT * FROM movie WHERE title = #{title}")
	@Results(id = "MovieMapper", value = {
			@Result(property = "title", column = "title"),
			@Result(property = "director", column = "director"),
			@Result(property = "actor", column = "actor"),
			@Result(property = "story", column = "story"),
			@Result(property = "runtime", column = "runtime"),
			@Result(property = "rating", column = "rating"),
			@Result(property = "genre", column = "genre"),
			@Result(property = "imageURL", column = "imageURL")
	})
	MovieDTO getMovie(String title);
	// 추가예정
}
