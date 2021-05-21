<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	onload = function(){
		document.getElementById('btn1').onclick = function(){
			location.href = '/05_MVC/DateController';
		}
	}
</script>
</head>
<body>
	<%-- VIEW: 언제나 Servlet(Controller)에게 요청한다. --%>
	<input type="button" value="현재 날짜를 알려다오" id="btn1">
</body>
</html>