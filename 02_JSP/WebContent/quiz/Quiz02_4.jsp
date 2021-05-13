<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>미성년자</h1>
	<pre>당신의 나이는 <%=request.getParameter("age") %>살이므로 주류 구매가 불가능합니다.</pre>
	<!-- forward는 이동경로(url)가 변하지 않기 때문에, history.back(-2)가 아니다.  -->
	<a href="#" onclick=history.back()>처음으로 이동</a>
</body>
</html>