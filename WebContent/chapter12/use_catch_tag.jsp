<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>오류 처리하기</title>
</head>
<body>

name 파라미터 값 : <%=request.getParameter("name") %> <br />

<c:catch var="ex"> 
<%
	//파라미터가 없으면 에러가 날 것.
	if(request.getParameter("name").equals("test")){ 
%>
	${param.name }은 test입니다.
<%		
	}
%>
</c:catch>

<c:if test="${ex != null }">
	예외가 발생했습니다. <br />
	${ex}
</c:if>

</body>
</html>