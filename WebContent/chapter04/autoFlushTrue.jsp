<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page buffer="1kb" autoFlush="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>autoFlush 속성값 true 예제</title>
</head>
<body>

<%
	//크기가 4kb 이상의 데이터가 생성됨
// 	for(int i=0; i<1000; i++){
// 		out.print("1234");
// 	}
%>
	
	웹 어플리케이션 컨텍스트 경로 : <%=request.getContextPath() %> <br>
	<%=request.getRemoteAddr() %> <br>
	<%=request.getRequestURI() %> <br>
	<%=request.getServerName() %> <br>
	<%=request.getServerPort() %>
	
</body>
</html>