<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("utf-8"); %>


<%--
	EL 크기 비교 연산자 특징
	
	1. 문자열이 전달되면 "사전 편찬 순"으로 비교한다.
	2. 숫자가 전달되면 숫자의 크기를 비교한다.
	3. 문자열이 전달되는 경우를 대비해서 크기 비교는 아래와 같이 한다.
		${a > b} => ${a-b > 0}
		${a < b} => ${b-a > 0}
 --%>
	<h3>a: ${a}</h3>
	<h3>b: ${b}</h3>
	${a} + ${b} = ${a + b}<br>
	${a} - ${b} = ${a - b}<br>
	${a} * ${b} = ${a * b}<br>
	${a} / ${b} = ${a div b}<br>
	${a} % ${b} = ${a mod b}<br>
	
	${a} &gt; ${b} = ${a - b gt 0}<br>
	${a} &ge; ${b} = ${a - b ge 0}<br>
	${a} &lt; ${b} = ${b - a gt 0}<br>
	${a} &le; ${b} = ${b - a ge 0}<br>
	${a} == ${b} = ${a eq b}<br>
	${a} &ne; ${b} = ${a ne b}<br>
	${a} == null = ${empty a}<br>	<%-- empty : null, 크기가 0 --%>
	a와 b 중 큰 값 ${a - b gt 0 ? a : b}<br>
	<hr>

	
</body>
</html>