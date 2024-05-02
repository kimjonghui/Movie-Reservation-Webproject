package Service;

import java.util.List;

import DTO.SeatDTO;

public interface ISeatService {
	// DB에서 자리정보 찾기
	List<SeatDTO> getSeatList(String theaterName, int screenNumber, String time);
	
	// DB에서 자리정보 찾기(시간무관)
	List<SeatDTO> getSeatListWithoutTime(String theaterName, int screenNumber);
	
	// DB에서 자리정보 찾기(시간무관)
	List<SeatDTO> getSeatListWithUserID(String userID);
	
	// DB에 자리정보 추가
	void insert(String theaterName, int screenNumber, String row, String column, String state, String time, String userID);
	
	// DB에서 자리정보 삭제
	void delete(String theaterName, int screenNumber, String row, String column, String time);
	
	// DB에 가상값 삽입
	void addFakeData(String theaterName, int screenNumber, String time);
}
