<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	//읽어 오는 파라미터의 캐릭터 인코딩을 UTF-8로 지정
	request.setCharacterEncoding("UTF-8");
%>
<!-- MemberInfo 자바빈 클래스의 객체를 생성. -->
<jsp:useBean id="memberInfo" class="chapter08.member.MemberInfo" />
<!-- memberInfo 이름으로 저장(set). 그래서 form의 name이 중요함. 자바빈의 필드명과 같아야 함.  -->
<!-- 파라미터 값을 memberInfo 자바빈 객체의 프로퍼티 값으로 저장 -->
<!-- *는 모든 것. 클래스의 모든 필드. -->
<jsp:setProperty name="memberInfo" property="*" />
<%
	// 같은 의미. 하지만 하나씩 써야하니까 위의 것이 더 쉽다. 	
	memberInfo.setId(request.getParameter("id"));
	memberInfo.setName(request.getParameter("name"));
	memberInfo.setEmail(request.getParameter("email"));
%>
<!DOCTYPE html>
<html>
<head>
<title>회원 가입</title>
</head>
<body>
	<table border="1" style="width:80%;">
		<tr>
			<th>아이디</th>
			<td colspan="3">
				<%
				out.print(memberInfo.getId()); // 객체를 자바 소스에도 가져다 쓸 수 있다. 
				%> 
				<jsp:getProperty name="memberInfo" property="id" />
			</td>
		</tr>
		<tr>
			<th>이름</th>
			<td> 
				<%
				out.print(memberInfo.getName()); // 객체를 자바 소스에도 가져다 쓸 수 있다. 
				%> 
				<jsp:getProperty name="memberInfo" property="name" />
			</td>
			<th>이메일</th>
			<td> 
				<%
				out.print(memberInfo.getEmail()); // 객체를 자바 소스에도 가져다 쓸 수 있다. 
				%> 
				<jsp:getProperty name="memberInfo" property="email" />
			</td>
		</tr>
	</table>
</body>
</html>