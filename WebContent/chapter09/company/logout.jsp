<%@page import="util.Cookies"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	Cookies cookies = new Cookies(request);
	Cookie cookie1 = cookies.createCookie("id", "", "/", 0);
	Cookie cookie2 = cookies.createCookie("name", "", "/", 0);
	response.addCookie(cookie1);
	response.addCookie(cookie2);

%>
<!DOCTYPE html>
<html>
<head>
<title>LOGOUT</title>
</head>
<body>
	로그아웃 되었습니다. 
	<button type="button" onclick="location.href='/chapter09/company/main.jsp'">메인으로</button>
</body>
</html>