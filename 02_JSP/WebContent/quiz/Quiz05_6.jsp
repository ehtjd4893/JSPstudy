<%@page import="java.io.File"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
	<%
		request.setCharacterEncoding("utf-8");

		String directory = application.getRealPath("/quiz");
		String filename = request.getParameter("id") + ".txt";
		File file = new File(directory, filename);
		//System.out.println(file);
	%>


		<% 
			String info = "";
			if(file.exists()){
				file.delete();
				info += "계정 삭제을 완료했습니다.";
			}else{
				info += "존재하지 않는 계정입니다.";
			}
		%>
		<script>
		alert('<%=info%>');
		location.href="/02_JSP/quiz/Quiz05_1.jsp";
		</script>
</head>
<body>

</body>
</html>