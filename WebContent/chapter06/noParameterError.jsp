<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page errorPage="/error/noParamEx.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>파라미터가 없는 오류가 발생함</title>
</head>
<body>
	
	<%
		String memId = request.getParameter("memId").toUpperCase();
		String memName = request.getParameter("memName").toUpperCase();
	%>
	
</body>
</html>