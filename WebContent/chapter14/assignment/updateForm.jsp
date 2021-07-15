<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String lprodId = request.getParameter("lprodId");

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		String jdbcDriver = "jdbc:oracle:thin:@localhost:1521/xe";
		String dbUser = "djs02061";
		String dbPass = "java";

		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		
		String query = "SELECT * FROM lprod WHERE lprod_id=?";
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1,lprodId);
		rs = pstmt.executeQuery();
		
		while(rs.next()){
%>
<!DOCTYPE html>
<html>
<head>
<title>상품 정보 수정</title>
</head>
<body>
	<form action="/chapter14/assignment/update.jsp" method="post">
		<table border="1" style="width: 100%;">
			<tr>
				<th>번호</th>
				<td>
					<input type="text" value="${param.lprodId}" name="lprodId" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>구분</th>
				<td>
					<c:set var="lprodGu" value='<%=rs.getString("lprod_gu") %>'/>
					<input type="text" value='${lprodGu}' name="lprodGu">
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
					<c:set var="lprodNm" value='<%=rs.getString("lprod_nm") %>'/>
					<input type="text" value='<%=rs.getString("lprod_nm") %>' name="lprodNm">
				</td>
			</tr>
		</table>
		<button type="submit">수정</button>
		<button type="button" onclick="location.href='/chapter14/assignment/delete.jsp?lprodId=${param.lprodId}&lprodGu=${lprodGu}&lprodNm=${lprodNm}'">삭제</button> <br />
	</form>
	<a href="/chapter14/assignment/viewLprodList.jsp">목록으로 돌아가기</a>
</body>
</html>
<%
		}
		
	}catch(SQLException e){
		e.printStackTrace();
	}finally{
		if(pstmt!=null) try{pstmt.close();} catch(SQLException e){}
		if(conn!=null) try{conn.close();} catch(SQLException e){}
	}
%>
