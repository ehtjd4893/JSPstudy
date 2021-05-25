<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	
	<script>
		$(function(){
			const f = $('#f');
			const id = $('#id');
			const pw = $('#pw');
			const pw2 = $('#pw2');
			const name = $('#name');
			const email = $('#email');
			const check_btn = $('#check_btn');
			
			check_btn.on('click',function(){
				if(id.val() == ''){
					alert('ID를 먼저 입력하세요.');
					id.focus();
					return;
				}
				location.href = 'idCheck.jsp?id=' + id.val();
			})
			

			f.on('submit',function(event){
				if(id.val() == '' || pw.val() == '' || email.val() == ' '){
					alert('필수 정보를 입력하세요.');
					event.preventDefault();
					return false;
				}else if(pw.val() != pw2.val()){
					alert('비밀번호 입력을 확인하세요.');
					return false;
				}else if('${param.chk}' != 'true'){
					alert('아이디 중복체크를 진행하세요.');
					event.preventDefault();
					return false;
				}
			})
			
			$('#cancel_btn').on('click',function(){
				location.href='../index.jsp';
			})
		})
		
	</script>
	

	<style>
		.container {
			width: 500px;
			margin: 0 auto;
		}
	</style>

</head>
<body>
	<div class="container">
		
		<header>
			<h1>회원 가입하기</h1>
		</header>
		<section>
			<form id="f" method="post" action="join.jsp">
				<label for="id">아이디</label><br>
				<c:if test="${empty param.id}">
					<input type="text" name="id" id="id">
				</c:if>				
				<c:if test="${not empty param.id}">
					<input type="text" name="id" id="id" value="${param.id}">
				</c:if>
				
				<input type="button" value="중복확인" id="check_btn"><br>
				<label for="pw">비밀번호</label><br>
				<input type="password" name="pw" id="pw"><br>
				<label for="pw">비밀번호 확인</label><br>
				<input type="password" name="pw2" id="pw2"><br>
				<label for="name">이름</label><br>
				<input type="text" name="name" id="name"><br>			
				<label for="name">이메일</label><br>
				<input type="text" name="email" id="email"><br>
				<button>가입하기</button>
				<input type="reset" value="입력초기화">
				<input type="button" value="가입취소하기" id="cancel_btn">
			</form>
		</section>
		
	</div>
</body>
</html>