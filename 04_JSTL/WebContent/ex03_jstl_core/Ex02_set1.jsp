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
	<%-- 속성(attribute)으로 request에 값을 저장 --%>
	
	<c:set var="a" value="20" scope="request"/>
	<c:set var="b" value="5" scope="request"/>

	<%--
		// 속성으로 request에 값을 저장
		// 저장된 값은 "숫자"이다.
		request.setAttribute("a", 20);
		request.setAttribute("b", 5);
	--%>
	 
	<%-- 파라미터로 request의 값을 저장 --%>
	
	
	<jsp:forward page="Ex02_set2.jsp">
		<jsp:param value="20" name="aa"/>
		<jsp:param value="5" name="bb"/>
	</jsp:forward> 
</body>
</html>