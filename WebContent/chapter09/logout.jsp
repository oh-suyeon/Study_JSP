<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	Cookie cookies = new Cookie("id", "");
	cookies.setMaxAge(0);
	cookies.setPath("/"); // 똑같이 설정해주지 않으면 안됨
	response.addCookie(cookies);
%>
<!DOCTYPE html>
<html>
<head>
<title>로그아웃</title>
</head>
<body>
	로그아웃되었습니다.<br />
	<input type="button" value="메인" onclick="fn_main()">
</body>
<script type="text/javascript">
	function fn_main() {
		var chk = confirm("메인화면으로 이동하시겠습니까?")
		if(chk){
			location.href="/chapter07/layout.jsp";
		}
	}
</script>
</html>