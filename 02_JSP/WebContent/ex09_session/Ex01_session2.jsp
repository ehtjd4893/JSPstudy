<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = "입력 없음";
	if(session.getAttribute("name") != null){
		name = (String)session.getAttribute("name");
	}
	
	int age = 0;
	if(session.getAttribute("age") != null){
		age = (int)session.getAttribute("age");
	}
	
	
	out.println("이름: " + name + "<br>"); 
	out.println("나이: " + age + "<br>");
	out.println("<a href=\"Ex01_session3.jsp\">세션 삭제하기");
%>