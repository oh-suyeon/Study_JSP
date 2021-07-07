<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>쿠키 목록</title>
<script type="text/javascript">
	function fn_CRU(para) {
		
		if (para=='C'){
			location.href="/chapter09/makeCookie.jsp"
		}else if (para=='U'){
			location.href="/chapter09/modifyCookie.jsp"
		}else if (para=='D'){
			location.href="/chapter09/deleteCookie.jsp"
		}else{
			alert("잘못된 명령입니다");			
		}
	}

</script>
</head>
<body>

	<h2>쿠키 목록</h2>
<%
	Cookie[] cookies = request.getCookies();
	
	if(cookies != null && cookies.length>0){
		for(int i=0; i<cookies.length; i++){
			out.print(cookies[i].getName() + " = " + URLDecoder.decode(cookies[i].getValue()) + "<br />");
		}
	}else{
		out.print("쿠키가 없습니다.");
	}

%>
	<br />
	<button type="button" onclick="fn_CRU('C');">쿠키 생성</button> &nbsp;
	<button type="button" onclick="fn_CRU('U');">쿠키 변경</button> &nbsp;
	<button type="button" onclick="fn_CRU('D');">쿠키 삭제</button> &nbsp;
</body>
</html>