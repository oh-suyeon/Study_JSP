<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page errorPage="/error/viewErrorMessage.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>파라미터 출력</title>
</head>
<body>
	
	name 파라미터 값 : 
	
	<%
// 		try{
			out.print(request.getParameter("name").toUpperCase()); 
// 		}catch(Exception e){
// 			out.print("name 파라미터가 올바르지 않습니다.");
// 		}
	%>
	
	
</body>
</html>