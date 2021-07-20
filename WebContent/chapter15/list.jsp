<%@page import="chapter15.service.MessageListView"%>
<%@page import="chapter15.vo.Message"%>
<%@page import="java.util.List"%>
<%@page import="chapter15.service.GetMessageListService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	int pageNum = Integer.parseInt(request.getParameter("pageNum")==null?"1":request.getParameter("pageNum"));
	
	GetMessageListService messageListService = GetMessageListService.getInstance();
// 	List<Message> list = messageListService.getMessageList();
	
	// MessageListView: 페이징 처리 전용 클래스 
	MessageListView list = messageListService.getMessageList(pageNum);
%>

<c:set var="list" value="<%=list %>" />

<!DOCTYPE html>
<html>
<head>
<title>방명록 목록</title>
</head>
<body>
	<form action="./writeMessage.jsp" method="post">
		이름 : <input type="text" name="guestName" /><br />
		비밀번호 : <input type="password" name="password" /><br />
		메시지 : <textarea rows="3" cols="30" name="message"></textarea><br />
		<input type="submit" value="메시지 남기기" />
	</form>
	
	<hr />
	
	<table border="1" style="width: 100%;">
	<c:forEach var="message" items="${list.messageList}"> 
		<tr>
			<td>
				메시지 번호 : ${message.messageId} <br />
				손님 이름 : ${message.guestName} <br />
				메시지 : ${message.message}<br />
				<a href="./confirmDeletion.jsp?messageId=${message.messageId}">[삭제하기]</a>
			</td>
		</tr>
	</c:forEach>
	</table>
	<c:forEach var="pageNum" begin="1" end="${list.pageTotalCount}">
		<a href="list.jsp?pageNum=${pageNum}">[${pageNum }]</a> 
	</c:forEach>
</body>
</html>

