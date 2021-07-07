<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8"); // 파라미터가 깨지지 않도록

	String name = request.getParameter("name")==null?"":request.getParameter("name");
%>
<!DOCTYPE html>
<html>
<head>
<title>여기는 index.jsp</title>
</head>
<body>
	<h2>index.jsp 페이지입니다.</h2> 
	name : <%=name %>
</body>
</html>