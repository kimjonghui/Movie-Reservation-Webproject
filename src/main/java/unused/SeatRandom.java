package unused;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Random;

public class SeatRandom {
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
			String sql = "SELECT * FROM theater";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			String name = "";
			while(rs.next()) {
				name = rs.getString("theaterName");
				Random rand = new Random();
				int randNum = rand.nextInt(3) + 3;
				String size = Integer.toString(randNum);
				String updateSql = "UPDATE `movieweb`.`theater` SET `size` = ? WHERE (`theaterName` = ?)";
				stmt = conn.prepareStatement(updateSql);
				stmt.setString(1, size);
				stmt.setString(2, name);
				int rowsAffected = stmt.executeUpdate();
				System.out.println(rowsAffected + "행 업데이트 완료.");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
