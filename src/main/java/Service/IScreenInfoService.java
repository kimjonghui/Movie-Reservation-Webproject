package Service;

import java.util.List;

import DTO.ScreenInfoDTO;

public interface IScreenInfoService {
	// DB에서 특정 영화관 정보 찾기
	ScreenInfoDTO getScreenInfo(String theaterName, int screenNumber);
	// DB에서 특정 영화관 상영관 전체 찾기
	List<ScreenInfoDTO> getScreenInfoList(String theaterName);
}
