<%@page import="util.Cookies"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	Cookies cookies = new Cookies(request);
%>

<!DOCTYPE html>
<html>
<head>
<title>Cookies 클래스 사용 예 - 쿠키 읽기</title>
</head>
<body>
<%=cookies.getValue("id") %>
</body>
</html>