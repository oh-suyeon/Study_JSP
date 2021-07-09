<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>INFO</title>
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
					<div style="text-align: center">
						<img alt="home image" src="/chapter09/company/images/info.gif" style="width: 80%;">
					</div>
					<div style="padding: 50px 100px; text-align: center">
						<h4>
							<span style="color:DodgerBlue; font-weight: bolder;">Google</span>검색에 대한<span style="color:DodgerBlue; font-weight: bolder;"> Google</span>의 접근방식
						</h4>
						<p>
							전 세계의 사용자는 Google 검색을 통해 정보를 찾고 관심분야를 배우고 중요한 결정을 내립니다. 사용자의 믿음에 보답할 수 있도록 Google은 끊임없이 노력할 것입니다. 기술이 발전함에 따라 앞으로도 모든 사용자가 원하는 정보를 찾을 수 있도록 지원하겠습니다. Google 검색은 다음과 같은 기능을 해야 합니다.
						</p>
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