<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="Quiz04_error.jsp" %>

	<%
		request.setCharacterEncoding("utf-8");
		String question = request.getParameter("question");
		
		int answer = request.getParameter("answer").isEmpty() ? 0 : Integer.parseInt(request.getParameter("answer"));
		int result = request.getParameter("result").isEmpty() ? 0 : Integer.parseInt(request.getParameter("result"));
		
		request.getRequestDispatcher("Quiz04_3.jsp").forward(request,response);
	%>