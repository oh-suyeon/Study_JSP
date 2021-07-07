<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>application 기본 객체 속성 보기</title>
</head>
<body>
	<form action="setApplicationAttribute.jsp" id="frm" method="get">
		application 객체의 <br/>
		setAttribute의 name : <input type="text" name="name" value=""> <br/>
		setApplication의 value : <input type="text" name="value" value=""> <br/>
		<button type="submit">attribute 추가</button>
	</form>
	<hr>
</body>
<%
	Enumeration<String> attrEnum = application.getAttributeNames();	
	while(attrEnum.hasMoreElements()){
		String name = attrEnum.nextElement();
		Object value = application.getAttribute(name);
		out.print("application 속성 : " + name + "=" + value + "<br>");
	}
%>
</html>