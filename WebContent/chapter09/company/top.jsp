<%@page import="java.net.URLDecoder"%>
<%@page import="util.Cookies"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>top</title>
<style type="text/css">
	a {
		color : gray;
		font-weight : bolder;
		text-decoration: none;
	}
	a:visited {
		color : gray;
	}
	a:hover {
		color : silver;
	}
	.noborder {
		border: 0px solid;
	}
</style>
</head>
<body>
	
	<table class="noborder borderBottom" style="width: 100%; border-bottom: 1px solid silver; text-align: center;">
		<colgroup>
			<col style="width:15%;">
			<col style="width:15%;">
			<col style="width:15%;">
			<col style="width:55%;">
		</colgroup>
		<tbody>
		<tr class="noborder" style="padding: 10px 0px;">
			<td class="noborder" style="padding: 10px 10px;">
				<a href="/chapter09/company/main.jsp">
					<img alt="logo" src="/chapter09/company/images/logo.png" style="height: 30px;">
				</a>
			</td>
			<td class="noborder" >
				<a href="/chapter09/company/main.jsp">HOME</a>
			</td>
			<td class="noborder" >
				<a href="/chapter09/company/info.jsp">INFO</a>
			</td>
			<td style="text-align: right; padding-right:10px;" class="noborder">
			<%
				Cookies cookies = new Cookies(request);
				String id = "";
				String name = "";
				if(cookies.exists("id")){
					Cookie cookie1 = cookies.getCookie("id");
					id = cookie1.getValue();
					Cookie cookie2 = cookies.getCookie("name");
					name = URLDecoder.decode(cookie2.getValue());
			%>
					<%=id %>(<%=name %>)님 좋은 하루 되세요
					<button type="button" class="btn btn-info" onclick="location.href='/chapter09/company/logout.jsp'">로그아웃</button>
			<%
				}else{
			%>
					<button type="button" class="btn btn-info" onclick="location.href='/chapter09/company/login.jsp'">로그인</button>
			<%
				}
			%>
				
			</td>
		</tr>	
		</tbody>
	</table>
</body>
</html>