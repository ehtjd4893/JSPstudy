<%@page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@page import="dao.MemberDAO"%>
<%@page import="dto.MemberDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.container{
		margin: 100px auto;
		width: 600px;
		text-align:center;
	}
	table{
		border-collapse:collapse;
		border: 1px solid black;
		width: 100%;
	}
</style>
</head>
<body>
	<%
		// ArrayList에 전체 회원 담기
		List<MemberDTO> list = MemberDAO.getInstance().searchAll();
		pageContext.setAttribute("list", list);
	%>
	<div class="container">
	<h1 style="text-align:center;">회원 목록</h1>
		<table border="1">
			<thead>
				<tr>
					<th>회원번호</th>
					<th>아이디</th>
					<th>비밀번호</th>
					<th>이름</th>
					<th>이메일</th>
					<th>가입일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="dto" items="${list}">
				<tr>	
					<td>${dto.no}</td>
					<td>${dto.id }</td>
					<td>${dto.pw}</td>
					<td>${dto.name}</td>
					<td>${dto.email}</td>
					<td>${dto.regdate }</td>
				</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="6">
						<input type="button" value="돌아가기" onclick="history.back()">
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
</body>
</html>