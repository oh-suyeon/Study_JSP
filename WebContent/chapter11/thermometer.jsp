<%@page import="chapter11.Thermometer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	// Thermometer 클래스로부터 객체 생성 
	Thermometer thermometer = new Thermometer();
	// EL에서 사용가능하도록 request 기본 객체의 속성으로 추가
	request.setAttribute("t", thermometer);
	
%>
<!DOCTYPE html>
<html>
<head>
<title>온도계</title>
</head>
<body>
	${t.setCelsius("대전", 27.3) }
	${t.setCelsius("서울", 26.7) }
	
	대전 온도 : 섭씨 ${t.getCelsius("대전") }도 / 화씨 ${t.getFahrenheit("대전") } <br />
	서울 온도 : 섭씨 ${t.getCelsius("서울") }도 / 화씨 ${t.getFahrenheit("서울") } <br />
	
	<!-- getter 메서드 사용하는 또 다른 방법 -->
	<!-- 필드를 getter 메서드로 만들 때, 필드에 get붙이고 첫글자 대문자로 만든다.  -->
	<!-- 이걸 거꾸로 해서 get 빼고 첫글자 소문자로 만들어도 getter 메서드의 return 값을 가져올 수 있다.-->
	
	온도계 정보 : ${t.getInfo() } <br />
	온도계 정보 : ${t.info } <br />
	
	작성자 : ${t.getName() } <br />
	작성자 : ${t.name } <br />
	
</body>
</html>