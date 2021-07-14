<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<title>중요한 foreach문 연습1</title>
</head>
<body>
	
	<h2>1부터 10까지 출력</h2>
	<c:forEach var="n" begin="1" end="10" step="1">
		${n }&nbsp;&nbsp;&nbsp;
	</c:forEach>
	
	<br />
	
	<h2>1부터 100까지 출력. 5씩 증가</h2>
	<c:forEach var="n" begin="1" end="100" step="5">
		${n }&nbsp;&nbsp;&nbsp;
	</c:forEach>
	
	<br />

	<h2>자바 Collection 사용</h2>
	<%
		List<String> list = new ArrayList<>();
		String[] arr = {"사과", "귤", "바나나", "배", "오렌지", "키위"};
		
		for(String str : arr){
			list.add(str);
		}
		// request 기본 객체에 담아보기(영역. 자바쪽이 아니다.)
		request.setAttribute("fruitList", list);
	%>
	
	<!-- ${fruitList} 영역 지정 안 했으니까 page부터 순차적으로 찾는다.  -->
	<!-- items를 하나씩 끄집어내서 fruitStr에 집어넣는다.  -->
	<c:forEach var="fruitStr" begin="2" end="4" items="${fruitList}" varStatus="stat" >
		${stat.count}, ${stat.index } => ${fruitStr }&nbsp;&nbsp; <br />
	</c:forEach>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>