<%@page import="java.io.IOException"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStreamReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>절대 경로를 사용하여 자원 읽기</title>
</head>
<body>
	<%	
		String filePath = "D:\\A_TeachingMaterial\\6.JspSpring\\workspace\\dditServlet\\WebContent\\chapter05\\message\\notice.txt";
		
		char[] buff = new char[128]; // 128개 비트씩 잘라서 읽겠다. 임시공간. 
		
		int len = -1;
		
		try{
			// notice.txt에서 내용을 읽어오는 스트림(데이터 물줄기) 생성
			InputStreamReader fr = 
				new InputStreamReader(new FileInputStream(filePath), "UTF-8");
			
			// 읽어온 데이터를 out 객체 사용해 웹 브라우저에 출력
			while((len=fr.read(buff)) != -1){ // true일때만 들어간다. 길이가 -1이 되면 더 읽을 게 없다는 뜻. ex. 128, 128, 60, "-1"  
				//읽을 게 있을 경우 출력
				out.print(new String(buff, 0, len)); // 버퍼에 담긴 애를 0부터 그 길이까지 문자로 만들어서 읽을 것이다. 128->0~128, 60->0~60
			}
		}catch(IOException e){
			out.print("익셉션 발생 : " + e.getMessage());
		}
	%>
</body>
</html>