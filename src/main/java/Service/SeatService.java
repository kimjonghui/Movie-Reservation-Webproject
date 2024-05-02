package Service;

import java.sql.SQLException;
import java.util.List;
import java.util.Random;

import org.apache.ibatis.session.SqlSession;

import DTO.ScreenInfoDTO;
import DTO.SeatDTO;
import DTO.TheaterDTO;
import Mapper.ScreenInfoMapper;
import Mapper.SeatMapper;
import Mapper.TheaterMapper;
import dbutil.SqlSessionInit;
import unused.theaterRandom;

public class SeatService implements ISeatService {

	@Override
	public List<SeatDTO> getSeatList(String theaterName, int screenNumber, String time) {
		try (SqlSession session = SqlSessionInit.getSqlSession()) {
			SeatMapper mapper = session.getMapper(SeatMapper.class);
			List<SeatDTO> seatList = mapper.getSeatList(theaterName, screenNumber, time);
			return seatList;
		}
	}

	@Override
	public List<SeatDTO> getSeatListWithoutTime(String theaterName, int screenNumber) {
		try (SqlSession session = SqlSessionInit.getSqlSession()) {
			SeatMapper mapper = session.getMapper(SeatMapper.class);
			List<SeatDTO> seatList = mapper.getSeatListWithoutTime(theaterName, screenNumber);
			return seatList;
		}
	}

	@Override
	public List<SeatDTO> getSeatListWithUserID(String userID) {
		try (SqlSession session = SqlSessionInit.getSqlSession()) {
			SeatMapper mapper = session.getMapper(SeatMapper.class);
			List<SeatDTO> seatList = mapper.getSeatListWithUserID(userID);
			return seatList;
		}
	}

	@Override
	public void insert(String theaterName, int screenNumber, String row, String column, String state, String time, String userID) {
		try (SqlSession session = SqlSessionInit.getSqlSession()) {
			SeatMapper mapper = session.getMapper(SeatMapper.class);
			int result = mapper.insert(theaterName, screenNumber, row, column, state, time, userID);
			if (result > 0) {
				session.commit();
			} else {
				session.rollback();
			}
		}
	}

	@Override
	public void delete(String theaterName, int screenNumber, String row, String column, String time) {
		try (SqlSession session = SqlSessionInit.getSqlSession()) {
			SeatMapper mapper = session.getMapper(SeatMapper.class);
			int result = mapper.delete(theaterName, screenNumber, row, column, time);
			if (result > 0) {
				session.commit();
			} else {
				session.rollback();
			}
		}
	}

	@Override
	public void addFakeData(String theaterName, int screenNumber, String time) {
	    try (SqlSession session = SqlSessionInit.getSqlSession()) {
	    	Random rand = new Random();
	        SeatMapper seatMapper = session.getMapper(SeatMapper.class);
	        ScreenInfoMapper screenMapper = session.getMapper(ScreenInfoMapper.class);
	        ScreenInfoDTO screenInfo = screenMapper.getScreenInfo(theaterName, screenNumber);
	        String size = screenInfo.getSize();
	        int endColumn = 0;
	        // 트랜잭션 시작
	        session.getConnection().setAutoCommit(false);
	        try {
	            for (int row = 1; row <= 10; row++) {
	                if (size.equals("big")) {
	                    switch (row) {
	                    	case 10: endColumn = 12; break;
	                        case 1: endColumn = 14; break;
	                        case 2: endColumn = 16; break;
	                        case 3: case 4: case 7: case 8: case 9: endColumn = 18; break;
	                        case 5: case 6: endColumn = 20; break;
	                    }
	                } else {
	                    switch (row) {
	                    	case 6: endColumn = 6; break;
	                        case 1: endColumn = 10; break;
	                        case 3: case 4: case 10: endColumn = 12; break;
	                        case 2: case 5: case 7: case 8: case 9: endColumn = 14; break;
	                    }
	                }
	                for (int column = 1; column <= endColumn; column++) {
	                    char letter = (char) (row + 64); // 숫자를 문자로 변환
	                    String rowLetter = String.valueOf(letter);
	                    // 30%의 확률로 좌석을 예약 상태로 설정
	                    if (rand.nextInt(100) < 30) {
	                        int result = seatMapper.insert(theaterName, screenNumber, rowLetter, String.valueOf(column), "booked", time, "Unknown");
	                        if (result <= 0) {
	                            throw new SQLException("Failed to insert seat data.");
	                        }
	                    }
	                }
	            }
	            // 모든 작업이 성공적으로 완료되면 커밋
	            session.getConnection().commit();
	        } catch (SQLException e) {
	            // 작업 중에 오류 발생 시 롤백
	            session.getConnection().rollback();
	            throw e;
	        } finally {
	            // 트랜잭션 종료
	            session.getConnection().setAutoCommit(true);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        // 예외 처리
	    }
	}
	
}
