<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>상품 등록</title>
</head>
<body>
	<form action="/chapter14/assignment/insert.jsp" method="post">
		<table border="1" style="width: 100%;">
			<tr>
				<th>번호</th>
				<td>
					<input type="text" name="lprodId">
				</td>
			</tr>
			<tr>
				<th>구분</th>
				<td>
					<input type="text" name="lprodGu">
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="lprodNm">
				</td>
			</tr>
		</table>
		<button type="submit">등록</button>
	</form>
	<a href="/chapter14/assignment/viewLprodList.jsp">목록으로 돌아가기</a>
</body>
</html>