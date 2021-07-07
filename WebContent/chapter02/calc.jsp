<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	
	public int add(int a, int b){
		return (a + b);
	}
	public int subtract(int a, int b){
		return (a - b);
	}
	public int multiple(int a, int b){
		return (a * b);
	}
	public double division(double a, double b){
		return (a / b);
	}

%>
<%
	String resultStr = "0";
	int answer = 0;
	double answer2 = 0.0;
	
	// request객체. 브라우저가 꺼질 때까지 데이터를 저장.
	// 처음 url을 요청하면 a, b, sik이 null. null처리해주기.
	int a = Integer.parseInt(request.getParameter("a")==null?"0":request.getParameter("a"));
	int b = Integer.parseInt(request.getParameter("b")==null?"0":request.getParameter("b"));
	String sik = request.getParameter("sik")==null?"+":request.getParameter("sik");
	
	if(sik.equals("+")){
		answer = add(a, b);
	}else if(sik.equals("-")){
		answer = subtract(a, b);
	}else if(sik.equals("*")){
		answer = multiple(a, b);
	}else{
		answer2 = division((double)a, (double)b);
	}
	
	if(answer != 0){
		resultStr = a + " " + sik + " " + b + " = " + answer;
	}
	if(answer2 != 0){
		resultStr = a + " " + sik + " " + b + " = " + answer2;
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>계산기</title>
<style type="text/css">
	table, tr, td {
		border: 1px lightblue solid; 
		border-collapse: collapse;
		backgroud-color: lightblue;
	}
	table {
		width: 200px;
		height: 300px;  
	}
	td {
		text-align: center;
		background-color: lightblue;
	}
	button {
		width: 100%;
		height: 100%;
		font-weight: bold;
		font-size: 1.2em;
		background-color: aliceBlue;
		border : solid 1px skyblue;
	}
	button:hover {
		border : solid 1px aliceBlue;
		background-color: lightblue;
	}
	button:active {
		background-color: skyblue;
	}
	#result {
		border : none;
		height: 80%;
		width : 90%;
		text-align: right;
	}
</style>

<script type="text/javascript">
	
	// input에 데이터 넣기
	function fncA(getA, getB) {
		
		// 숫자
		var varA = document.getElementById("a");
		var varB = document.getElementById("b");
		if(varA.value==""){
			if(getB=="0"){
				varA.value = getA;
			}
		}else{
			if(getB=="0"){
				varB.value = getA;
			}
		}
		
		// 연산자
		var varSik = document.getElementById("sik");
		if(getB=="1"){
			varSik.value = getA;
		}
		
		// 입력하는 값 보여주기
		var result = document.getElementById("result").value;
		if(result == 0){
			result =  "";	
		}
		result += getA + " ";
		document.getElementById("result").value = result;
	}
	
	// submit 전 input에 빈칸이 있나 체크
	function fn_chk() {
		var varA = document.getElementById("a");
		var varB = document.getElementById("b");
		var varSik = document.getElementById("sik");
		
		if(varA.value=="" || varB.value=="" || varSik.value==""){
			alert("값을 모두 입력해주세요.");
			return false;
		}
		return true; //submit 실행 -> http://localhost:8090/chapter02/calc.jsp?a=6&sik=-&b=3
	}
	
	// 결과 값 초기화
	function fncReset() {
		$("#result").val(0);
	}
</script>

</head>
<body>

	<!-- 다시 페이지를 요청할 것 -->
	<!-- onsubmit으로 name갖고 있는 요소들에 빈값이 있는지 체크 -->
	<!-- return fn_chk(); -->
	<form name="frm" id="frm" method="get" action="/chapter02/calc.jsp" onsubmit="return fn_chk();">  
	
		<input type="hidden" name="a" id="a" value="">
		<input type="hidden" name="sik" id="sik" value="">
		<input type="hidden" name="b" id="b" value=""> 
		
		<br>
		
		<table>
			<tr>
				<td colspan="4"><input type="text" id="result" value="<%=resultStr %>"></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td><button type="button" onclick="fncReset();">c</button></td>
				<td><button type="button" onclick="fncA('/', '1');">/</button></td>
			</tr>
			<tr>
				<td><button type="button" onclick="fncA('7', '0');">7</button></td>
				<td><button type="button" onclick="fncA('8', '0');">8</button></td>
				<td><button type="button" onclick="fncA('9', '0');">9</button></td>
				<td><button type="button" onclick="fncA('*', '1');">*</button></td>
			</tr>
			<tr>
				<td><button type="button" onclick="fncA('4', '0');">4</button></td>
				<td><button type="button" onclick="fncA('5', '0');">5</button></td>
				<td><button type="button" onclick="fncA('6', '0');">6</button></td>
				<td><button type="button" onclick="fncA('-', '1');">-</button></td>
			</tr>
			<tr>
				<td><button type="button" onclick="fncA('1', '0');">1</button></td>
				<td><button type="button" onclick="fncA('2', '0');">2</button></td>
				<td><button type="button" onclick="fncA('3', '0');">3</button></td>
				<td><button type="button" onclick="fncA('+', '1');">+</button></td>
			</tr>
			<tr>
				<td></td>
				<td><button type="button" onclick="fncA('0', '0');">0</button></td>
				<td></td>
				<td><button type="submit" value="=">=</button></td>
			</tr>
		</table>
	</form>	
</body>
</html>