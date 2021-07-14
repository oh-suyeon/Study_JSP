<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>redirect 태그 사용하기</title>
</head>
<body>

	<c:if test="${param.dist=='1' }">
		<c:redirect url="/chapter07/layout.jsp" />
	</c:if>
	
	<c:if test="${param.dist=='2' }">
		<c:redirect url="/chapter07/info.jsp" />
	</c:if>
	
	<!-- /chapter07/freeboard.jsp?currentPage=6 -->
	<!-- 파라미터가 있어야 하면 -->
	<c:if test="${param.dist=='3' }">
		<c:redirect url="/chapter07/freeboard.jsp" > 
			<c:param name="currentPage" value="1"/>
		</c:redirect>
	</c:if>

	<c:if test="${param.dist=='4' }">
		<c:redirect url="http://search.daum.net/search" >
			<c:param name="w" value="blog"/>
			<c:param name="q" value="봄 라일락"/>
		</c:redirect>
	</c:if>
	
</body>
</html>