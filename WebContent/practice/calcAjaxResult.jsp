<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%!
	
	public int add(int a, int b){
		return (a + b);
	}
	public int subtract(int a, int b){
		return (a - b);
	}
	public int multiple(int a, int b){
		return (a * b);
	}
	public double division(double a, double b){
		return (a / b);
	}

%>
<%
	String resultStr = "0";
	int answer_int = 0;
	double answer_double = 0.0;
	
	int a = Integer.parseInt(request.getParameter("a")==null?"0":request.getParameter("a"));
	int b = Integer.parseInt(request.getParameter("b")==null?"0":request.getParameter("b"));
	String sik = request.getParameter("sik")==null?"+":request.getParameter("sik");
	
	if(sik.equals("+")){
		answer_int = add(a, b);
	}else if(sik.equals("-")){
		answer_int = subtract(a, b);
	}else if(sik.equals("*")){
		answer_int = multiple(a, b);
	}else{
		answer_double = division((double)a, (double)b);
	}
	
	if(answer_double != 0.0){
		resultStr = a + " " + sik + " " + b + " = " + answer_double;
	}else{
		resultStr = a + " " + sik + " " + b + " = " + answer_int;
	}
	
%>

<%=resultStr %>