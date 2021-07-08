<%@page import="util.Cookies"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	//아이디가 a001이면서 동시에 비밀번호가 1234인 경우 로그인 성공
	if (id.equals("a001")&&password.equals("1234")){
				
		response.addCookie(
			Cookies.createCookie("id", id, "/", -1) // ("id", id)만 넣으면 안 뜬다. 
		);
%>

<!DOCTYPE html>
<html>
<head>
<title>로그인 성공</title>
</head>
<body>
	로그인에 성공했습니다. <br />
	
	<!-- 5초 지나면 자동으로 메인에 가기 -->
	<div class="count" style="font-size:15px;">
		5
	</div>
	
	<script type="text/javascript">
		const countDisplay = document.querySelector(".count");
		// 1초마다 countDown 함수를 실행
		setInterval(countDown, 1000);
		
		var time = 5;
		
		function countDown() {
			if(time > 0){
				time--;
				countDisplay.innerText = time;
			}else{ // 0일때
				location.href="/chapter07/layout.jsp"
			}
		}
	</script>

<%
	}else{
		out.print(
			"<script>"
				+ "alert('로그인 실패');" 
				+ "history.go(-1);"
			+"</script>"
		);
	}
%>
</body>
</html>