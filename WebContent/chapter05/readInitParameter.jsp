<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
	<h2>초기화 파라미터 목록</h2>
	<%
		Enumeration<String> initParamEnum = application.getInitParameterNames();
		
		while(initParamEnum.hasMoreElements()){
			String initParamName = initParamEnum.nextElement();
			out.print(initParamName + "=" + application.getInitParameter(initParamName) + "<br />");
		}
	%>
	<h2>서버 정보</h2>
	서버 정보 : <%= application.getServerInfo()  %> <br />
	서버 규약 메이저 버전 : <%= application.getMajorVersion()  %> <br /> <!-- 서블릿 3.1 버전을 사용하고 있다는 뜻 -->
	서버 규약 마이너 버전 : <%= application.getMinorVersion()  %> <br />
	
	<%
		// [톰캣 설치 폴더]\logs폴더 안으로 들어간다. 
		application.log("(오수연) 로그 메시지 기록");
	%>	
</body>
</html>