package dbutil;

import java.io.BufferedReader;
import java.io.IOException;
import java.net.URISyntaxException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.sql.DataSource;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.ibatis.mapping.Environment;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.ibatis.transaction.TransactionFactory;
import org.apache.ibatis.transaction.jdbc.JdbcTransactionFactory;

import Mapper.MemberMapper;
import Mapper.MovieMapper;
import Mapper.ScreenInfoMapper;
import Mapper.SeatMapper;
import Mapper.TheaterMapper;
import Mapper.BoardMapper;

public class SqlSessionInit extends HttpServlet {
	private static Properties properties;
	private static DataSource dataSource;
	private static SqlSessionFactory sessionFactory;

	@Override
	public void init() throws ServletException {
		try {
			loadProperties();
			initDataSource();
			initSessionFactory();
		} catch (IOException e) {
			throw new ServletException(e);
		} catch (URISyntaxException e) {
			throw new ServletException(e);
		}
	}

	public static SqlSession getSqlSession() {
		return sessionFactory.openSession();
	}

	private void initSessionFactory() {
		SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
		TransactionFactory transactionFactory = new JdbcTransactionFactory();
		Environment environment = new Environment("development", transactionFactory, dataSource);
		Configuration configuration = new Configuration(environment);
		configuration.addMapper(MemberMapper.class); // TODO: 매퍼 생성시 추가할 것
		configuration.addMapper(TheaterMapper.class);
		configuration.addMapper(MovieMapper.class);
		configuration.addMapper(SeatMapper.class);
		configuration.addMapper(ScreenInfoMapper.class);
		configuration.addMapper(BoardMapper.class);
		sessionFactory = new SqlSessionFactoryBuilder().build(configuration);
	}

	private void initDataSource() {
		BasicDataSource ds = new BasicDataSource();
		ds.setDriverClassName(properties.getProperty("jdbc.driver"));
		ds.setUrl(properties.getProperty("jdbc.url"));
		ds.setUsername(properties.getProperty("jdbc.user"));
		ds.setPassword(properties.getProperty("jdbc.password"));

		dataSource = ds;
	}

	private void loadProperties() throws IOException, URISyntaxException {
		properties = new Properties();
		ClassLoader classLoader = SqlSessionFactory.class.getClassLoader();
		try (BufferedReader br = Files
				.newBufferedReader(Paths.get(classLoader.getResource("mysql.properties").toURI()))) {
			properties.load(br);
		}
	}
}
