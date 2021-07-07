<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<title>에러메시지</title>
</head>
<body>
	오류가 발생했습니다. <br>
	빠른 시간 내에 문제를 해결하도록 하겠습니다. <br>
	<!-- exception 기본 객체의 클래스 이름을 출력함 -->
	오류 타입 : <%=exception.getClass().getName() %> <br>
	<!-- 오류 메시지를 출력 -->
	오류 메시지 : <%=exception.getMessage() %> <br>
</body>
</html>