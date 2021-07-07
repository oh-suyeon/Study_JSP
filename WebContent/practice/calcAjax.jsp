<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	function ajaxSubmit() {
		// 빈값인지 확인하기
		if(!fn_chk()){
			return;
		}
		
		// ajax로 form 보내서, data받아 result에 넣기
		$.ajax({
			url: "/practice/calcAjaxResult.jsp"
			,data: $("#frm").serialize()
			,type: "GET"
			,dataType: "text"
			,success : function(data) {
				console.log(data);
				$("#result").val(data);
			}
			,error : function(xhr) {
				console.log(xhr);
			}
		});
		
	}
	
	// input에 데이터 넣기
	function fncA(getA, getB) {
		
		// 숫자
		var varA = $("#a");
		var varB = $("#b");
		if($(varA).val()==""){
			if(getB=="0"){
				$(varA).val(getA);	
			}
		}else{
			if(getB=="0"){
				$(varB).val(getA);	
			}
		}
		
		// 연산자
		var varSik = $("#sik");
		if(getB=="1"){
			$(varSik).val(getA);
		}
		
		// 입력하는 값 보여주기
		if($("#result").val() == '0'){
			$("#result").val("");	
		}
		var resultStr = $("#result").val() 
		$("#result").val(resultStr + getA + " ");
	}
	
	// submit 전 input에 빈칸이 있나 체크
	function fn_chk() {
		
		if($("#a").val()=="" || $("#b").val()=="" || $("#sik").val()==""){
			alert("값을 모두 입력해주세요.");
			return false;
		}
		return true; 
	}
	
	// 결과 값 초기화
	function fncReset() {
		$("#result").val('0');
		$("#a").val("");
		$("#b").val("");
		$("#sik").val("");
	}
</script>

</head>
<body>

	<form name="frm" id="frm" method="get">  
	
		<input type="hidden" name="a" id="a" value="">
		<input type="hidden" name="sik" id="sik" value="">
		<input type="hidden" name="b" id="b" value=""> 
		
		<br>
		
		<table>
			<tr>
				<td colspan="4"><input type="text" id="result" value=""></td>
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
				<td><button type="button" value="=" onclick="ajaxSubmit();">=</button></td>
			</tr>
		</table>
	</form>	
</body>
</html>