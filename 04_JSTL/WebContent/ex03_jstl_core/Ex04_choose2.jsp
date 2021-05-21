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
	<c:set var="average" value="${(param.kor + param.eng + param.mat) div 3}"/>
	<h3>평균: ${average}</h3>

	<c:if test="${average lt 60}">
		<c:set var="grade" value="F"/>
	</c:if>

	<c:if test="${average ge 60}">
		<c:set var="grade" value="D"/>
	</c:if>
	<c:if test="${average ge 70}">
		<c:set var="grade" value="C"/>
	</c:if>
	<c:if test="${average ge 80}">
		<c:set var="grade" value="B"/>
	</c:if>
	<c:if test="${average ge 90}">
		<c:set var="grade" value="A"/>
	</c:if>
	<h3>학점: ${grade}</h3>
	
	
	<%-- choose 태그로 학점 계산하기 --%>
	<%-- chhose 태그의 서브 태그인 when 태그는 else 개념을 가지고 있다. --%>
	<c:choose>
		<c:when test="${average - 90 ge 0}">	<%-- if {} --%>
			<c:set var="grade" value="A"/>
		</c:when>
		<c:when test="${average - 80 ge 0}">	<%-- else if {} --%>
			<c:set var="grade" value="B"/>
		</c:when>
		<c:when test="${average - 70 ge 0}">	<%-- else if {} --%>
			<c:set var="grade" value="C"/>
		</c:when>
		<c:when test="${average - 60 ge 0}">	<%-- else if {} --%>
			<c:set var="grade" value="D"/>
		</c:when>
		<c:otherwise>	<%-- else{} --%>
			<c:set var="grade" value="F"/>
		</c:otherwise>
	</c:choose>
	<hr>
	<h3>학점: ${grade}</h3>
</body>
</html>