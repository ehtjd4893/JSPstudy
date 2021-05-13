<%@page import="java.io.File"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
	<%
		request.setCharacterEncoding("utf-8");	
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		
		String directory = application.getRealPath("/quiz");
		String filename = id + ".txt";
		File file = new File(directory, filename);
		BufferedWriter bw = new BufferedWriter(new FileWriter(file));
		String msg = "가입 아이디:" +id +"\n가입 비밀번호: " + pw + "\n가입 성명: "+ name;
		bw.write(msg);
		bw.flush();
		//System.out.println(file.toString());
		if(bw != null)
			bw.close();
		System.out.println(id);
	%>

<script>
	$(function(){
		$('#delete').on('click',function(){
			if(confirm('정말 탈퇴하시겠습니까?')){					
				location.href = '/02_JSP/quiz/Quiz05_6.jsp?id=' + '<%=id%>';
			}
		});
	})
</script>
</head>
<body>
	<h1>가입되었습니다.</h1>
	<h3>가입내용</h3>

	<%=msg.replaceAll("\n", "<br>") %><br>
	<input type="button" id="delete" value="탈퇴">
</body>
</html>