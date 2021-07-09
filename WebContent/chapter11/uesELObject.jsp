<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setAttribute("name", "개똥이");
%>
<!DOCTYPE html>
<html>
<head>
<title>EL Object</title>
</head>
<body>
	<!-- 기존에 쓰던 방법 -->
	<!-- request 기본 객체의 name 속성의 값을 가져옴 -->
	<%=request.getAttribute("name") %> <br />
	
	<!-- request '영역'에 저장된 name 속성의 값을 가져옴 -->
	request객체의 name 속성 :
	${requestScope.name}<br />
	<!-- 이렇게 해도 나온다. -->
	${name}<br />
	
	요청 URI : 
	${pageContext.request.requestURI }<br />
	
	<!-- http://localhost:8090/chapter11/uesELObject.jsp?code=P101 -->
	<!-- code라는 파라미터 가져오기 -->
	<!-- 파라미터가 안 들어오더라도 500에러(null point)가 나지 않는다. -->
	<!-- 오류도 나지 않고, null을 출력하지 않는다. 아무것도 출력하지 않는다. -->
	code 파라미터 : 
	${param.code }
	
</body>
</html>