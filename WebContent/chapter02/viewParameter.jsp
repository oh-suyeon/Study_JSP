<%@page import="java.util.Map"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<title>폼 데이터가 와서 출력됨</title>
</head>
<body>

name 파라미터 = <%=request.getParameter("name") %>
<br>
address 파라미터 = <%=request.getParameter("address") %>
<br>
pet 파라미터 = 
<% 
String[] values = request.getParameterValues("pet");
if(values!=null){
	for(int i=0; i<values.length; i++){
		out.println(values[i] + " ");
	}
}
%>

<br>
<br>

파라미터 이름 = 
<%
Enumeration paramEnum = request.getParameterNames();

while(paramEnum.hasMoreElements()){ // 요소가 있을 때만 반복해라
	String name = (String)paramEnum.nextElement();
	out.println(name + " ");
}
%>

<br>
<br>

<%
Map parameterMap = request.getParameterMap();

String[] nameParam = (String[])parameterMap.get("name");
if(nameParam!=null){
	out.print("name = " + nameParam[0] + "<br>");
// 	out.print("name = " + nameParam[1] + "<br>"); checkbox인 pet이 가능
}
%>



</body>
</html>