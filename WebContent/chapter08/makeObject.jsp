<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="member" scope="request" class="chapter08.member.MemberInfo" />
<%
	// jsp : useBean 액션 태그의 id 속성에 지정한 이름을 변수명으로 사용함
	member.setId("ddit");
	member.setName("개똥이"); // 객체에 값을 저장
%> 
<!--  useObject.jsp 페이지로 요청 흐름을 이동시킴. 톰캣 서버에서 요청하는것. -->
<!-- 결과적으로 두번 요청 -->
<jsp:forward page="/chapter08/useObject.jsp" />