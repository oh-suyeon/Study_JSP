<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%
/* 스크립트 요소 : 동적으로 출력 결과 생성
- 스크립트 릿(Scriptlet) - 자바 코드 실행
- 표현식 (Expression) - 값을 출력
- 선언부 (Declaration) - 자바 메서드(함수)를 정의
*/
	Date now = new Date();
// 생성 부분 : HTML 코드, JSP 스크립트 들어감
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>현재 시간</title>
</head>
<body>
	현재 시간 : <%=now %> 
</body>
</html>