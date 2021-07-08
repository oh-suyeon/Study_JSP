<%@page import="util.Cookies"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
상단 메뉴 : 
<a href="/chapter07/layout.jsp">홈</a>&nbsp;
<a href="/chapter07/info.jsp">정보</a>&nbsp;
&nbsp;&nbsp;&nbsp;
<%
	Cookies cookies = new Cookies(request);
	
	Cookie cookie = cookies.getCookie("id");
	if (cookies.exists("id")){
		out.print(cookies.getValue("id") + "님. 환영합니다.");
		out.print("<input type='button' value='로그아웃' onclick='fn_logout();'>");
	}else{
		out.print("<input type='button' value='로그인' onclick='fn_login();'>");
	}
%>
<script>
	function fn_logout() {
		location.href="/chapter09/logout.jsp";
	}
	function fn_login() {
		location.href="/chapter07/login.jsp";
	}
</script>