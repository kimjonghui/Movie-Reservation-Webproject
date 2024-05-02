package Service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import DTO.ScreenInfoDTO;
import Mapper.ScreenInfoMapper;
import dbutil.SqlSessionInit;

public class ScreenInfoService implements IScreenInfoService {

	@Override
	public ScreenInfoDTO getScreenInfo(String theaterName, int screenNumber) {
		try (SqlSession session = SqlSessionInit.getSqlSession()) {
			ScreenInfoMapper mapper = session.getMapper(ScreenInfoMapper.class);
			ScreenInfoDTO screenInfo = mapper.getScreenInfo(theaterName, screenNumber);
			return screenInfo;
		}
	}
	@Override
	public List<ScreenInfoDTO> getScreenInfoList(String theaterName) {
		try (SqlSession session = SqlSessionInit.getSqlSession()) {
			ScreenInfoMapper mapper = session.getMapper(ScreenInfoMapper.class);
			List<ScreenInfoDTO> screenInfoList = mapper.getScreenInfoList(theaterName);
			return screenInfoList;
		}
	}
}
