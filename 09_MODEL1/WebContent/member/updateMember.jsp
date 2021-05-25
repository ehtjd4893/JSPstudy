<%@page import="dao.MemberDAO"%>
<%@page import="dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	MemberDTO dto = (MemberDTO)session.getAttribute("loginDTO");
	String email = request.getParameter("email");
	String name = request.getParameter("name");
	
	int result1 = -1;
	if(!email.equals(dto.getEmail())){
		dto.setEmail(email);
		result1 = MemberDAO.getInstance().updateEmail(dto);
	}
	int result2 = -1;
	if(!name.equals(dto.getName())){
		dto.setName(name);
		result2 = MemberDAO.getInstance().updateName(dto);
	}
	
	

	if(result1 > 0 && result2 > 0 ){

		out.println("<script>");
		out.println("alert('이름과 이메일 변경에 성공했습니다.')");
		out.println("location.href='myPage.jsp'");
		out.println("</script>");
	}
	else if(result1 > 0 && result2 <= 0 ){
		out.println("<script>");
		out.println("alert('이메일 변경에 성공했습니다.')");
		out.println("location.href='myPage.jsp'");
		out.println("</script>");
	}
	else if(result1 <= 0 && result2 > 0 ){
		out.println("<script>");
		out.println("alert('이름 변경에 성공했습니다.')");
		out.println("location.href='myPage.jsp'");
		out.println("</script>");
	}
	
	
%>