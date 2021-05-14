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
	request.setCharacterEncoding("utf-8");
	
	String birthday = ""; 
	String[] tmp = request.getParameterValues("birthday");
	
	for(int i = 0; i < tmp.length; i++){
		birthday += tmp[i];
		if( i != tmp.length-1)
			birthday += "-";
	}
	
	String married = request.getParameter("married");
	String job = request.getParameter("job");

	Cookie c1 = new Cookie("birthday",URLEncoder.encode(birthday,"utf-8"));
	c1.setMaxAge(60*60);
	response.addCookie(c1);
	Cookie c2 = new Cookie("married",URLEncoder.encode(married,"utf-8"));
	c2.setMaxAge(60*60);
	response.addCookie(c2);
	Cookie c3 = new Cookie("job",URLEncoder.encode(job,"utf-8"));
	c3.setMaxAge(60*60);
	response.addCookie(c3);
	
/* 	Cookie[] cookies = request.getCookies();
	
	if(cookies != null && cookies.length != 0){
		for(Cookie ck : cookies){
			out.println(ck.getName() + ": " + URLDecoder.decode(ck.getValue(),"utf-8") + "<br>");
		}
	} */
	
	%>
	
	<%!
		//선언부 : 메소드를 정의하는 영역
		
		// 1. 메소드명: getCookieValue
		// 2. 반환타입: String
		// 3. 매개변수: Cookie[] cookies, String cookieName
		public String getCookieValue(Cookie[] cookies, String cookieName){
			String result = null;
			try{
			if(cookies!= null & cookies.length != 0){
				for(Cookie cookie : cookies){
					if(cookie.getName().equals(cookieName)){
						result = URLDecoder.decode(cookie.getValue(),"utf-8");
					}
				}
			}
			}catch(Exception e){
				e.printStackTrace();
			}
			return result;
		}
	%>
	<%
	Cookie[] cookies = request.getCookies();
	%>
	<h3>가입내용</h3>
	<ul>
		<li>아이디: <%=getCookieValue(cookies, "id") %></li>
		<li>비밀번호: <%=getCookieValue(cookies, "pw") %></li>
		<li>성명: <%=getCookieValue(cookies, "name") %></li>
		<li>주소: <%=getCookieValue(cookies, "address") %></li>
		<li>연락처: <%=getCookieValue(cookies, "phone") %></li>
		<li>이메일: <%=getCookieValue(cookies, "email") %></li>
		<li>생년월일: <%=birthday %></li>
		<li>결혼여부: <%=getCookieValue(cookies, "married") %></li>
		<li>직업: <%=getCookieValue(cookies, "job") %></li>
	</ul>
</body>
</html>