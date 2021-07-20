package chapter15.service;

import java.sql.Connection;
import java.sql.SQLException;

import chapter15.dao.MessageDao;
import chapter15.jdbc.ConnectionProvider;
import chapter15.jdbc.jdbcUtil;
import chapter15.vo.Message;

public class DeleteMessageService {
	private static DeleteMessageService instance = new DeleteMessageService();  
	private DeleteMessageService() {};
	public static DeleteMessageService getInstance() {return instance;}
	
	
	public int deleteMessage(int messageId,String password) {
		
		Connection conn = null;
		int deleteCnt = 0;
		
		try {
			conn = ConnectionProvider.getConnection();
			
			MessageDao messageDao = MessageDao.getInstance();
			
			//해당 메시지가 존재?
			Message message = messageDao.select(conn,messageId);
			if (message==null) {
				throw new MessageNotFoundException("메시지 없음."); // 직접 만든 예외. catch에서 받기 -> rollback();
			}
	
			//비밀번호가 일치하는가? (같으면 true, 다르면 false)
			if(!message.matchPassword(password)) {
				throw new InvalidPasswordException("비밀번호가 다릅니다."); // catch에서 받기 -> rollback();
			}
			
			//해당 데이터 삭제
			deleteCnt = messageDao.delete(conn, messageId);

			conn.commit(); // 트랜잭션 종료. (T1 종료 -> T2 시작)
			
			return deleteCnt;
			
		}catch(SQLException e){ 
			// conn(트랜잭션)이 있기 때문에 [throws]하지 않고 [catch]로 처리함
			jdbcUtil.rollback(conn);
			e.printStackTrace();
			
		}catch(MessageNotFoundException | InvalidPasswordException e){
			jdbcUtil.rollback(conn);
			throw e; // 여기서 던지면, 서비스를 요청했던 jsp에서 받을 수 있고, 화면에 뿌릴 수 있음.
			
		}finally {
			jdbcUtil.close(conn);
		}
		
		return deleteCnt;
	}
	
}
