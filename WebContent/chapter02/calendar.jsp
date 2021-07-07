<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Calendar"%>
<%
	Calendar cal = Calendar.getInstance();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calendar</title>
</head>
<body>
<!-- 
완전한 클래스 이름을 사용해도 JSP 페이지가 올바르게 실행됨
Calendar ==> java.util.Calendar
but, 번거롭다. 
따라서 import 속성을 사용한다. 
 -->
	오늘은
	<%=cal.get(Calendar.YEAR) %>년
	<%=cal.get(Calendar.MONTH) %>월
	<%=cal.get(Calendar.DATE) %>일 
	입니다. 
</body>
</html>