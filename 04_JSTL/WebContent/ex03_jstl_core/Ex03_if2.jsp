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
	<%--
		if문
		
		1. <c:if test="조건식"></c:if>
	 --%>
	 
	 <%-- 파라미터로 전달되고 있는 a와 b 중 큰 수 출력 --%>	 
	 ${param.a gt param.b}<br>	<!-- a와 b는 문자열이기 때문에 잘못된 비교 -->
	 ${param.a - param.b gt 0 }<br>	<!-- 올바른 비교 -->
	 
	 <%-- 파라미터로 전달되고 있는 a와 b중 큰 수 출력 --%>
	 <c:if test="${param.a - param.b gt 0}">
	 	<c:set var="max" value="${param.a}" />
	 </c:if>
	 <c:if test="${param.a - param.b lt 0}">
	 	<c:set var="min" value="${param.b}" />
	 </c:if>
	 
	 <h3>${param.a}와 ${param.b} 중 큰 수: ${max} </h3>
	 
	 
	 <c:if test="${param.a - 10 gt 0}" >
	 	<c:set var="difa" value="${param.a-10}"></c:set>
	 </c:if>
	 <c:if test="${param.a - 10 lt 0}" >
	 	<c:set var="difa" value="${10 - param.a}"></c:set>
	 </c:if>
	 
	 <c:if test="${param.b - 10 gt 0}" >
	 	<c:set var="difb" value="${param.b-10}"></c:set>
	 </c:if>
	 <c:if test="${param.b - 10 lt 0}" >
	 	<c:set var="difb" value="${10 - param.b}"></c:set>
	 </c:if>
	 
	 
	 <c:if test="${difa gt difb }">
	 	<c:set var="answer" value="${param.b}"/>
	 </c:if>
	 <c:if test="${difa le difb }">
	 	<c:set var="answer" value="${param.a}"/>
	 </c:if>
	 
	 <h3>10과 가까운 수: ${answer}</h3>
</body>
</html>