<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name")==null?"":request.getParameter("name");
	String value = request.getParameter("value")==null?"":request.getParameter("value");
	// name : a001, value : 김은대
	application.setAttribute(name, value);	
%>
<!DOCTYPE html>
<html>
<head>
<title>application 속성 지정</title>
</head>
<body>

	application 기본 객체의 속성 설정 <br/>
	<%=name %> = <%=value %>
	<br/>
	<button type="button" id="btn" onclick="javascript:location.href='viewApplicationAttribute.jsp';" >
		application객체의 attribute를 보기
	</button>
	
</body>
</html>