<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<title>에러 페이지</title>
<style type="text/css">
	body {
		margin : 0px;
		padding : 0px;
	}
	img{
		width: 100%
	}
	div {
		text-align: center;
	} 
</style>
</head>
<body>
	<img src="/chapter06/noParamEx2.jpg" alt="에러 페이지">
	<div> 
		<p>오류 유형 : <%=exception.getClass().getName() %></p>
		<p>오류 메시지 : <%=exception.getMessage() %></p>
	</div>
</body>
</html>