<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");

		Cookie c1 = new Cookie("address",URLEncoder.encode(address,"utf-8"));
		c1.setMaxAge(60*60);
		response.addCookie(c1);
		Cookie c2 = new Cookie("phone",URLEncoder.encode(phone,"utf-8"));
		c2.setMaxAge(60*60);
		response.addCookie(c2);
		Cookie c3 = new Cookie("email",URLEncoder.encode(email,"utf-8"));
		c3.setMaxAge(60*60);
		response.addCookie(c3);
		
	%>
	<h3>추가정보를 입력하세요.</h3>
	<form action="/02_JSP/quiz/Quiz06_4.jsp" method="post">
		생년월일<input type="text" name="birthday" size=5>년<input type="text" name="birthday" size=3>월<input type="text" name="birthday" size=3>일<br>
		결혼여부<input type="radio" name="married" value="no" checked>미혼<input type="radio" name="married" value="yes">기혼<br>
		직업
		<select name="job">
			<option value="developer">개발자</option>	
			<option value="no-job">무직</option>	
			<option value="student">학생</option>	
		</select>
		<button>확인</button>
	</form>
</body>
</html>