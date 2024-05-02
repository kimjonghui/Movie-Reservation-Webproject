package Service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import DTO.TheaterDTO;
import Mapper.TheaterMapper;
import dbutil.SqlSessionInit;

public class TheaterService implements ITheaterService {
	@Override
	public List<TheaterDTO> getAllTheaters() {
		try (SqlSession session = SqlSessionInit.getSqlSession()) {
			TheaterMapper mapper = session.getMapper(TheaterMapper.class);
			List<TheaterDTO> dtoList = mapper.getAllTheaters();
			return dtoList;
		}
	}
}
