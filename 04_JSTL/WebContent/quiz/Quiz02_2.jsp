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
	<%
		request.setCharacterEncoding("utf-8"); 
/* 		String[] chks = request.getParameterValues("check");
		pageContext.setAttribute("chks", chks); */
	%>
	<c:forEach var="i" begin="${param.min}" end="${param.max}" step="1">
		<font size="${i}">
			폰트 사이즈: ${i}
		</font><br>
	</c:forEach>
	
	<ul>
	<c:forEach var="food" items="${paramValues.foods}" varStatus="k">
		<li> ${k.count}번째 음식: ${food}</li>	
	</c:forEach>
	</ul>
</body> 
</html>