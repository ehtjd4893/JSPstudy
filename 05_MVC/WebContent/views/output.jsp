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
	<h3>요청한 현재 날짜는 ${today}입니다.</h3>
	<h3>요청한 현재 시간은 ${time}입니다.</h3>
	<h3>요청한 로또 번호는 
	<c:forEach var="item" items="${lotto}">
		${item}&nbsp;
	</c:forEach>
	입니다.</h3>
	
	<h3>
		${gugudan}
	</h3>
	
	<h3>맥주 요청하면 들을 대답: ${answer}</h3>
	
	<h3> 식사메뉴: ${meal}</h3>
</body>
</html>