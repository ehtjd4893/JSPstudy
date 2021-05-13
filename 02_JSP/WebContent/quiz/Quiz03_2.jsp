<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	if(name.isEmpty())
		name = "작성자";
	String talent = request.getParameter("talent");
	if(talent.isEmpty())
		talent = "연예인";
%>
<style>
	
</style>
</head>
<body>
	<h3>좋아하는 운동선수는 누구인가요?</h3>
	<form action="/02_JSP/quiz/Quiz03_3.jsp">
	<input type="text" name="sports">
	<input type="text" name="name" value=<%=name %>  style="display:none">
	<input type="text" name="talent" value=<%=talent %>  style="display:none">	
	<button>결과보기</button>
	</form>
</body>
</html>