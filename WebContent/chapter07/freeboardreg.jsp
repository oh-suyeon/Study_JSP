<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<% 
	// request 객체 내의 데이터 인코딩을 꼭 UTF-8로 설정하기!
	request.setCharacterEncoding("UTF-8");

	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	out.print("title : " + title + "<br/>");
	out.print("content : " + content + "<br/>");
	
	Map<String, Object> map = new HashMap<>();
	map.put("title", title);
	map.put("content", content);
	
	session.setAttribute("map", map);
%>
<!DOCTYPE html>
<html>
<head>
<title>게시글 등록</title>
</head>
<body>
	게시글을 등록했습니다. <br />
	<a href="/chapter07/freeboardview.jsp">[게시글 내용 보기]</a>
</body>
</html>