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
		String name = request.getParameter("name");
		if(name.isEmpty())
			name = "작성자";
		//System.out.println(name);
		String talent = request.getParameter("talent");
		if(talent.isEmpty())
			talent = "연예인";
		//System.out.println(talent);
		String sports = request.getParameter("sports");
		if(sports.isEmpty())
			sports = "운동선수";
		//System.out.println(sports);
	%>
	<h4>작성자: <%=name %></h4>
	<h4>좋아하는 연예인: <%=talent %></h4>
	<h4>좋아하는 운동선수: <%=sports %></h4>
	<input type="button" value="처음부터 다시하기" onclick="location.href ='/02_JSP/quiz/Quiz03_1.jsp'">
</body>
</html>