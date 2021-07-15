<%@page import="chapter15.service.WriteMessageService"%>
<%@page import="chapter15.vo.Message"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");

	String guestName = request.getParameter("guestName");
	String password = request.getParameter("password");
	String message = request.getParameter("message");
	
	out.print("gusetName : " + guestName + " <br /> password : " + password + " <br /> message : " + message + "<br />");
	
	Message messageVo = new Message();
	messageVo.setGuestName(guestName);
	messageVo.setPassword(password);
	messageVo.setMessage(message);
	
	WriteMessageService writeService = WriteMessageService.getInstance();
	int insertCount = writeService.write(messageVo);
%>
<!DOCTYPE html>
<html>
<head>
<title>방명록 메시지 남김</title>
</head>
<body>
<%
	if (insertCount > 0){
		out.print("방명록에 메시지를 남겼습니다. <br />");
	}else {
		out.print("방명록에 메시지를 남기지 못했습니다. <br />");
	}
%>
	<a href="/chapter15/list.jsp">[목록보기]</a>
</body>
</html>