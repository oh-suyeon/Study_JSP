<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%
	// 1. JDBC (오라클)드라이버 로딩 (메모리에 올리자)
// 	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	Connection conn = null; //연결 객체 
	Statement stmt = null; //형식지정
	ResultSet rs = null; //Query 실행 결과를 담을 객체
	
	try{
		// 오라클 드라이버 : Thin 드라이버, OCI 드라이버(모듈 설치 필요). 모듈 필요없는 thin 쓰기.
		String jdbcDriver = "jdbc:oracle:thin:@localhost:1521/xe";
		String dbUser = "jspexam";
		String dbPass = "java";
		String query = "SELECT * FROM member ORDER BY memberid";
		// 2. 데이터 베이스 커넥션 생성
		conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
		// 3. Statement 객체 생성
		stmt = conn.createStatement();
		// 4. Query 실행 -> resultSet에 저장
		rs = stmt.executeQuery(query);
%>
<!DOCTYPE html>
<html>
<head>
<title>회원 목록</title>
</head>
<body>
	<h2>member 테이블의 내용</h2>
	<input type="button" value="회원추가" onclick="javascript:location.href='/chapter14/insertForm.jsp';"/>
	<table style="width: 100%" border="1px">
		<tr>
			<th>이름</th>
			<th>아이디</th>
			<th>이메일</th>
		</tr>
	<%
		while(rs.next()){ // 커서가 바라보는 지점에 데이터가 있으면 true
	%>
		<c:set var="memberid" value='<%=rs.getString("MEMBERID") %>'/>
		<tr>
			<td><a href="/chapter14/viewMember.jsp?memberid=${memberid}"><%=rs.getString("NAME") %></a></td>
			<td>${memberid}</td>
			<td><%=rs.getString("EMAIL") %></td>
		</tr>
	<%		
		}
	%>
	</table>
</body>
</html>
<%		
	}catch(SQLException ex){
		out.print(ex.getMessage());
	}finally{
		if(rs!=null) try{rs.close();} catch(SQLException ex){}
		if(stmt!=null) try{stmt.close();} catch(SQLException ex){}
		if(conn!=null) try{conn.close();} catch(SQLException ex){}
	}
%>
