<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	String optionStr = "";
	for(int i=21; i<=50; i++){
		optionStr += "<option value='"+ i + "'>" + i + "</option>";
	}
%>
<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>
</head>
<body>
<!-- registOk.jsp에서 파라미터를 받아 출력해보자. (한글처리까지) -->
<!-- 출력 후에 registOk2.jsp로 redirect하여 결과를 한번더 출력해보자. -->
	<form name="frm" id="frm" method="post">
		아이디 : <input type="text" id="memId" name="memId" /><br />
		이름 : <input type="text" id="memName" name="memName" /><br />
		성별 : <input type="radio" id="memGuF" name="memGu" checked/><label for="memGuF">여자</label>
			 <input type="radio" id="memGuM" name="memGu" /><label for="memGuM">남자</label><br />
		나이 : <select name="memAge" id="memAge">
				<%=optionStr %>
			 </select>
	</form>

</body>
</html>