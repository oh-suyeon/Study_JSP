<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page buffer="8kb" autoFlush="true"%>
<%
	
%>
<!DOCTYPE html>
<html>
<head>
<title>버퍼 정보</title>
</head>
<body>
<%
	for(int i=0; i<10000;i++){
		out.print("개똥이 ");
	}
%>
	<br /><br />
	버퍼 크기 : <%=out.getBufferSize() %> <br />
	버퍼의 남은 크기 : <%=out.getRemaining() %> <br />
	autoFlush 여부 : <%=out.isAutoFlush() %> <br />
</body>
</html>