package unused;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

public class MovieDAO implements IMovieDAO {
	
	public MovieDAO() {
		super();
	}

	@Override
	public Movie getMovie(String movieName) throws Exception {
		String movieCode = ""; // movieName 기반으로 Code를 찾아야함.
		
		final String URL = "jdbc:mysql://192.168.0.101:3306/movieweb";
		final String USERNAME = "team3";
		final String PASSWORD = "team3";

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		Movie movie = new Movie();
		String title = "";
		String director = "";
		String actor = "";
		String story = "";
		String runtime = "";
		String rating = "";
		String genre = "";
		String imageURL = "";
		try {
			// MySQL 데이터베이스에 연결
			connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			// 실행할 쿼리문 작성
			String query = "SELECT * FROM movie WHERE title=?";
			// PreparedStatement를 사용하여 쿼리 실행
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, movieName);
			// 쿼리 실행 결과를 ResultSet으로 받음
			resultSet = preparedStatement.executeQuery();

			// DB에 해당 영화가 존재 할 경우
			if (resultSet.isBeforeFirst()) {
				while (resultSet.next()) {
					// 각 행의 데이터를 가져와서 사용
					title = resultSet.getString("title");
					director = resultSet.getString("director");
					actor = resultSet.getString("actor");
					story = resultSet.getString("story");
					runtime = resultSet.getString("runtime");
					rating = resultSet.getString("rating");
					genre = resultSet.getString("genre");
					imageURL = resultSet.getString("imageURL");

					movie.setMovieID(movieCode);
					movie.setTitle(title);
					movie.setDirector(director);
					movie.setActor(actor);
					movie.setStory(story);
					movie.setRuntime(runtime);
					movie.setRating(rating);
					movie.setGenre(genre);
					movie.setImageURL(imageURL);
				}
			}
			// DB 선검색 후 존재하지 않을 시, api를 통해 데이터를 추출함.
			else {
				String movieSeq = movieCode.substring(1);
				String urlStr = "http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_json2.jsp?collection=kmdb_new2&detail=Y&listCount=100&ServiceKey=3429Q4L55ZFAWH8J8P90&movieSeq=";
				try {
					URL url = new URL(urlStr + movieSeq);
					HttpURLConnection conn = (HttpURLConnection) url.openConnection();

					conn.setRequestProperty("Content-Type", "application/json");
					conn.setDoOutput(true);
					conn.setRequestMethod("GET");

					BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
					StringBuilder response = new StringBuilder();
					String line;
					while ((line = reader.readLine()) != null) {
						response.append(line);
					}
					reader.close();

					String jsonData = response.toString();

					try {
						ObjectMapper mapper = new ObjectMapper();
						JsonNode jsonNode = mapper.readTree(jsonData);

						JsonNode resultNode = null;
						for (int i = 0; i <= 2; i++) {
							resultNode = jsonNode.path("Data").get(0).path("Result").get(i);
							if (resultNode.path("DOCID").asText().equals(movieCode)) {
								break;
							}
						}
						title = resultNode.path("title").asText().trim();
						director = resultNode.path("directors").path("director").get(0).path("directorNm").asText();
						JsonNode actorNode = resultNode.path("actors").path("actor");
						int loopNum = 0;
						if (actorNode.size() > 5) {
							loopNum = 5;
						} else {
							loopNum = actorNode.size();
						}
						for (int i = 0; i < loopNum; i++) {
							actor += actorNode.get(i).path("actorNm").asText();
							if (i < (loopNum - 1)) {
								actor += " , ";
							}
						}
						story = resultNode.path("plots").path("plot").get(0).path("plotText").asText();
						if (story.charAt(0) == '{') {
							story = story.substring(1);
						}
						runtime = resultNode.path("runtime").asText();
						rating = resultNode.path("rating").asText();
						genre = resultNode.path("genre").asText();
						String posters = resultNode.path("posters").asText();
						if (!posters.contains("|")) { // 포스터가 한개인 경우 해당 포스터를 사용
							imageURL = posters;
						} else {
							int cutPoint = 0;
							for (int i = 0; i <= posters.length(); i++) {
								char c = posters.charAt(i);
								if (c == '|') { // 포스터가 여러개인 경우 첫번째 포스터를 사용
									cutPoint = i;
									break;
								}
							}
							imageURL = resultNode.path("posters").asText().substring(0, cutPoint);
						}

						// DB에 영화정보 등록
						String sql = "INSERT INTO movie (movieID, title, director, actor, story, runtime, rating, genre, imageURL) values(?,?,?,?,?,?,?,?,?)";
						PreparedStatement stmt = connection.prepareStatement(sql);

						stmt.setString(1, movieCode);
						stmt.setString(2, title);
						stmt.setString(3, director);
						stmt.setString(4, actor);
						stmt.setString(5, story);
						stmt.setString(6, runtime);
						stmt.setString(7, rating);
						stmt.setString(8, genre);
						stmt.setString(9, imageURL);

						int rowsAffected = stmt.executeUpdate();
						System.out.println(rowsAffected + "행에 삽입 완료.");

						movie.setMovieID(movieCode);
						movie.setTitle(title);
						movie.setDirector(director);
						movie.setActor(actor);
						movie.setStory(story);
						movie.setRuntime(runtime);
						movie.setRating(rating);
						movie.setGenre(genre);
						movie.setImageURL(imageURL);
					} catch (Exception e) {
						throw e;
					}
				} catch (Exception e) {
					throw e;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 연결, statement, resultset 닫기
			try {
				if (resultSet != null)
					resultSet.close();
				if (preparedStatement != null)
					preparedStatement.close();
				if (connection != null)
					connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return movie;
	}
}
