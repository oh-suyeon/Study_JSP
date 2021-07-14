<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");

	String lprodId = request.getParameter("lprodId");
	String lprodGu = request.getParameter("lprodGu");
	String lprodNm = request.getParameter("lprodNm");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	int updateCnt = 0;
	
	try {
		String jdbcDriver = "jdbc:oracle:thin:@localhost:1521/xe";
		String dbUser = "djs02061";
		String dbPass = "java";

		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		
		String query = "UPDATE lprod SET lprod_gu=?, lprod_nm=? WHERE lprod_id=?";
		pstmt = conn.prepareStatement(query);
		
		pstmt.setString(1,lprodGu);
		pstmt.setString(2,lprodNm);
		pstmt.setString(3,lprodId);
		
		updateCnt = pstmt.executeUpdate();
		
	}catch(SQLException e){
		e.printStackTrace();
	}finally{
		if(pstmt!=null) try{pstmt.close();} catch(SQLException e){}
		if(conn!=null) try{conn.close();} catch(SQLException e){}
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<title>상품 정보 수정 결과</title>
</head>
<body>
	
<%
	if(updateCnt > 0){
		out.print("번호 : " + lprodId + "<br /> 구분 : " + lprodGu 
				+ "<br /> 이름 : " + lprodNm + "<br /> 수정 작업을 완료하였습니다. <br />");
	}else{
		out.print("수정 작업을 완료하지 못했습니다. <br />");
	}
%>
	<a href="/chapter14/assignment/viewLprodList.jsp">목록으로 돌아가기</a>
</body>
</html>