<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>numberFormat 태그 연습</title>
</head>
<body>
	
	<!-- var로 집어넣을 변수를 지정하지 않으면 그냥 출력해준다. -->
	
	<c:set var="price" value="10000" />
	1.<c:out value="${price}"/><br />
	
	<fmt:formatNumber var="numberType" value="${price}" type="number" />
	2.<c:out value="${numberType}"/><br />
	
	3.통화 : <fmt:formatNumber value="${price }" type="currency" currencySymbol="W" /> <br />
	
	4.숫자 : ${numberType}<br />
	
	5.패턴 : <fmt:formatNumber value="${price}" pattern="00000000.00"/><br />
	
	<!-- 문자열을 숫자(Number 타입)으로 변환 -->
	<fmt:parseNumber var="num" value="1,100.12" pattern="0,000.00"/>
	6.숫자로 변환한 결과 : ${pageScope.num}
	
</body>
</html>