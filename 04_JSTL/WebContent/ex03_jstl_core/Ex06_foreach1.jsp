<%@page import="ex03_jstl_core.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	List<BoardDTO> list = new ArrayList<>();
	list.add(new BoardDTO("1111","공지사항","전기 끊깁니다.","관리자",0));
	list.add(new BoardDTO("1112","필독","가스 끄고 나갑시다.","안전관리자",0));
	list.add(new BoardDTO("1113","협조","재활용을 화금일","부녀회장",5));
	
	request.setAttribute("list",list);
	request.getRequestDispatcher("Ex06_foreach2.jsp").forward(request, response);

%>