<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="chapter12.vo.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%
	ArrayList<String> list = new ArrayList<>();
	list.add("blue");
	list.add("green");
	list.add("yellow");
	list.add("red");
	list.add("orange");
%>
<%	
	pageContext.setAttribute("colorList", list);
	
	List<MemberVO> memberList = new ArrayList<MemberVO>(); 
	memberList.add(new MemberVO("a001","김은대"));
	memberList.add(new MemberVO("b001","이쁘니"));
	memberList.add(new MemberVO("c001","신용환"));
	memberList.add(new MemberVO("d001","이석호"));
	memberList.add(new MemberVO("e001","김지수"));
	
	request.setAttribute("memberList", memberList);
%>
<!DOCTYPE html>
<html>
<head>
<title>중요한 foreach문 연습2</title>
</head>
<body>
	
	<!-- list 배열 출력. 글자에 해당 색상 넣기 -->
	<c:forEach var="colorStr" items="${colorList }" varStatus="stat">
		<span style="color: ${colorStr}">${colorStr}</span> <br/>
	</c:forEach>
	
	<!-- 이런 형태로 정말 많이 사용한다! -->
	<c:forEach var="memStr" items="${memberList }">
		${memStr.memNo } : ${memStr.memName } <br />
	</c:forEach>
	
	<h2>콤마와 점을 구분자로 사용하여 반복</h2>
	<c:forTokens var="token" items="빨강,주황,노랑.초록.파랑,보라" delims=",.">
		${token }<br />
	</c:forTokens>
</body>
</html>