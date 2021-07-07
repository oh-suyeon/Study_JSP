<%@page import="java.io.InputStream"%>
<%@page import="java.net.URL"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.InputStreamReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>application기본 객체 사용해 자원 읽기</title>
</head>
<body>
	<%
		String resourcePath = "/chapter05/message/notice.txt"; 
	%>
	자원 실제 경로 <br />
	<%
		// 상대 경로를 파라미터로 넣으면 절대 경로를 반환
		out.print(application.getRealPath(resourcePath)); 
	%>
	---------------------------<br/>
	<%
		char[] buff = new char[128];
		int len = -1;
		//getResource의 기준점은 webContent 이니까 상대 경로 설정 잘 해야 함.
		URL url = application.getResource(resourcePath);
		
		try {
			// new FileInputStream(filePath) -> realPath(절대경로)
// 			InputStreamReader br = new InputStreamReader( -> 상대경로
// 						url.openStream(), "UTF-8"
			InputStreamReader br = new InputStreamReader(
						application.getResourceAsStream(resourcePath), "UTF-8"); // 상대경로 
			while((len=br.read(buff))!=-1){
				out.print(new String(buff, 0, len));
			}
		}catch(Exception e){
			out.print("예외 발생 : " + e.getMessage());
		}
		
	%>
	
</body>
</html>