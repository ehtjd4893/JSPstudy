<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.Optional"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("utf-8");
	// 리다이렉트
	// 1. 기존의 request를 유지하지 않는다.
	// 2. 클라이언트에게 새로 이동할 경로를 리다이렉트해준다.
	// 3. 클라이언트가 이동할 수 있도록 컨텍스트 패스를 포함한 전체경로를 준다.
	
	// response.sendRedirect("경로");
	
	// 만약 기존의 request를 유지해서 리다이렉트하려면 새로운 파라미터를 붙여준다.
	Optional<String> opt1 = Optional.ofNullable(request.getParameter("name"));
	String name = opt1.orElse("기본이름");
	response.sendRedirect("/02_JSP/ex04/Ex03_3.jsp?name=" + URLEncoder.encode(name,"UTF-8"));
%>