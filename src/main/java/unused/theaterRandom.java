package unused;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Random;

public class theaterRandom {
	public static void main(String[] args) {
		randomSeatSetting();
	}
	
	public static void randomSeatSetting() {
		
		final String URL = "jdbc:mysql://192.168.0.101:3306/movieweb";
		final String USERNAME = "team3";
		final String PASSWORD = "team3";
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			String sql = "Select * from theater";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			String theaterName = "";
			String theaterSize = "";
			while(rs.next()) {
				Random rand = new Random();
				theaterName = rs.getString("theaterName");
				theaterSize = rs.getString("size");
				int sizeInt = Integer.valueOf(theaterSize);
				for(int i = 1; i <= sizeInt; i++) {
					int ScreenNumber = i;
					String title = "";
					switch (i) {
					case 1:
						title = "오펜하이머";
						break;
					case 2:
						title = "서울의 봄";
						break;
					case 3:
						title = "아이언 맨";
						break;
					default :
						title = "순환영화";
						break;
					}
						
					int randNum = rand.nextInt(2);	
					String size = "";
					if(randNum == 1) {
						size = "big";
					} else {
						size = "small";
					}
					String insertSql = "INSERT INTO screenInfo (theaterName, screenNumber, title, size) values (?,?,?,?)";
					stmt = conn.prepareStatement(insertSql);
					stmt.setString(1, theaterName);
					stmt.setInt(2, ScreenNumber);
					stmt.setString(3, title);
					stmt.setString(4, size);
					int rowsAffected = stmt.executeUpdate();
					System.out.println(rowsAffected + "행 업데이트 완료.");
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
