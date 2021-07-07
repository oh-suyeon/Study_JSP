<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>구구단</title>
<style type="text/css">
	table, td, th{
		border: 1px solid gray;
		border-collapse: collapse;
		text-align: center;
	}
	table {
		width : 60%;
 		line-height : 50px; 
	}
	th {
		background-color : silver;
	}
	
</style>
</head>
<body>
<% 	
	String thStr = "<tr>";
	for(int i=2; i<=9; i++){
		thStr += "<th>" + i + " 단" + "</th>";
	}
	thStr += "</tr>";
%>
<%	
	String tdStr = "";
	for(int i=1; i<=9; i++){
		tdStr += "<tr>";
		
		for(int j=2; j<=9; j++){
			tdStr += "<td>" + j + " * " + i +  " = " + (i*j) + "</td>";
		}
		
		tdStr += "</tr>";
	}
%>
	<table>
		<thead>
			<%=thStr %>
		</thead>
		<tbody>
			<%=tdStr %>
		</tbody>
	</table>
</body>
</html>