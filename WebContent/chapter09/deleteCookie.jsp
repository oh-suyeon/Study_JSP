<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%	
	// 쿠키 클래스는 쿠키를 삭제하는 기능이 없다. 
	Cookie cookie = new Cookie("name","");
	// 유효시간을 0으로 지정함(setMaxAge()) ==> 초단위
	// 60*60 => 1시간
	cookie.setMaxAge(0);
	// 응답 헤더에 추가	
	response.addCookie(cookie);
%>
<!DOCTYPE html>
<html>
<head>
<title>쿠키 삭제</title>
<script type="text/javascript">
	function fn_view() {
		location.href="/chapter09/viewCookies.jsp";
	}
</script>
</head>
<body>
	name 쿠키를 삭제합니다.
	<br />
	<br />
	<button type="button" onclick="fn_view();">쿠키 목록</button>
</body>
</html>