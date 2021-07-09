<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	// 세션의 유효기간 설정. 초 단위 유효 시간 설정. 
	// 0이나 음수로 지정시 세션은 유효시간 갖지 않음 =>
	// session.invalidate() 메서드를 호출하기 전까지 세션 객체가 서버에 유지됨 => 메모리 부족 현상 발생하니까 쓰지 말자.
	session.setMaxInactiveInterval(60*60);

	// session 기본 객체에 속성을 설정.
	// session 종료 전까지 속성 값을 사용할 수 있다. 
	// 세션 종료시킨다든가 웹 브라우저를 닫는다든가
	session.setAttribute("MEMBERID", "ddit");
	session.setAttribute("NAME", "개똥이");
%>
<!DOCTYPE html>
<html>
<head>
<title>세션에 정보 저장</title>
</head>
<body>
	세션에 정보를 저장했습니다. <br />
	<a href="/chapter10/sessionInfo.jsp">세션 정보 보기</a>
</body>
</html>