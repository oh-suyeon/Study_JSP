<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!-- 사용할 때도 그대로 가져온다. -->
<jsp:useBean id="member" scope="request" type="chapter08.member.MemberInfo" />

<!DOCTYPE html>
<html>
<head>
<title>인사말</title>
</head>
<body>
	<%=member.getName() %> (<%=member.getId() %>) 회원님 <br />
</body>
</html>