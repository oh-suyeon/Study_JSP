<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8" %>
<%
	request.setCharacterEncoding("UTF-8"); //크롬에서는 작동할 것. 그런데 익스플로러에서는 안될것.
	response.setContentType("text/html;charset=UTF-8");
	String name = request.getParameter("name")==null?"오류":request.getParameter("name");
%>
<!DOCTYPE html>
<html>
<head>
<title>파라미터 값의 인코딩/디코딩</title>
<script type="text/javascript">
	function goURL() {
		var varName = document.getElementById("name");
		var loc = "/chapter02/testEncoding.jsp?name=" + encodeURI(varName.value); //자바스크립트에서 한글처리
		location.href = loc;
	}
</script>
</head>
<body>
	<h2>파라미터 값의 인코딩/디코딩</h2>
	name : <%=name %> <!-- 자바스크립트에서 인코딩을 했으니, 자바에서 받을 때 디코딩해야함 -->
	<br />
	<input type="text" name="name" id="name" value="" placeholder="이름 입력" >	
	<button type="button" value="이동" onclick="goURL();">이동</button>
	<a href="/chapter02/testEncoding.jsp?name=<%=URLEncoder.encode(name, "UTF-8") %>">이동</a>
</body>
</html>