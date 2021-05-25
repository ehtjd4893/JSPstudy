<%@page import="dao.MemberDAO"%>
<%@page import="dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	// DB로 보낼 DTO 생성
	MemberDTO dto = new MemberDTO();
	dto.setId(id);
	dto.setPw(pw);
	
	// DAO의 login() 메소드 호출
	MemberDTO loginDTO = MemberDAO.getInstance().login(dto);
	
	// 로그인이 되었다면 loginDTO(로그인 될 회원 정보)를 session에 올린다.
	if(loginDTO != null){
		session.setAttribute("loginDTO", loginDTO);
		response.sendRedirect("/09_MODEL1/index.jsp");	
	}else{
		out.println("<script>");
		out.println("alert('회원 정보를 확인하세요.')");
		out.println("history.back()");
		out.println("</script>");
	}

%>