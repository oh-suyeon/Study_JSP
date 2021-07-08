<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>LOGIN</title>
<style type="text/css">
	table, tr, td {
/* 		border: 1px solid silver; */
	}
	table {
		width: 100%; 
	}
	table, td {
		border-collapse: collapse;
	}

</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
	<table>
		<colgroup>
			<col style="width:130px;">
			<col style="width:auto;">
		</colgroup>
		<tbody>
			<tr> 
				<td colspan="2">
					<jsp:include page="/chapter09/company/top.jsp" />
				</td>
			</tr>
			<tr style="height: 600px;"> 
				<td style="border-right: solid 1px silver; ">
					<jsp:include page="/chapter09/company/left.jsp" />
				</td>
				<td>
					<!-- content start -->
					<div class="container">
						<form action="/chapter09/company/loginProcess.jsp" method="post" class="form-horizontal" >
							<div style="width: 300px; height: 300px;">
								<div class="form-group text-center" > 
									<label class="col-sm-4 control-label">아이디 :</label>
									<div class="col-sm-8"> 
										<input type="text" name="id" class="form-control form-inline"/>
									</div>
								</div>
								<div class="form-group text-center"> 
									<label class="col-sm-4 control-label">비밀번호 :</label>
									<div class="col-sm-8"> 
										<input type="password" name="password" class="form-control form-inline"/>
									</div>
								</div>
								<div class="text-right">
									 <button type="submit" class="btn btn-success">로그인</button>
								</div>
							</div>
						</form>
					</div>
					<!-- content end -->
				</td>
			</tr>
			<tr> 
				<td colspan="2">
					<jsp:include page="/chapter09/company/bottom.jsp" />
				</td>
			</tr>
		</tbody>
	</table>
</body>
</html>