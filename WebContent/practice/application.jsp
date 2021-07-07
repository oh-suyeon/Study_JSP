<%@page import="java.io.InputStream"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.net.URL"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Application 객체 활용</title>
</head>
<body>
	<h3>web.xml의 환경 정보 출력</h3>
<%
	Enumeration<String> enumName = application.getInitParameterNames();

	while(enumName.hasMoreElements()){
		String name = enumName.nextElement();
		
		out.print(name + " : " + application.getInitParameter(name) + "<br/>");
	}

%>
	<hr>
	<h3>로그 찍기</h3>
<%
	application.log("로그 찍기");
%>

	<hr>
	<h3>파일 읽기 1</h3>
<%
	String resourcePath = "/chapter05/message/poem.txt";
	
	char[] buff = new char[128];
	int len = -1;
	
	try{
		InputStreamReader reader = new InputStreamReader(application.getResourceAsStream(resourcePath), "UTF-8");
		
		while((len=reader.read(buff)) != -1){
			out.print(new String(buff, 0, len));
		}
	}catch(IOException e){
		out.print(e.getMessage());
	}
	
	

%>

	<hr>
	<h3>파일 읽기 2</h3>
<%
	String sourcePath2 = "/chapter05/message/notice.txt";
	
	URL url = application.getResource(sourcePath2);

	char[] buff2 = new char[128];
	int len2 = -1;
	
	InputStream stream = url.openStream();
	
	try{
		InputStreamReader reader2 = new InputStreamReader(stream, "UTF-8");
		
		while((len2 = reader2.read(buff2)) != -1){
			out.print(new String(buff2, 0, len2));	
		}
		
	}catch(IOException e2){
		out.print(e2.getMessage());
	}
	
	
%>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>