<%@page import="java.io.File"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
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
		/* String contextPath = application.getContextPath();
		String realPath = application.getRealPath("ex05/잔향.txt"); */
		
		String contextPath = request.getContextPath();
		String realPath = request.getServletContext().getRealPath("ex05/잔향.txt");
	%>
	
	<h3>컨텍스트 패스: <%=contextPath %></h3>
	<h3>리얼 패스: <%=realPath %></h3>
	<%
		// 잔향.txt 파일의 내용 읽어서 웹 브라우저 화면에 표시
		
		// 텍스트 파일을 읽기 위해 '문자 기반 입력 스트림' 생성
		File file = new File(realPath);
		BufferedReader br = new BufferedReader(new FileReader(file));
		String gasa = "";
		while(true){
			String line= br.readLine();
			if(line == null)
				break;
			else{
				gasa+= (line + "<br>");
			}
			
				
		}
			if(br != null)
				br.close();
	%>
	<h1>잔향</h1>
	<%= gasa %>
</body>
</html>