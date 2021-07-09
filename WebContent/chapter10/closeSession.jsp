<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	// 세션 종료. 기존 session 객체 제거
	// 다음 요청에서 새로운 session 기본 객체 생성
	session.invalidate();
%>
<!DOCTYPE html>
<html>
<head>
<title>세션 종료</title>
</head>
<body>
	세션을 종료하였습니다.<br />
	<a href="/chapter10/setMemberInfo.jsp">로그인<br /></a>
	<a href="/chapter10/sessionInfo.jsp">세션목록<br /></a>
</body>
</html>