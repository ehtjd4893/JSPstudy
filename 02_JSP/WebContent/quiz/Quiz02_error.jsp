<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- 이 페이지는 에러 페이지이다. --%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>잘못된 입력</h1>
	<div>
		요청을 처리하는 과정에서 에러가 발생했습니다.<br><br>
		예외 타입: <%=exception.getClass().getName() %>
		예외 메세지: <%=exception.getMessage() %>
		<br><br>
		<a href="mailto:admin@home.com">오류 신고하기</a>
		<a href="/02_JSP/quiz/Quiz02_1.jsp">처음부터 다시 하기</a>
	</div>
</body>
</html>