<%@page import="java.io.File"%>
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
	boolean go = true;
	if(!(new File(application.getRealPath("/quiz") ,request.getParameter("id") +".txt")).exists()){
		go = false;
	}
%>
	<script>
		<% if(go){%>
			alert('<%= request.getParameter("id")%>는 이미 존재하는 id입니다.');
			history.back();
		<% } %>
	</script>
	<pre>
-----------------------------------------------------
1. 회원정보는 웹 사이트 운영을 위해서만 사용됩니다.
2. 원치 않으면 정보 제공을 하지 않을 수 있습니다.
3. 다만 이 경우 정상적인 웹 사이트 이용이 제한됩니다.
-----------------------------------------------------
	</pre>
	<form  action="/02_JSP/quiz/Quiz05_3.jsp" method="post">
		위 약관에 동의하십니까? <br><br>
		<input type="radio" name="agreement" value="y" >동의 함
		<input type="radio" name="agreement" value="n" checked>동의하지 않음
		<input type="text" name="id" style="display:none" value=<%=request.getParameter("id") %>><br>
		<input type="password" name="pw" style="display:none" value=<%=request.getParameter("pw") %>><br>
		<input type="text" name="name" style="display:none" value=<%=request.getParameter("name") %>><br>
		<button>회원 가입</button>
	</form>
</body>
</html>