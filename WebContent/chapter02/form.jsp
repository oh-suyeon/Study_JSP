<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>폼 생성</title>
</head>
<body>
	<form action="/chapter02/viewParameter.jsp" method="post">
		이름 : <input type="text" name="name" size="10"/> <br>
		주소 : <input type="text" name="address" size="30"/> <br>
		좋아하는 동물 :
		<input type="checkbox" name="pet" value="camel" id="camel"/>
			<label for="camel">낙타</label>
		<input type="checkbox" name="pet" value="cat" id="cat"/>
			<label for="cat">고양이</label>
		<input type="checkbox" name="pet" value="dog" id="dog"/>
			<label for="dog">강아지</label>
		<input type="checkbox" name="pet" value="fox" id="fox"/>
			<label for="fox">여우</label>
		<button type="submit" value="전송">전송</button>
	</form>
</body>
</html>