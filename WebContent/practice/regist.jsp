<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");


	String optionStr = "<option>== 선택 ==</option>";
	for(int i=21; i<=50; i++){
		optionStr += "<option value='"+ i + "'>" + i + "</option>";
	}
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>회원가입</title>

<script type="text/javascript">
	
	function join() {
		
		if(!check()){
			alert("모든 정보를 입력해주세요.");
			return;
		}
		
		//registOk.jsp 로 전송하기
		$("#frm").submit();
		
	}
	
	function check() {
		if($("#memId").val() == "" || $("#memId").val() == null){
			return false;
		}
		if($("#memAge").val() == "" || $("#memAge").val() == null){
			return false;
		}
		return true;
	}

</script>

<style type="text/css">
	.container {
		padding: 0px 300px;
	}
	h3 {
		margin-bottom: 30px;
	}
	.radio-inline {
		margin-left: 15px;
	}
	.btnDiv {
		margin-top:30px;
	}
</style>

</head>
<body>
<!-- registOk.jsp에서 파라미터를 받아 출력해보자. (한글처리까지) -->
<!-- 출력 후에 registOk2.jsp로 redirect하여 결과를 한번더 출력해보자. -->
	<div class="container">
		
		<h3 class="text-center">회원가입 </h3> 
		
		<form name="frm" id="frm" method="post" class="form-horizontal" action="<%=request.getContextPath() %>/practice/registOk.jsp">
			
			<div class="form-group"> 
				<label class="col-sm-4 control-label">아이디 :</label>
				<div class="col-sm-5"> 
					<input type="text" id="memId" name="memId" class="form-control form-inline"/>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-4 control-label">성별 :</label> 
				<div class="radio-inline"> 
					<label for="memGuF">
					<input type="radio" id="memGuF" name="memGu" value="f" checked="checked"/>
					여자</label>
				</div>
				<div class="radio-inline">
					<label for="memGuM">
					<input type="radio" id="memGuM" value="m" name="memGu"/>
					남자</label>
				</div>
			</div>
			
			<div class="form-group"> 
				<label class="col-sm-4 control-label">나이 :</label>
				<div class="col-sm-3"> 
					<select class="form-control form-inline" name="memAge" id="memAge">
						<%=optionStr %>
					</select>
				</div>
			</div>
			
			<div class="text-center btnDiv">
				 <button type="button" onclick="join();" class="btn btn-info">가입</button>
			</div>
		</form>
	</div>
</body>
</html>