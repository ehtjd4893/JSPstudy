<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8");

	if(request.getParameter("agreement").equalsIgnoreCase("y")){
			request.getRequestDispatcher("Quiz05_5.jsp").forward(request,response);		
	}
	else{
		request.getRequestDispatcher("Quiz05_4.jsp").forward(request,response);
	}
%>
