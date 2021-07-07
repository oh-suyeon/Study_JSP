<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	// 쿠키 생성	
	Cookie cookie = new Cookie("name", URLEncoder.encode("개똥이", "UTF-8"));
	//응답 데이터에 쿠키 추가
	response.addCookie(cookie);
%>
<!DOCTYPE html>
<html>
<head>
<title>쿠키 생성</title>
<script type="text/javascript">

	function fn_view() {
		location.href = "/chapter09/viewCookies.jsp"		
	}

</script>
</head>
<body>
	<%=cookie.getName()%> 쿠키의 값 = <%=URLDecoder.decode(cookie.getValue()) %>	
	
	<br />
	<button type="button" onclick="fn_view();">쿠키 보기</button>
	
</body>
</html>