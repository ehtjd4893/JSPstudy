<%@page import="java.util.Optional"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("utf-8");
	Optional<String> opt1 = Optional.ofNullable(request.getParameter("name"));
	String name = opt1.orElse("기본이름");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		alert('이름: <%=name%>');
	</script>
</body>
</html>