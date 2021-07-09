<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	session.invalidate(); // 세션 안의 모든 정보가 사라진다. 한큐에 해결

	//잘 쓰지 않는 방법. 로그인 상태 보관한 session 기본 객체를 삭제
	//단점 : session 기본 객체에 추가하는 속성이 MEMBERID외에도 늘어나면 각각을 처리해야 하므로 비효율적임. 
// 	session.removeAttribute("MEMBERID"); 
%>
<!DOCTYPE html>
<html>
<head>
<title>로그아웃</title>
</head>
<body>
	로그아웃하였습니다.<br/>
	<a href="/chapter10/member/sessionLoginCheck.jsp">인증 여부 판단</a><br />
</body>
</html>