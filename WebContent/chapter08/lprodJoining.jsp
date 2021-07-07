<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="lprodVO" class="chapter08.lprod.LprodVO"/>
<jsp:setProperty property="*" name="lprodVO"/>
<!DOCTYPE html>
<html>
<head>
<title>상품 추가 완료</title>
</head>
<body>
	<table border="1" style="width: 50%;">
		<colgroup>
			<col style="width: 150px;">
			<col style="width: auto;">
		</colgroup>
		<tbody>
			<tr> 
				<th>상품분류아이디</th> 
				<td>
					<jsp:getProperty property="lprodId" name="lprodVO"/>
				</td>
			</tr>
			<tr> 
				<th>상품분류코드</th> 
				<td>
					<jsp:getProperty property="lprodGu" name="lprodVO"/>
				</td>
			</tr>
			<tr> 
				<th>상품분류명</th> 
				<td>
					<jsp:getProperty property="lprodNm" name="lprodVO"/>
				</td>
			</tr>
		</tbody>			
	</table>
</body>
</html>