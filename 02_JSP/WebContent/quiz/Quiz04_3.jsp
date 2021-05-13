
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
		String question = request.getParameter("question");
		
		int answer = request.getParameter("answer").isEmpty() ? 0 : Integer.parseInt(request.getParameter("answer"));
		int result = request.getParameter("result").isEmpty() ? 0 : Integer.parseInt(request.getParameter("result"));
		String msg = "";
		if(answer == result){
			msg += question + answer + "<br>" +  "정답입니다.";
		}
		else{
			msg += "제출: " + question + answer + "<br>" 
				+  "정답: " + question + result + "<br>" + "오답입니다.";
		}
	%>
	
	<p><%=msg %></p>
	<a href="/02_JSP/quiz/Quiz04_1.jsp">다시풀기</a>
</body>
</html>