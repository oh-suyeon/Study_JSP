<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");	

	String memberid = request.getParameter("memberid");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	
// 	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	int resultCount = 0;
	
	try{
		String jdbcDriver = "jdbc:oracle:thin:@localhost:1521/xe";
		String dbUser = "jspexam";
		String dbPass = "java";
		
		conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
		pstmt = conn.prepareStatement(
					"INSERT INTO member(memberid, password, name, email) VALUES (?,?,?,?)"
				);
		pstmt.setString(1, memberid);
		pstmt.setString(2, password);
		pstmt.setString(3, name);
		pstmt.setString(4, email);
		
		// query를 실행
		resultCount = pstmt.executeUpdate();
		
	}catch(SQLException ex){
		out.print(ex.getMessage());
		
	}finally{
		if(pstmt != null) try{pstmt.close();} catch(SQLException ex){}
		if(conn != null) try{conn.close();} catch(SQLException ex){}
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<title>회원 가입 처리</title>
</head>
<body>
<%
	if(resultCount > 0){
%>
	MEMBER 테이블에 새로운 레코드 삽입 완료 <br />
<%
	}
%>
	<a href="/chapter14/viewMemberList.jsp">목록으로 이동</a>
</body>
</html>