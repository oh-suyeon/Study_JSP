<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%

// 	Class.forName("oracle.jdbc.driver.OracleDriver");

	Connection conn = null; 
	Statement stmt = null; 
	ResultSet rs = null;
	
	try{
		String jdbcDriver = "jdbc:oracle:thin:@localhost:1521/xe";
		String dbUser = "djs02061";
		String dbPass = "java";
		String query = "SELECT * FROM lprod ORDER BY lprod_gu";
		
		conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(query);
%>
<!DOCTYPE html>
<html>
<head>
<title>상품 목록</title>
</head>
<body>
	<h2>lprod 테이블의 내용</h2>
	<table style="width: 100%" border="1px">
		<tr>
			<th>번호</th>
			<th>구분</th>
			<th>이름</th>
		</tr>
	<%
		while(rs.next()){ 
	%>	
		<c:set var="lprodId" value='<%=rs.getString("LPROD_ID") %>' scope="request"/>
		<tr>
			<td><a href="/chapter14/assignment/updateForm.jsp?lprodId=${requestScope.lprodId}">${requestScope.lprodId}</a></td>
			<td><%=rs.getString("LPROD_GU") %></td>
			<td><%=rs.getString("LPROD_NM") %></td>
		</tr>
	<%		
		}
	%>
	</table>
	<button type="button" onclick="location.href='/chapter14/assignment/insertForm.jsp'">추가</button>
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
