<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>쿠키 값 변경</title>
<script type="text/javascript">
	function fn_view() {
		location.href = "/chapter09/viewCookies.jsp"
	}
</script>
</head>
<body>
<!-- Cookie cookie = new Cookie("name", URLEncoder.encode("개똥이", "UTF-8")); -->
<%	
	//서버에서 이름이 name인 Cookie 객체를 새로 생성
	Cookie cookie = new Cookie("name", URLEncoder.encode("김은대", "UTF-8"));
	//응답헤더에 넣고 다시 응답해준다. ==> name쿠키 값이 변경된 셈
	response.addCookie(cookie);
%>
	name 쿠키의 값을 변경합니다.
	<br /> 
	<br /> 
	<input type="button" value="쿠키 목록" onclick="fn_view();">
</body>
</html>