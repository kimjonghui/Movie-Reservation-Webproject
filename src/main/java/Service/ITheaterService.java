package Service;

import java.util.List;

import DTO.TheaterDTO;

public interface ITheaterService {
	// DB에서 상영관찾기(전체)
	List<TheaterDTO> getAllTheaters();
}