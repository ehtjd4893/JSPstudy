<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h1{color:skyblue;}

</style>

<%	

	String[][] sites = {
			{"구글", "https://www.google.com/"},
			{"네이버", "https://www.naver.com/"},
			{"다음", "https://www.daum.net/"},
			{"네이트", "https://www.nate.com/"}
	};
	
%>
</head>
<body>
	<h1>Quiz01.jsp</h1>

	
	<h3><i class="fas fa-hand-pointer"></i>이동하고자 하는 사이트 명을 선택하고 확인 버튼을 누르세요.</h3>

	<form action="/02_JSP/quiz/Quiz01_2.jsp" name="f">
		<select name="site" >
			<% for(int i = 0; i < sites.length; i++){ %>
				<option value="<%=sites[i][1] %>"><%=sites[i][0] %></option>
			<%} %>
		</select>
		<button>선택완료</button>
	</form>
</body>
</html>