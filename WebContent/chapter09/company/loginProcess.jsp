<%@page import="util.Cookies"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	// id와 비밀번호 비교
	if(id.equals("a001") && password.equals("1234")){
		Cookies cookies = new Cookies(request);
		Cookie cookie1 = cookies.createCookie("id", id, "/", -1);
		Cookie cookie2 = cookies.createCookie("name", "개똥이", "/", -1);
		response.addCookie(cookie1);
		response.addCookie(cookie2);
%>
<!DOCTYPE html>
<html>
<head>
<title>LOGIN PROCESS</title>
</head>
<body>
	로그인 성공 (5초 뒤 메인으로 이동)
	<div class="countTime">
		5
	</div>
	<script type="text/javascript">
		const countDisplay = document.querySelector(".countTime");
		var time = 5;
		
		setInterval(countDown, 1000);
		
		function countDown() {
			if(time > 1){
				time--;
				countDisplay.innerText = time
			}else{
				location.href="/chapter09/company/main.jsp"
			}
		}
	</script>
<%
	}else{
%>
	로그인 실패 (5초 뒤 메인으로 이동)
	<jsp:forward page="/chapter09/company/login.jsp">
		<jsp:param value="fail" name="loginResult"/>
	</jsp:forward>
	<script type="text/javascript">
		//alert("아이디 또는 비밀번호가 올바르지 않습니다.")
		//location.href="/chapter09/company/login.jsp"
	</script>
<%	
	}
%>		
	
</body>
</html>