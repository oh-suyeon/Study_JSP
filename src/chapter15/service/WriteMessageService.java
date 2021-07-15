package chapter15.service;

import java.sql.Connection;
import java.sql.SQLException;

import chapter15.dao.MessageDao;
import chapter15.jdbc.ConnectionProvider;
import chapter15.jdbc.jdbcUtil;
import chapter15.vo.Message;

public class WriteMessageService {
	
	//싱글턴 패턴 구현 (쓰리쿠션)
	private static WriteMessageService instance = new WriteMessageService(); 
	public static WriteMessageService getInstance() {return instance;} 
	private WriteMessageService() {} // 빈 깡통 생성자
	
	public int write(Message messageVo) {
		System.out.println("messageVo : " + messageVo.toString());
		
		Connection conn = null;
		int insertCount = 0;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			// MessageDao.insert() 메서드를 이용해 메시지를 테이블에 insert
			MessageDao messageDao = MessageDao.getInstance();
			insertCount = messageDao.insert(conn, messageVo);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			jdbcUtil.close(conn);
		}
		
		return insertCount;
		
	}
	
	
	
	
	
}
