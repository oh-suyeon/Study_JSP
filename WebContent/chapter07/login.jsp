<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>HOME</title>
</head>
<body>
	<table border="1" style="width: 100%" cellpadding="0" cellspacing="0">
		<tr>
			<td colspan="2">
				<jsp:include page="/module/top.jsp" flush="false" />
			</td>
		</tr>
		<tr>
			<td style="width:30%;" valign="top">
				<jsp:include page="/module/left.jsp" flush="false" />
			</td>
			<td>
				<!-- 내용부분 : 시작 -->
				<jsp:include page="/chapter09/loginForm.jsp" flush="false" />
				<!-- 내용부분 : 끝 -->
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<jsp:include page="/module/bottom.jsp" />
			</td>
		</tr>
	</table>
</body>
</html>