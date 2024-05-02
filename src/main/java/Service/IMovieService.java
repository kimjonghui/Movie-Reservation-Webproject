package Service;

import DTO.MovieDTO;

public interface IMovieService {
	// DB에서 영화 찾기
	MovieDTO getMovie(String title);
	// 추가 예정
}
