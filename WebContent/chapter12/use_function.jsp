<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>function</title>
</head>
<body>
	<c:set var="str1" value="Functions <태그>를 사용합니다. "/>
	<c:set var="str2" value="사용"/>
	<c:set var="tokens" value="1,2,3,4,5,6,7,8,9,10"/>
	*. str1 : ${str1} <br />
	*. str2 : ${str2} <br />
	*. tokens : ${tokens} <hr />
	
	1. str1의 length : ${fn:length(str1)} <br /><br />
	2. str1을 모두 대문자로 : ${fn:toUpperCase(str1)} <br /><br />
	3. str1을 모두 소문자로 : ${fn:toLowerCase(str1)} <br /><br />
	4. substring(str1,3,6) : ${fn:substring(str1,3,6)} <br /><br />
	5. substringAfter(str1,str2) : ${fn:substringAfter(str1,str2)} <br /><br />
	6. substringBefore(str1,str2) : ${fn:substringBefore(str1,str2)} <br /><br />
	7. trim(str1) : ${fn:trim(str1)} <br /><br />
	8. replace(str1,src(" "),dest("-")) : ${fn:replace(str1, " ", "-")} <br /><br />
	9. indexOf(str1,str2) : ${fn:indexOf(str1,str2)} <br /><br />
	10. startsWith(str1,str2) : ${fn:startsWith(str1,'Fun')} <br /><br />
	11. endsWith(str1,str2) : ${fn:endsWith(str1,'합니다. ')} <br /><br />
	12. contains(str1,str2) : ${fn:contains(str1,str2)} <br /><br /> 
	13. containsIgnoreCase(str1,str2) 대소문자 관계없이 포함여부 : ${fn:containsIgnoreCase(str1,str2)} <br /><br />
	
	14. split(tokens, ',') : 
		<c:set var="array" value="${fn:split(tokens, ',')}"/>
		<c:forEach var="arrayStr" items="${array }" varStatus="stat">
			${arrayStr} &nbsp;&nbsp;&nbsp;
		</c:forEach> <br /><br />
	 
	15. join(array, "-") 문자열 합침 : ${fn:join(array, "-")} <br /><br />
	16. escapeXml(str1) 특수문자처리(&는 &amp;로 변환) : ${fn:escapeXml(str1)} <br /><br />
</body>
</html>