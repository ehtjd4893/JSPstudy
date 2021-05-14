<%@page import="java.net.URLDecoder"%>
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
		// 쿠키에 주소를 저장해보자.
		// 쿠키이름: address
		
		Cookie cookie = new Cookie("address",URLEncoder.encode("서울시 마포구 서강로", "utf-8"));
		cookie.setMaxAge(60 * 60 * 24 * 7);
		response.addCookie(cookie);
	%>
	<%-- 

	 --%>
	 
	 <%--

	  --%>
	 <h3>쿠키 확인</h3>
	  쿠키 이름: <%=cookie.getName() %><br>
	  유효시간: <%=cookie.getMaxAge() %><br>
	  값: <%=URLDecoder.decode(cookie.getValue(),"utf-8") %><br>
	  
</body>
</html>