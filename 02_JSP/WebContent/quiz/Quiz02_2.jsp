<%@page import="java.util.Optional"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page errorPage="Quiz02_error.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	Optional<String> opt1 = Optional.ofNullable(request.getParameter("age"));
	int age = Integer.parseInt(opt1.orElse("0"));
	
	if(age > 19){
		request.getRequestDispatcher("Quiz02_3.jsp").forward(request,response);
	}else{
		request.getRequestDispatcher("Quiz02_4.jsp").forward(request,response);
	}
%>