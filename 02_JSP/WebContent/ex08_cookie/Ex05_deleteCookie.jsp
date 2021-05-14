<%@page import="java.net.URLDecoder"%>
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
		// 쿠키명이 "address"인 쿠키를 삭제
		
		// 1. 삭제할 쿠키를 만든다.
		// 삭제할 쿠키는 유효시간을 0으로 세팅
		Cookie cookie = new Cookie("address",null);
		cookie.setMaxAge(0);
		
		// 2. 삭제할 쿠키를 저장한다.(기존 쿠키가 덮어쓰기 된다.)
		response.addCookie(cookie);
		
		Cookie[] cookies = request.getCookies();
		if(cookies != null && cookies.length != 0){
			for(Cookie ck : cookies){
				out.println("쿠키이름: " + ck.getName() + "<br>");
	 			out.println("유효시간: " + ck.getMaxAge() +"<br>");
	 			out.println("쿠키값: " + URLDecoder.decode(ck.getValue(),"utf-8") +"<br>");
			}
		}
	%>
</body>
</html>