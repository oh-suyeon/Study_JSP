<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	String memId = request.getParameter("memId")==null?"":request.getParameter("memId");
	String memGu = request.getParameter("memGu")==null?"":request.getParameter("memGu");
	String memAge = request.getParameter("memAge")==null?"":request.getParameter("memAge");
	
	if(memGu.equals("f")){
		memGu = "여자";
	}else if(memGu.equals("m")){
		memGu = "남자";
	}
%>
<%
	// 세션으로 주고 받기 (인코딩은 request.setCharacterEncoding("UTF-8");에서 해결된다)
	session.setAttribute("memId", memId);
	session.setAttribute("memGu", memGu);
	session.setAttribute("memAge", memAge);
%>
<%
	String msg = request.getParameter("msg")==null?"":request.getParameter("msg");
	
	if(msg.equals("y")){
		String url = "?memId=" + memId + "&memGu=" + URLEncoder.encode(memGu, "UTF-8") + "&memAge=" + memAge;
		response.sendRedirect(request.getContextPath() + "/practice/registOk2.jsp" + url);
	}
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>회원가입 성공</title>

<script type="text/javascript">
	function redirect() {
		if(confirm("재확인하시겠습니까?")){
			location.href = "<%=request.getRequestURL()%>?msg=y" 
						  + "&memId=" + $('#memId').val() + "&memGu=" + $('#memGu').val() + "&memAge=" + $('#memAge').val();
		}
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
		
		<h3 class="text-center">회원가입 성공!</h3> 
		
		<form name="frm" id="frm" method="post" class="form-horizontal" action="<%=request.getContextPath() %>/practice/registOk2.jsp">
			
			<div class="form-group"> 
				<label class="col-sm-4 control-label">아이디 :</label>
				<div class="col-sm-5"> 
					<input type="text" id="memId" name="memId" value="<%=memId%>" class="form-control form-inline" readonly="readonly"/>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-4 control-label">성별 :</label> 
				<div class="col-sm-5"> 
					<input type="text" id="memGu" name="memGu" value="<%=memGu%>" class="form-control form-inline" readonly="readonly"/>
				</div>
			</div>
			
			<div class="form-group"> 
				<label class="col-sm-4 control-label">나이 :</label>
				<div class="col-sm-5"> 
					<input type="text" id="memAge" name="memAge" value="<%=memAge%>" class="form-control form-inline" readonly="readonly"/>
				</div>
			</div>
			
			<div class="text-center btnDiv">
				 <button type="button" onclick="redirect();" class="btn btn-info">재확인</button>
			</div>
		</form>
	</div>
</body>
</html>