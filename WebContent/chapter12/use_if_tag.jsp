<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="chapter11.vo.StudentVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	StudentVO studentVO = new StudentVO();
	
	Map<String, String> map = new HashMap<String, String>();
%>

<!DOCTYPE html>
<html>
<head>
<title>JST if 태그 연습</title>
</head>
<body>
	
	<!-- 조건문 값이 true이므로 항상 실행 -->
	<c:if test="true">
		작성자 : 홍길동 <br /> 
	</c:if>
	
	<!-- use_if_tag.jsp?name=ddit -->
	<c:if test="${param.name == 'ddit'}">
		name 파라미터의 값이 ${param.name }입니다. <br />
	</c:if>
	
	<c:if test="${empty param.name}">
		name 파라미터가 없습니다. <br />
	</c:if>
	
	<!-- use_if_tag.jsp?name=ddit&age=25 -->
	<c:if test="${20 < param.age }">
		당신의 나이는 21세 이상입니다. <br />
	</c:if>
	
	<!-- request 영역에 name 속성으로 들어간다.  -->
	<!-- scope는 보통 request 영역을 쓰는데, 생략 시 기본값은 page -->
	<c:set var="name" value="개똥이" scope="request"/>
	
	<!-- scope를 지정하지 않으면 4가지 영역의 name을 모두 지워버린다. 꼭 지정할 것 -->
	<c:remove var="name" scope="request"/> 
	
	${name } <br />
	
	<c:if test="${name=='개똥이' }">
		동일함<br />
	</c:if>
	

	<!-- 방법1. set으로 객체에 값을 넣고, 스크립트릿으로 값을 가져오기 -->
	<c:set target="<%=studentVO %>" property="studentName" value="개똥이" />
	1. <%=studentVO.getStudentName() %><br />
	
	<!-- 방법2. set으로 객체 자체를 가져오기 -->
	<!-- var와  target을 헷갈리기 쉽다. 
		 var는 값을 집어넣을 그릇, 이름 
		 target은 가져오고 싶은 값이다. -->
	<c:set var="student" value="<%=studentVO %>"/>
	2. ${student.studentName }<br />
	
	<c:set target="${student }" property="studentNo" value="202107001" />
	2_2. ${student.studentNo }<br />
	
	<hr />
	
	<c:set target="<%=map %>" property="id" value="a001"/>
	1. <%=map.get("id") %> <br />
	<c:set var="map2" value="<%=map %>"/>
	<c:set target="${map2 }" property="name" value="김은대"/>
	2. ${map2.name }
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		
</body>
</html>