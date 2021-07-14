<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	//파라미터의 값을 구함
	String memberid = request.getParameter("memberid");
	String name = request.getParameter("name");
	
	//jdbc 드라이버 로딩 (오라클의 jdbc 드라이버는 오라클 드라이버)
// 	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	Connection conn = null;
	Statement stmt = null;
	int updateCount = 0;
	
	try {
		//xe : 시퀀스 아이디(sid). 식별하는 아이디
		String jdbcDriver = "jdbc:oracle:thin:@localhost:1521/xe";
		String dbUser = "jspexam";
		String dbPass = "java";
		
		String query  = "UPDATE MEMBER "
					  + "SET    NAME ='" + name + "' " 
					  + "WHERE  MEMBERID = '" + memberid + "'";
		
		//데이터베이스와 연결된 Connection을 생성
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		
		//Connection으로부터 Statement (형식)를 생성
		stmt = conn.createStatement();
		
		//return : 변경된 레코드 개수(0보다 크면 변경된 값이 존재)
		updateCount = stmt.executeUpdate(query);
		
	}catch(SQLException ex){
		ex.printStackTrace();
	}finally{
		if(stmt!=null) try{stmt.close();}catch(SQLException ex){};
		if(conn!=null) try{conn.close();}catch(SQLException ex){};
	}
			
%>
<!DOCTYPE html>
<html>
<head>
<title>업데이트</title>
</head>
<body>
<%
	if(updateCount>0){ // 업데이터가 되었다면
		out.print("'" + name + "'로(으로) 이름 변경 성공");
	}else{ // 업데이트 실패
		out.print(memberid + " 아이디가 없습니다.");
	}
%>
</body>
</html>