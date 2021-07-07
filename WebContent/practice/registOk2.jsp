<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
// 	String memId = request.getParameter("memId")==null?"":request.getParameter("memId");
// 	String memGu = request.getParameter("memGu")==null?"":request.getParameter("memGu");
// 	String memAge = request.getParameter("memAge")==null?"":request.getParameter("memAge");
	
	String memId = (String) session.getAttribute("memId");
	String memGu = (String) session.getAttribute("memGu");
	String memAge = (String) session.getAttribute("memAge");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>회원가입 성공</title>

<script type="text/javascript">

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
		
		<h3 class="text-center">🎈🎈회원 정보🎈🎈</h3> 
			
			<div class="text-center"> 
				<h4> <%=memId%>님은 </h4>
				<h4> <%=memGu%>이고, </h4>
				<h4> <%=memAge%>세 입니다. </h4>
			</div>
			
	</div>
</body>
</html>