<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	try {
		String jdbcDriver = "jdbc:apache:commons:dbcp:chapter14"; // DBCP에있는 것 그대로 복붙해서 url완성
		String query = "SELECT * FROM member ORDER BY memberid";
		conn = DriverManager.getConnection(jdbcDriver);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(query);
%>

<!DOCTYPE html>
<html>
<head>
<title>회원 목록</title>
</head>
<body>
	<table border="1" style="width: 100%;">
		<tr>
			<th>이름</th>
			<th>아이디</th>
			<th>이메일</th>
		</tr>
<%
	while(rs.next()){
%>
		<tr>
			<td><%=rs.getString("name") %></td>
			<td><%=rs.getString("memberid") %></td>
			<td><%=rs.getString("email") %></td>
		</tr>
<%		
	}
%>
	</table>
</body>
</html>
<%
	}catch(SQLException e){
		e.printStackTrace();
	}finally{
		if(rs!=null)try{rs.close();}catch(SQLException e){}
		if(stmt!=null)try{rs.close();}catch(SQLException e){}
		if(conn!=null)try{rs.close();}catch(SQLException e){} // close()할 때는 전처럼 삭제되는 게 아니라 반납하게 됨
	}
	
%>