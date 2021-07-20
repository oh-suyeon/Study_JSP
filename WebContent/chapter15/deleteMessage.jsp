<%@page import="chapter15.service.InvalidPasswordException"%>
<%@page import="chapter15.service.DeleteMessageService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	int messageId = Integer.parseInt(request.getParameter("messageId"));
	String password = request.getParameter("password");
	int deleteCnt = 0;
	
	//flase = 오류없음
	boolean invalidPassword = false;
	
	try {
		DeleteMessageService deleteService = DeleteMessageService.getInstance();
		// 여기서 메시지가 없다거나 비밀번호가 틀렸다는 커스텀 예외가 발생하면 아래의 catch블럭에서 잡힌다.
		deleteCnt = deleteService.deleteMessage(messageId,password); 
	}catch(InvalidPasswordException ex){
		//true = 오류 발생
		invalidPassword = true;
	}
%>
<!DOCTYPE html>
<html>
<head>
<title>방명록 메시지 삭제완료</title>
</head>
<body>
<%
// 	if(deleteCnt>0){
// 		out.print("삭제되었습니다.<br />");
// 	}else{
// 		out.print("삭제되지 않았습니다.<br />");
// 	}
	
	//invalidPassword : false면 정상
	if(!invalidPassword){
		out.print("메시지를 삭제하였습니다. <br />");
	}else{ // 오류 발생. 특히 비밀번호가 매칭되지 않음
		out.print("입력한 비밀번호가 올바르지 않습니다. <br />");
	}
%>
<a href="./list.jsp">[목록 보기]</a>
</body>
</html>