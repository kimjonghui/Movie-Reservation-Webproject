package Mapper;

import java.util.List;
import DTO.SeatDTO;
import org.apache.ibatis.annotations.*;

@Mapper
public interface SeatMapper {
	// 특정 시간, 특정 상영관의 특정 관의 자리 상황을 DB에서 찾는 메소드
	@Select("SELECT * FROM seat where theaterName = #{theaterName} and screenNumber = #{screenNumber} and time = #{time}")
	@Results(id = "seatMapper", value = {
			@Result(property = "theaterName", column = "theaterName"),
			@Result(property = "screenNumber", column = "screenNumber"),
			@Result(property = "row", column = "row"),
			@Result(property = "column", column = "column"),
			@Result(property = "state", column = "state"),
			@Result(property = "time", column = "time")
	})
	List<SeatDTO> getSeatList(@Param("theaterName") String theaterName, @Param("screenNumber") int screenNumber, @Param("time") String time);
	// 특정 상영관의 특정 관의 자리 상황을 DB에서 찾는 메소드
	@Select("SELECT * FROM seat where theaterName = #{theaterName} and screenNumber = #{screenNumber}")
	@Results(id = "seatMapperWithoutTime", value = {
			@Result(property = "theaterName", column = "theaterName"),
			@Result(property = "screenNumber", column = "screenNumber"),
			@Result(property = "row", column = "row"),
			@Result(property = "column", column = "column"),
			@Result(property = "state", column = "state"),
			@Result(property = "time", column = "time")
	})
	List<SeatDTO> getSeatListWithoutTime(@Param("theaterName") String theaterName, @Param("screenNumber") int screenNumber);
	// 특정 유저의 모든 예약정보를 DB에서 찾는 메소드
	@Select("SELECT * FROM seat where userID = #{userID}")
	@Results(id = "seatMapperWithUserID", value = {
			@Result(property = "theaterName", column = "theaterName"),
			@Result(property = "screenNumber", column = "screenNumber"),
			@Result(property = "row", column = "row"),
			@Result(property = "column", column = "column"),
			@Result(property = "state", column = "state"),
			@Result(property = "time", column = "time")
	})
	List<SeatDTO> getSeatListWithUserID(@Param("userID") String userID);
	// 예약관련 정보를 담은 좌석 정보를 DB에 저장하는 메소드
	@Insert("INSERT INTO seat (theaterName, screenNumber, `row`, `column`, state, time, userID) VALUES(#{theaterName}, #{screenNumber}, #{row}, #{column}, #{state}, #{time}, #{userID})")
	int insert(
			@Param("theaterName") String theaterName,
			@Param("screenNumber") int screenNumber,
			@Param("row") String row,
			@Param("column") String column,
			@Param("state") String state,
			@Param("time") String time,
			@Param("userID") String userID
			);
	// 예약취소시 좌석 정보를 DB에서 지우는 메소드
	@Delete("DELETE FROM seat where theaterName = #{theaterName} and screenNumber = #{screenNumber} and time = #{time} and `row` = #{row} and `column` = #{column}")
	int delete(
			@Param("theaterName") String theaterName,
			@Param("screenNumber") int screenNumber,
			@Param("row") String row,
			@Param("column") String column,
			@Param("time") String time
			);
}
