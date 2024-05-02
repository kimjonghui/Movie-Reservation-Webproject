package Service;

import org.apache.ibatis.session.SqlSession;

import DTO.MovieDTO;
import Mapper.MovieMapper;
import dbutil.SqlSessionInit;

public class MovieService implements IMovieService {

	@Override
	public MovieDTO getMovie(String title) {
		try (SqlSession session = SqlSessionInit.getSqlSession()) {
			MovieMapper mapper = session.getMapper(MovieMapper.class);
			MovieDTO dto = mapper.getMovie(title);
			if(dto.getTitle().length() == 0) {
				// title 입력실수, null값 반환
				return null;
			}
			return dto;
		}
	}

}
