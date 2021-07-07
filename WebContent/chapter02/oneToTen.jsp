<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	
%>
<!DOCTYPE html>
<html>
<head>
<title>1-10까지의 합 구하기</title>
</head>
<body>
<%
// ----------------- 스크립트 릿 코드 블록 시작 ---------------------
	// 변수 선언과 동시에 값을 대입	
	int sum = 0;

	for(int i=1; i<=10; i++){
		sum += i;
	}
// ----------------- 스크립트 릿 코드 블록 끝 ----------------------
%>
	1부터 10까지의 합은 <strong><%=sum %></strong>입니다.
	
<%
	// 두번째 스크립트릿 코드 블록
	int sum2 = 0;
	// 11에서 20까지 누적해서 더해보자
	for(int i=11; i<=20; i++){
		sum2 += i;
	}
%>
	<br>
	<br>
	11부터 20까지의 합은 <strong><%=sum2 %></strong>입니다. 
	
	<br>
	<br>
	<%=1+2+3+4+5+6+7+8+9 %>
</body>
</html>