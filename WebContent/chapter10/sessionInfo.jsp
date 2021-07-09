<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	//long 타입 시간 값 저장하기 위해 사용
	Date time = new Date();
	//Date 객체의 시간 값을 지정한 양식으로 출력
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>
<!DOCTYPE html>
<html>
<head>
<title>세션 정보</title>
</head>
<body>
	세션 ID : <%=session.getId() %> <br />
	<%
		// 세션의 생성시간을 가져와서 Date 객체인 time에 저장
		// (1970년 1월 1일 이후 흘러간 시간. 1/1000초)
		time.setTime(session.getCreationTime());
	%>
	세션 생성 시간 : <%=formatter.format(time) %> <br />
	<%
		// 세션에 최근 접근한 시간
		time.setTime(session.getLastAccessedTime());
	%>
	최근 접근 시간 : <%=formatter.format(time) %> <br />
	<%
		String memberId = (String)session.getAttribute("MEMBERID");
		String memberName = (String)session.getAttribute("NAME");
		
		
		if(memberId != null){ // 로그인 되었으면
			out.print(memberName + "("+memberId+"님) 환영합니다.");
		%>
			<a href="/chapter10/closeSession.jsp">로그아웃</a>		
		<%
		}else{
		%>
			<a href="/chapter10/setMemberInfo.jsp">로그인</a>		
		<%
		}
	%>
</body>
</html>