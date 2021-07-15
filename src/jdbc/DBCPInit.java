package jdbc;

import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.apache.commons.dbcp2.ConnectionFactory;
import org.apache.commons.dbcp2.DriverManagerConnectionFactory;
import org.apache.commons.dbcp2.PoolableConnection;
import org.apache.commons.dbcp2.PoolableConnectionFactory;
import org.apache.commons.dbcp2.PoolingDriver;
import org.apache.commons.pool2.impl.GenericObjectPool;
import org.apache.commons.pool2.impl.GenericObjectPoolConfig;

public class DBCPInit extends HttpServlet{
	
	@Override
	public void init() throws ServletException {
		loadJDBCDriver();
		initConnectionPool();
	}
	
	private void loadJDBCDriver() {
		// Connection Pool이 내부에서 사용할 JDBC Driver를 로딩
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("JDBC Driver 로딩 실패", e);
		}
	}
	
	private void initConnectionPool() {
		try {
			String jdbcUrl = "jdbc:oracle:thin:@localhost:1521/xe";
			String userId = "jspexam";
			String pw = "java";
			
			// Connection Factory : Connection Pool이 새로운 Connection을 생성할 때 사용한다. 
			ConnectionFactory connFactory = new DriverManagerConnectionFactory(jdbcUrl,userId,pw);
			// PoolableConnection을 생성하는 Factory 생성
			// PoolableConnection : Connection Pool에 Connection 객체를 보관할 때 사용
			PoolableConnectionFactory poolableConnFactory = new PoolableConnectionFactory(connFactory, null);
			// Connection이 사용가능한지 여부 검사할 때 사용할 query 지정
			poolableConnFactory.setValidationQuery("select 1");
	
			// connection pool의 환경 설정 정보 생성
			GenericObjectPoolConfig poolConfig = new GenericObjectPoolConfig();
			// 놀고 있는 connection 객체를 pool에서 비사용하는 시간 기준 (몇 분 놀면 퇴근시킬 것인가?) 단위는 (1초/1000분)
			poolConfig.setTimeBetweenEvictionRunsMillis(1000L*60L*5L); // 1초->60초->5분
			// 풀(작업장)에 보관중인 커넥션(직원)이 유효한지 검사할 것인가? true-하겠다.
			poolConfig.setTestWhileIdle(true);
			// 커넥션(직원) 최소 개수(인원수)
			poolConfig.setMinIdle(4);
			// 커넥션(직원) 최대 개수(인원수)
			poolConfig.setMaxTotal(50);
			
			//커넥션 풀의 설정 정보(정책) 생성해 반영하기 (poolableConnFactory에서 설정 반영해 connection 만들기)
			GenericObjectPool<PoolableConnection> connectionPool = new GenericObjectPool<>(poolableConnFactory,poolConfig);
			// PoolableConnectionFactory에도 생성된 커넥션 풀을 연결. (부서에 작업장을 만들기)
			poolableConnFactory.setPool(connectionPool);
			
			// 커넥션 풀을 제공하는 JDBC 드라이버 등록
			Class.forName("org.apache.commons.dbcp2.PoolingDriver");
			PoolingDriver driver = (PoolingDriver)DriverManager.getDriver("jdbc:apache:commons:dbcp:");
			// 커넥션 풀 드라이버에 생성된 커넥션 풀을 등록
			driver.registerPool("chapter14", connectionPool);
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	
	
}
