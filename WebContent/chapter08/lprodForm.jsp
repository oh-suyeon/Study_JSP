<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>상품 분류 정보 입력</title>
</head>
<body>
	<form name="frm" action="/chapter08/lprodJoining.jsp" method="post">
		<table border="1" style="width: 50%;">
			<tr> 
				<th>상품분류아이디</th> 
				<td>
					<input type="text" name="lprodId" placeholder="상품분류아이디를 입력해주세요." style="width: 80%;">  
				</td>
			</tr>
			<tr> 
				<th>상품분류코드</th> 
				<td>
					<input type="text" name="lprodGu" placeholder="상품분류코드를 입력해주세요." style="width: 80%;">  
				</td>
			</tr>
			<tr> 
				<th>상품분류명</th> 
				<td>
					<input type="text" name="lprodNm" placeholder="상품분류명를 입력해주세요." style="width: 80%;">  
				</td>
			</tr>
			<tr> 
				<td colspan="2" style="text-align: center;">
					<input type="submit" value="추가">
				</td>
			</tr>
		</table>
	
	</form>
</body>
</html>