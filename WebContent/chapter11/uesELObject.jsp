<%@page import="chapter11.vo.StudentVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setAttribute("name", "개똥이");
%>
<!DOCTYPE html>
<html>
<head>
<title>EL Object</title>
</head>
<body>
	<!-- 기존에 쓰던 방법 -->
	<!-- request 기본 객체의 name 속성의 값을 가져옴 -->
	<%=request.getAttribute("name") %> <br />
	
	<!-- request '영역'에 저장된 name 속성의 값을 가져옴 -->
	request객체의 name 속성 :
	${requestScope.name}<br />
	<!-- 이렇게 해도 나온다. -->
	${name}<br />
	
	요청 URI : 
	${pageContext.request.requestURI }<br />
	
	<!-- http://localhost:8090/chapter11/uesELObject.jsp?code=P101 -->
	<!-- code라는 파라미터 가져오기 -->
	<!-- 파라미터가 안 들어오더라도 500에러(null point)가 나지 않는다. -->
	<!-- 오류도 나지 않고, null을 출력하지 않는다. 아무것도 출력하지 않는다. -->
	code 파라미터 : 
	${param.code }
	
	<br />
	<br />
	1. EL 리터럴 표현식 <br />
	
	1) 문자열 : <br />
	${"apple"}<br />
	나는 ${'학교'}에 갑니다.<br /> 
	
	2) 숫자 : <br />
	맥날 아이스 아메리카노 가격은 ${1000}원 입니다. <br />
	파이는 ${3.14}이다. <br />
	
	3) boolean : <br />
	오늘 아침 식사를 하였나요? ${true} <br />
	
	4) null : <br />
	"${null }" (빈 문자열 whitespace)<br />
	
	2. 배열 <br />
	<%
	int[] intArr = new int[]{100,90,87,70,60};
	pageContext.setAttribute("jumsu", intArr);
	%>
	${jumsu[0] }<br />
	${jumsu[1] }<br />
	${jumsu[2] }<br />
	${jumsu[7] }<br /> <!-- out of index 에러가 나지 않는다. 값을 출력하지 않음.-->
	<%
	 // 잘 안된다. JSTL의 반복 처리를 배워서 하기
	for(int i=0; i<intArr.length; i++){
	%>
		${jumsu[i]}<br />
	<%	
	}
	%>
	
	3. List<br />
	<%
	List<String> list = new LinkedList<>();
	list.add("사과");
	list.add("바나나");
	list.add("오렌지");
	
	pageContext.setAttribute("list", list);
	%>
	<!-- get 메서드를 쓸 필요가 없다 -->
	${pageScope.list[0]}<br />
	${requestScope.list[0]}<br />
	${list[0] }<br />
	${list[1] }<br />
	${list[2] }<br />
	${list[3] }<br /> <!--에러가 나지 않는다. 값을 출력하지 않을뿐. -->
	
	
	4. Map <br />
	<%
	Map<String, String> map = new HashMap<>();
	map.put("id", "a001");
	pageContext.setAttribute("map", map);
	%>
	${map["id"]}
	${map.id}
	<br />
	<br />
	
	5. 자바 객체 <br />
	<%
	//자바빈 클래스를 인스턴스화 하여 객체 생성******
	StudentVO studentVO = new StudentVO();
	studentVO.setStudentNo("202107001");
	studentVO.setStudentName("개똥이");
	
	pageContext.setAttribute("student", studentVO);
	%>
	${student.studentNo}<br />
	${student.studentName}<br />
	${student["studentNo"]}<br />
	${student["studentName"]}<br />
	
	6. 산술연산사 <br />
	${5+2 } <br />
	${5-2 } <br />
	${5*2 } <br />
	<!-- 자바에선 정수인 2가 나온다면 여기선 2.5실수가 나온다 -->
<%-- 	${5/2 } <br /> ${5 div 2 } <br />  --%>
	${5%2 } <br /> ${5 mod 2 } <br />
	
	7. 논리연산자 <br />
	${5==5 && 7==7} <br /> ${5==5 and 7!=7} <br />
	${5==5 || 7==7} <br /> ${5==5 or 7!=7} <br />
	${not true } <br /> ${!true} <br /> ${!(5==5)} <br /> ${!("사과"=="사과")} <br />
	
	8. 비교 연산자 <br />
	${5==5} <br /> ${5 eq 5}<br /> <!-- Equal -->
<%-- 	${5!=5} <br /> ${5 ne 5}<br /> <!-- Not Equal --> --%>
	${5<5} <br /> ${5 lt 5}<br /> <!-- Less Than -->
	${5>5} <br /> ${5 gt 5}<br /> <!-- Greater Than -->
	${5<=5} <br /> ${5 le 5}<br /> <!-- Less Than Equal-->
	${5>=5} <br /> ${5 ge 5}<br /> <!-- Greater Than Equal-->
	
	9. null 체킹 <br />
	<!-- student라는 속성이 비어있는가? false -->
	${empty student}, ${empty studentVO2 } <br />
	
	10. 3항 연산자 <br />
	${empty param.code?"없음":param.code } <br />
	
	${1+1;5+5 } <br /> <!-- ;뒤에 있는 게 출력됨 -->
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>