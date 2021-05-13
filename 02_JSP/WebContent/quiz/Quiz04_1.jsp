<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script>
	$(document).ready(function(){
		$('#answer').on('blur',function(){
			if(isNaN($(this).val())){
				alert('정수만 입력할 수 있습니다.');
				$(this).val('');
				$(this).focus();
			}
		});
	});
</script> -->
</head>
<body>
	<h3>랜덤 계산기</h3>
	
	<% 
		char arr[] = {'+','-','*', '%','/'};
		int a = (int)((Math.random()*9)+1);
		int b = (int)((Math.random()*9)+1);
		char x = arr[(int)((Math.random()*arr.length))];
		String question = "" + a + x + b + "=";
		int result;
		switch(x){
		case '+':
			result = a + b;
			break;
		case '-':
			result = a - b;
			break;
		case '*':
			result = a * b;
			break;
		case '/':
			result = a / b;
			break;
		case '%':
			result = a % b;
			break;
		default:
			result=0;
		}
	%>
	<form action="/02_JSP/quiz/Quiz04_2.jsp" method="post">
	
	<%=question %><input type="text" name="answer" id="answer">
	
	<input type="text" name="question" style="display:none" value=<%=question %>>
	<input type="text" name="result" style="display:none" value=<%=result %>>
	<button>제출</button>
	</form>
</body>
</html>