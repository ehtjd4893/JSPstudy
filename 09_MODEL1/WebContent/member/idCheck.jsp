<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. 파라미터 처리
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	
	// 2. MemberDAO의 isUsableId() 호출
	boolean result = MemberDAO.getInstance().isUsableId(id);
	
	// 3. result
	//	가입 가능한 id이면 true 반환, 이미 가입된 id면 false 반환
	if(result){
		out.println("<script>");
		out.println("alert('사용 가능한 id입니다.')");
		out.println("location.href = 'joinPage.jsp?id=" + id +  "&chk=true'");
		out.println("</script>");
	}else{
		out.println("<script>");
		out.println("alert('이미 사용 중인 id입니다.')");
		out.println("location.href = 'joinPage.jsp'");
		out.println("</script>");
	}
%>