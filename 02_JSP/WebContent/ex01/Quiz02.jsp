<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 1~12월 select태그 -->
	
	<form>
		<select>
			<% for(int i = 1; i <= 12; i++){ %>
				<option value="<%=i %>"><%=i %>월</option>
			<%} %>
		</select>
	</form>
</body>
</html>