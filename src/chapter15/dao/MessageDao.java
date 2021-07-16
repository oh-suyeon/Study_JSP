package chapter15.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import chapter15.jdbc.jdbcUtil;
import chapter15.vo.Message;

public class MessageDao {
	
	// 한 개 객체만 사용하도록 싱글톤 패턴을 적용
	private static MessageDao messageDao = new MessageDao(); 
	private  MessageDao() {}
	public static MessageDao getInstance() {return messageDao;}
	
	public int insert(Connection conn, Message messageVo) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(
						"INSERT INTO guestbook_message "  
						+ "(message_id, guest_name, password, message) "
						+ "VALUES " 
						+ "((SELECT NVL(MAX(message_id),0) + 1 " 
						+ "  FROM guestbook_message) " 
						+ ",?,?,?)"
					);
			pstmt.setString(1, messageVo.getGuestName());	
			pstmt.setString(2, messageVo.getPassword());	
			pstmt.setString(3, messageVo.getMessage());	
			
			// 반영된 행의 개수 return
			return pstmt.executeUpdate();
			
		}finally {
			jdbcUtil.close(pstmt);
		}
	}
	
	// service 객체에서 사용할 메서드 (방명록 리스트를 리턴)
	public List<Message> selectList(Connection conn, int firstRow, int endRow){
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(
						" SELECT * " + 
						" FROM  " + 
						"    (SELECT ROW_NUMBER() OVER ( ORDER BY MESSAGE_ID DESC) rnum  " + 
						"            ,message_id, guest_name, password, message " + 
						"     FROM guestbook_message) " + 
						" WHERE rnum between "+ firstRow +" AND " +endRow
					);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				List<Message> messageList = new ArrayList<Message>();
				do { // 이미 첫번째 행을 바라보고 있기 때문.
					Message message = new Message();
					message.setMessageId(rs.getInt("message_id"));
					message.setGuestName(rs.getString("guest_name"));
					message.setPassword(rs.getNString("password"));
					message.setMessage(rs.getNString("message"));
					
					messageList.add(message);
				}while(rs.next());
				
				return messageList;
				
			}else {// select 결과가 null일때
				return Collections.emptyList();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			jdbcUtil.close(rs);
			jdbcUtil.close(pstmt);
		}
		return null;
	}
	
	
	public int selectCount(Connection conn) throws SQLException {

		Statement stmt = null;
		// select 쿼리니까 결과는 rs로 온다. 
		ResultSet rs = null;
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT COUNT(*) cnt "
								 + "FROM guestbook_message");
			rs.next();
			return rs.getInt("cnt");
			
		}finally {
			jdbcUtil.close(rs);
			jdbcUtil.close(stmt);
		}
		
	}
}
