<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>date</title>
</head>
<body>
	<c:set var="now" value="<%=new java.util.Date() %>"/>
	1. <fmt:formatDate value="${now}" type="date" dateStyle="full"/><br />
	2. <fmt:formatDate value="${now}" type="date" dateStyle="short"/><br />
	3. <fmt:formatDate value="${now}" type="time"/><br />
	4. <fmt:formatDate value="${now}" type="both" dateStyle="full" timeStyle="full"/><br />
	5. <fmt:formatDate value="${now}" pattern="z a h:mm"/><br /> <!-- 지정한 패턴대로 출력 -->
</body>
</html>