<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<% 
	Map<String, Object> map = (Map<String, Object>) session.getAttribute("map");
	String title = (String) map.get("title");
	String content = (String) map.get("content");
%>
<!DOCTYPE html>
<html>
<head>
<title>상세보기</title>
<script type="text/javascript">
	function fn_list() {
		location.href="/chapter07/freeboard.jsp?currentPage=1";
	}	
</script>
</head>
<body>
	<table border="1" style="width: 100%" cellpadding="0" cellspacing="0">
		<tr>
			<td colspan="2">
				<jsp:include page="/module/top.jsp" flush="false" />
			</td>
		</tr>
		<tr>
			<td style="width:30%;" valign="top">
				<jsp:include page="/module/left.jsp" flush="false" />
			</td>
			<td>
				<!-- 내용부분 : 시작 -->
				<form action="/chapter07/freeboardreg.jsp" method="post">
					<p> 
						제목 : <br /> <input type="text" name="title" placeholder="제목을 입력해주세요." value="<%=title %>"/>
					</p>				
					<p> 
						내용 : <br /> <textarea name="content" rows="5" cols="30"><%=content %></textarea>
					</p>				
					<input type="button" value="목록" onclick="fn_list();" /> 
				</form>
				<!-- 내용부분 : 끝 -->
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<jsp:include page="/module/bottom.jsp" />
			</td>
		</tr>
	</table>
</body>
</html>