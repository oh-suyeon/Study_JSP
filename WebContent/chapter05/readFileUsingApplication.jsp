<%@page import="java.net.URL"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.FileInputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>application 기본 객체를 사용하여 자원 읽기</title>
</head>
<body>
<%
	String resourcePath = "/chapter05/message/notice.txt";
%>
	자원의 실제 경로<br>
<%
	out.print(application.getRealPath(resourcePath));
%>
	<br>---------------------------------------------<br>
<%
	char[] buff = new char[128];
	int len = -1;
	URL url = application.getResource(resourcePath);
	
	try {
		
		//new FileInputStream(resourcePath) <-- realPath 절대 경로
		//InputStreamReader br = new InputStreamReader(new FileInputStream(resourcePath), "UTF-8");
				
		//어플리케이션으로 파일 읽기, 상대 경로
		InputStreamReader br = new InputStreamReader(application.getResourceAsStream(resourcePath), "UTF-8");
		
		//상대 경로
// 		InputStreamReader br = new InputStreamReader(url.openStream(), "UTF-8");
		
		while((len=br.read(buff))!=-1) {
			out.print(new String(buff, 0, len));
		}
		
	}catch(IOException ex) {
		out.print("Exception 발생 : " + ex.getMessage());
	}
	
	
%>
	

</body>
</html>