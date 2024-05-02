package Mapper;

import java.util.List;

import org.apache.ibatis.annotations.*;

import DTO.ScreenInfoDTO;

@Mapper
public interface ScreenInfoMapper {
	// 특정 영화관, 특정 관의 사이즈, 상영영화를 찾는 메소드
	@Select("SELECT * FROM screenInfo where theaterName = #{theaterName} and screenNumber = #{screenNumber}")
	@Results(id = "ScreenInfoMapper", value = {
		@Result(property = "theaterName", column = "theaterName"),
		@Result(property = "screenNumber", column = "screenNumber"),
		@Result(property = "title", column = "title"),
		@Result(property = "size", column = "size")
	})
	ScreenInfoDTO getScreenInfo(@Param("theaterName") String theaterName, @Param("screenNumber") int screenNumber);
	// 특정 영화관, 특정 관의 사이즈, 상영영화를 찾는 메소드
	@Select("SELECT * FROM screenInfo where theaterName = #{theaterName}")
	@Results({
		@Result(property = "theaterName", column = "theaterName"),
		@Result(property = "screenNumber", column = "screenNumber"),
		@Result(property = "title", column = "title"),
		@Result(property = "size", column = "size")
	})
	List<ScreenInfoDTO> getScreenInfoList(@Param("theaterName") String theaterName);
}
