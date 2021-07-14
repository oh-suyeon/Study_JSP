<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	// ==> /chapter14/viewMember.jsp?memberid=a001
	String memberid = request.getParameter("memberid");
	
// 	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	try {
		String jdbcDriver = "jdbc:oracle:thin:@localhost:1521/xe";
		String dbUser = "jspexam";
		String dbPass = "java";
		String query = "SELECT * FROM member WHERE memberid = '" + memberid + "'";
		
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(query);
		
		if(rs.next()){
%>
<!DOCTYPE html>
<html>
<head>
<title>회원 상세 정보</title>
</head>
<body>
	<table border="1" style="width: 100%;">
		<tr>
			<th>아이디</th>
			<td><%=memberid%></td> 
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><%=rs.getString("password") %></td> 
		</tr>
		<tr>
			<th>이름</th>
			<td><%=rs.getString("name") %></td> 
		</tr>
		<tr>
			<th>이메일</th>
			<td><%=rs.getString("email") %></td> 
		</tr>
	</table>
	<a href="/chapter14/viewMemberList.jsp">목록으로 이동</a>
<%-- 	<c:redirect url="/chapter14/viewMemberList.jsp" /> --%>
</body>
</html>
<%
		}else{
			out.print(memberid + "에 해당하는 정보가 없습니다.");
		}
		
	}catch(SQLException ex){
		out.print(ex.getMessage());

	}finally{
		if(rs!=null) try{rs.close();}catch(SQLException ex){}
		if(stmt!=null) try{stmt.close();}catch(SQLException ex){}
		if(conn!=null) try{conn.close();}catch(SQLException ex){}
	}
	
%>