<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%

	String id = request.getParameter("memberId")==null?"":request.getParameter("memberId");

	request.setCharacterEncoding("UTF-8");

	if(id.equals("ddit")){
		String name = "이름이름";
		String encodedName = URLEncoder.encode(name, "UTF-8");
		response.sendRedirect("/chapter03/c02_index.jsp?name=" + encodedName);
	}else {
		
%>
<!DOCTYPE html>
<html>
<head>
<title>로그인 실패</title>
</head>
<body>
	<h2>아이디가 ddit가 아닙니다.</h2>
</body>
</html>
<%		
	}
%>