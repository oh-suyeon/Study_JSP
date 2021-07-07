<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	String danStr = request.getParameter("dan")==null?"2":request.getParameter("dan");
	int danInt = Integer.parseInt(danStr);
%>
<!DOCTYPE html>
<html>
<head>
<title>구구단 출력</title>

<script type="text/javascript">
	
	function fn_chg(getObj) {
		var varDan = getObj.value;
		location.href="<%=request.getRequestURI()%>?dan=" + varDan;
	}
	
</script>

</head>
<body>

<select id="sel" name="sel" onchange="fn_chg(this);">
<%for(int dan=2; dan<=9; dan++){ %>
	<option value="<%=dan%>" <%if(dan==danInt){out.print("selected='selected'");} %>>
		<%=dan%>단
	</option> 
<%} %>
</select>
<table border="1" style="width:30%;"> 
<%for(int i=1; i<=9; i++){ %>
	<tr> 
		<td><%out.print(danInt + "x" + i + "=" + (danInt * i));%></td>
	</tr>
<%} %>
</table>

</body>
</html>