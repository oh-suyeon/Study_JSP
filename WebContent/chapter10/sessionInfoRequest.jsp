<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	HttpSession httpSession = request.getSession();
	
	// 또 다른 방식 시작
	List<String> list2 = new ArrayList<>();
	list2.add("사과");
	list2.add("배");
	list2.add("오렌지");
	
	httpSession.setAttribute("list2", list2);
	// 또 다른 방식 종료

	List<String> list = null;
	
	// request.getSession() : 현재 요청과 관련된 session 객체를 리턴함.
	if(httpSession!=null){
		list = (List<String>)httpSession.getAttribute("list");
		for(int i=0; i<list.size(); i++){
			out.print(list.get(i));
		}
	}else{
		list = Collections.emptyList();
	}
%>
<!DOCTYPE html>
<html>
<head>
<title>request 객체를 이용한 세션 관리</title>
</head>
<body>
	
</body>
</html>