<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>MAIN</title>
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
			<tr style="height: 600px;;"> 
				<td style="border-right: solid 1px silver; ">
					<jsp:include page="/chapter09/company/left.jsp" />
				</td>
				<td>
					<!-- content start -->
					<div style="text-align: center">
						<img alt="home image" src="/chapter09/company/images/home.gif" style="width: 80%;">
					</div>
					<div style="padding: 50px 100px; text-align: center">
						<h4>
							<span style="color:DodgerBlue; font-weight: bolder;">Google</span>의 목표는 전 세계의 정보를 체계화하여
						</h4>
						<h4>
							모두가 편리 하게 이용할 수 있도록 하는 것입니다
						</h4>
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