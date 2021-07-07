<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>캘린더</title>
<script>
	function fn_chg(obj) {
		var day = obj.value;
		
		// 랜덤한 색깔 넣기 0~255
		var r = parseInt(Math.random() * 256);
		var g = parseInt(Math.random() * 256);
		var b = parseInt(Math.random() * 256);
		
		location.href = "<%=request.getRequestURI()%>?dd=" + day + "&r=" + r + "&g=" + g + "&b=" + b;
	}
</script> 
<%
	// 색깔
	String r = request.getParameter("r")==null?"200":request.getParameter("r");
	String g = request.getParameter("g")==null?"200":request.getParameter("g");
	String b = request.getParameter("b")==null?"200":request.getParameter("b");
%>
</head>
<body>
	<select name="sel" id="id" onchange="fn_chg(this);">
		<%
			int dd = Integer.parseInt(request.getParameter("dd")==null?"1":request.getParameter("dd"));
			
			for(int i=1; i<=31; i++){
				out.print("<option value='"+ i +"'");
				if(i==dd){
					out.print("selected='selected'");
				}
				out.print(">" + i + "일</option>");
			}
		%>
	</select>
	
	<br />
	
	<table border="1" style="width: 50%;">
		<tr>
			<th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th>
		</tr>
		<tr>
			<%for(int i=1; i<=35; i++){ 
				if(i>31){
					out.print("<td></td>");
				}else{
					out.print("<td");
					if(i==dd){
						out.print(" style='background-color:rgb("+ r + "," + g + "," +  b +"); color:rgb("+ g + "," + r + "," +  b +");'");
					}
					out.print(">" + i + "</td>");
				}
				
				if(i%7==0){
					out.print("</tr><tr>");
				}
			  } 
			%>
		</tr>
	 
	</table>
	
	<br />
	
	<table border="1" style="width: 50%;">
		<tr>
			<th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th>
		</tr>
		<tr>
			<%	
				int blank = 7;
				for(int i=1; i<=31; i++){ 
						out.print("<td");
						if(i==dd){
							out.print(" style='background-color:rgb("+ r + "," + g + "," +  b +"); color:rgb("+ g + "," + r + "," +  b +");'");
						}
						out.print(">" + i + "</td>");
						
						blank--;
					if(i%7==0){
						out.print("</tr><tr>");
						blank= 7;
					}
				}
				for(int j=0; j<blank; j++){
					out.print("<td></td>");
				}
			%>
		</tr>
	 
	</table>
</body>
</html>