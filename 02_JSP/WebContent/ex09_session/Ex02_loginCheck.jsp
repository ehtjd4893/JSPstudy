<%@page import="ex09_session.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	// DB로 보낸다고 가정하고 빈 생성
	
	MemberDTO dto = new MemberDTO();
	dto.setId(id);
	dto.setPw(pw);
	
	// DB를 갔다 왔다고 가정
	// 여기서는 ID와 PW가 같으면 로그인 성공으로 가정
	boolean isMember = id.equals(pw);
	
	if(isMember){
		session.setAttribute("loginDTO", dto);
	}
	
	// 로그인 화면으로 돌아가기
	response.sendRedirect("/02_JSP/ex09_session/Ex02_login.jsp");
%>